/* (C) Simon Stapleton, some minor bug fixes (C) Julio Sangrador */

/*
This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA. 
*/
#include "glulxa.h"

long *offset = NULL;
char *block = NULL;
long stacksize = 0;

void
Assemble ()
{
  char buf[10][MAX_OPERAND];
  unsigned char amode;
  char *p1, *tempbuf, *tempc, tname[128];
  int tokens, tempaddr, temp, temp2, tline;
  long tempnum, iter, theaddr, addrmodeoffset, nextopcode, bc;
  label *templabel;
  opcode *tempopcode;

  asserrors = 0;


  RewindFiles ();

  while (GetNextLine () != EOF)
    {
	  
      /* Check for cpp output lines */
      if (inputline[0] == '#')
	{
	  sscanf (inputline, " # %d \"%s\"", &tline, tname);
	  linenum = tline - 1;
	  strcpy (filename, tname);
	}
      else
	{
	  if ((p1 = strpbrk (inputline, ";")) != NULL)
	    (*p1) = '\0';

	  tokens = sscanf (inputline,
			   " %s %s %s %s %s %s %s %s %s %s",
			   buf[0], buf[1], buf[2], buf[3], buf[4],
			   buf[5], buf[6], buf[7], buf[8], buf[9]);

	  temp = 0;

	  /* Did we get any tokens? */
	  if (tokens)
	    {
	      /* Is the first token a label? */
	      if (IsLabel (buf[temp], &templabel))
		{
		  /* Pass 1 ? If so, store new labels */
		  if ((pass == 1) && (templabel == NULL))
		    StoreNewLabel (buf[temp], *offset, section, segment);

		  /* Either way, we want to skip it */
		  temp++;
		}

	      if (temp < tokens)
		{
		  /* Now we should have an opcode or something similar */
		  if (!IsOpCode (buf[temp], &tempopcode))
		    {
		      printf ("ERROR - Unparseable - File %s, line %d\n",
			      filename, linenum);
		      asserrors++;
		    }
		  else
		    {
		      switch (tempopcode->code)
			{
			case SEC_DIR:
			  if (strcmp (buf[temp + 1], "vcode") == 0)
			    {
			      section = RAM;
			      segment = CODE;
			      offset = &ramroutsize;
			      block = ramroutblock;
			      BlockBase = headsize + romrsize + romdsize;
			    }
			  else if (strcmp (buf[temp + 1], "code") == 0)
			    {
			      section = ROM;
			      segment = CODE;
			      offset = &romroutsize;
			      block = romroutblock;
			      BlockBase = headsize;
			    }
			  else if (strcmp (buf[temp + 1], "vdata") == 0)
			    {
			      section = RAM;
			      segment = DATA;
			      offset = &ramdatasize;
			      block = ramdatablock;
			      BlockBase =
				headsize + romrsize + romdsize + ramrsize;
			    }
			  else if (strcmp (buf[temp + 1], "data") == 0)
			    {
			      section = ROM;
			      segment = DATA;
			      offset = &romdatasize;
			      block = romdatablock;
			      BlockBase = headsize + romrsize;
			    }
			  else
			    {
			      printf
				("ERROR - Bad section directive - File %s, line %d\n",
				 filename, linenum);
			      asserrors++;
			    }

			  break;

			case STK_DIR:
			  ParseNumber (buf[temp + 1], &stacksize);

			  break;

			case EXT_DIR:
			  ParseNumber (buf[temp + 1], &extsize);

			  break;

			case DCB_DIR:
			  for (iter = temp + 1; iter < tokens; iter++)
			    {
			      /* Must handle strings here */
			      if (IsString (buf[iter]))
				{
				  if (pass > 1)
				    {
				      DumpString (buf[iter]);
				      goto done;
				    }
				  else
				    {
				      (*offset) += 1;

				      for (tempc = inputline; *tempc != '\"';
					   tempc++);
				      tempc++;
				      for (; *tempc != '\"'; (*offset) += 1)
					{
					  if ((*tempc == '\\')
					      && (*(tempc + 1) == 'n'))
					    (*offset) -= 1;
					  tempc++;
					}
				       /*OJO*/ (*offset) += 1;
				      goto done;
				    }
				}
			      else
				{
				  if (pass > 1)
				    {
				      ParseNumber (buf[iter], &tempnum);
				      DumpByte (tempnum);
				    }
				  else
				    (*offset) += 1;
				}

			    }
			done:

			  break;

			case DCW_DIR:
			  for (iter = temp + 1; iter < tokens; iter++)
			    {
			      if (pass > 1)
				{
				  ParseNumber (buf[iter], &tempnum);
				  DumpWord (tempnum);
				}
			      else
				(*offset) += 2;
			    }

			  break;

			case DCL_DIR:
			  for (iter = temp + 1; iter < tokens; iter++)
			    {
			      if (pass > 1)
				{
				   /*OJO*/	/*ParseNumber (buf[iter], &tempnum); */
				    ParseValue (buf[iter], &tempnum);
				  DumpLong (tempnum);
				}
			      else
				(*offset) += 4;
			    }
			  break;

			case DSB_DIR:
			  ParseNumber (buf[temp + 1], &tempnum);
			  (*offset) += tempnum;
			  break;

			case DSW_DIR:
			  ParseNumber (buf[temp + 1], &tempnum);
			  (*offset) += tempnum * 2;
			  break;

			case DSL_DIR:
			  ParseNumber (buf[temp + 1], &tempnum);
			  (*offset) += tempnum * 4;
			  break;

			default:
			  /* Are we really assembling yet? */
			  if (pass > 1)
			    {
			      /* First, dump out the opcode */
			      if (tempopcode->code < 0x7F)
				DumpByte (tempopcode->code);
			      else if (tempopcode->code < 0x3fff)
				DumpWord ((tempopcode->code) | 0x8000);
			      else
				DumpLong ((tempopcode->code) | 0xc0000000);

			      /* Now, how many operands do we have */
			      addrmodeoffset = *offset;

			      switch (tempopcode->operands)
				{
				case 0:
				  break;
				case 1:
				case 2:
				  (*offset) += 1;
				  block[addrmodeoffset] = '\0';
				  break;
				case 3:
				case 4:
				  (*offset) += 2;
				  block[addrmodeoffset] = '\0';
				  block[addrmodeoffset + 1] = '\0';
				  break;
				case 5:
				case 6:
				  (*offset) += 3;
				  block[addrmodeoffset] = '\0';
				  block[addrmodeoffset + 1] = '\0';
				  block[addrmodeoffset + 2] = '\0';
				  break;
				default:
				  (*offset) += 4;
				  block[addrmodeoffset] = '\0';
				  block[addrmodeoffset + 1] = '\0';
				  block[addrmodeoffset + 2] = '\0';
				  block[addrmodeoffset + 3] = '\0';
				  break;
				}

			      for (iter = 0; iter < tempopcode->operands;
				   iter++)
				{
				  if ((temp + 1 + iter) > tokens)
				    {
				      printf
					("ERROR - Too few operands - File %s, line %d\n",
					 filename, linenum);
				      asserrors++;
				      break;
				    }

				  tempbuf = buf[temp + 1 + iter];
				  amode = ParseOperand (tempbuf, &theaddr);

				  /* Now, a nasty hack for the jump-type operands */
				  /* these are all between 0x20 and 0x2F, except for catch (0x32) */
				  if (tempopcode->code == 0x32 ||
					  (((tempopcode->code & 0xFF) >= 0x20)
				      && ((tempopcode->code & 0xFF) <= 0x2F)))
				    {
				      /* We're only interested in absolute addressing.  */
				      /* Assume all others relate to a computed address */
				      if ((amode == ADDR_ABSB)
					  || (amode == ADDR_ABSW)
					  || (amode == ADDR_ABSL))
					{
					  /* Special case each opcode */
					  switch (tempopcode->code & 0xFF)
					    {
					    case 0x20:
					      /* jump - Only one operand so this must be the one */
					      if ((theaddr == 0)
						  || (theaddr == 1))
						break;

					      nextopcode = (*offset) +
						((amode ==
						  ADDR_ABSB) ? 1 : ((amode ==
								     ADDR_ABSW)
								    ? 2 : 4))
						+ BlockBase;

					      theaddr =
						theaddr - nextopcode + 2;

					      bc = labs (theaddr);
					      if (bc >
						  (unsigned
						   long) ((amode ==
							   ADDR_ABSB) ? 0xFF
							  : ((amode ==
							      ADDR_ABSW) ?
							     0xFFFF :
							     0xFFFFFFFF)))
						printf
						  ("Error - Relative jump too big - File %s, line %d\n",
						   filename, linenum);

					      break;

					    case 0x22:
					    case 0x23:
						case 0x32:
					      /* Only deal with second operand */
					      if (iter != 1)
						break;
					      if ((theaddr == 0)
						  || (theaddr == 1))
						break;

					      nextopcode = (*offset) +
						((amode ==
						  ADDR_ABSB) ? 1 : ((amode ==
								     ADDR_ABSW)
								    ? 2 : 4))
						+ BlockBase;

					      theaddr =
						theaddr - nextopcode + 2;
					      bc = labs (theaddr);
					      if (bc >
						  (unsigned
						   long) ((amode ==
							   ADDR_ABSB) ? 0xFF
							  : ((amode ==
							      ADDR_ABSW) ?
							     0xFFFF :
							     0xFFFFFFFF)))
						printf
						  ("Error - Relative jump too big - File %s, line %d\n",
						   filename, linenum);
					      break;

					    case 0x24:
					    case 0x25:
					    case 0x26:
					    case 0x27:
					    case 0x28:
					    case 0x29:
						case 0x2A:
						case 0x2B:
						case 0x2C:
						case 0x2D:
					      /* only deal with third operand */
					      if (iter != 2)
						break;
					      if ((theaddr == 0)
						  || (theaddr == 1))
						break;

					      nextopcode = (*offset) +
						((amode ==
						  ADDR_ABSB) ? 1 : ((amode ==
								     ADDR_ABSW)
								    ? 2 : 4))
						+ BlockBase;

					      theaddr =
						theaddr - nextopcode + 2;
					      bc = labs (theaddr);
					      if (bc >
						  (unsigned
						   long) ((amode ==
							   ADDR_ABSB) ? 0xFF
							  : ((amode ==
							      ADDR_ABSW) ?
							     0xFFFF :
							     0xFFFFFFFF)))
						printf
						  ("Error - Relative jump too big - File %s, line %d\n",
						   filename, linenum);
					      break;

					    default:
					      printf
						("BUG- unable to deal with jump-type opcode %x, - File %s, line %d\n",
						 tempopcode->code, filename,
						 linenum);
					      break;
					    }
					}
				    }

				  switch (amode)
				    {
				    case ADDR_ERR:
				      printf
					("Error - Bad addressing mode - %s - File %s, line %d\n",
					 tempbuf, filename, linenum);
				      asserrors++;
				      break;
				    case ADDR_NULL:
				    case ADDR_SP:
				      break;

				    case ADDR_ABSB:
				    case ADDR_ADDB:
				    case ADDR_CFLB:
				    case ADDR_RAMB:
				      DumpByte (theaddr);
				      break;

				    case ADDR_ADDW:
				    case ADDR_ABSW:
				    case ADDR_CFLW:
				    case ADDR_RAMW:
				      DumpWord (theaddr);
				      break;

				    case ADDR_ABSL:
				    case ADDR_ADDL:
				    case ADDR_CFLL:
				    case ADDR_RAML:
				      DumpLong (theaddr);
				      break;
				    }
				  /* Now dump the addressing mode.  tricksy, this. */
				  if ((iter) & 1)
				    {
				      block[addrmodeoffset] =
					block[addrmodeoffset] | (amode << 4);
				      addrmodeoffset++;
				    }
				  else
				    {
				      block[addrmodeoffset] =
					block[addrmodeoffset] | amode;
				    }
				}
			    }
			  else
			    {
			      /* merely calculate the size */
			      /* First, the opcode */
			      if (tempopcode->code < 0x7F)
				(*offset) += 1;
			      else if (tempopcode->code < 0x3fff)
				(*offset) += 2;
			      else
				(*offset) += 4;

			      /* Now, how many operands do we have */
			      switch (tempopcode->operands)
				{
				case 0:
				  break;
				case 1:
				case 2:
				  (*offset) += 1;
				  break;
				case 3:
				case 4:
				  (*offset) += 2;
				  break;
				case 5:
				case 6:
				  (*offset) += 3;
				  /*OJO*/ break;
				default:
				  (*offset) += 4;
				  break;
				}

			      /* now the operands */
			      for (iter = 0; iter < tempopcode->operands;
				   iter++)
				{
				  if ((temp + 1 + iter) > tokens)
				    {
				      printf
					("ERROR - Too few operands - File %s, line %d\n",
					 filename, linenum);
				      asserrors++;
				      break;
				    }

				  tempbuf = buf[temp + 1 + iter];

				  amode = ParseOperand (tempbuf, &theaddr);
				  switch (amode)
				    {
				    case ADDR_ERR:
				      printf
					("Error - Bad addressing mode - %s - File %s, line %d\n",
					 tempbuf, filename, linenum);
				      asserrors++;
				      break;
				    case ADDR_NULL:
				    case ADDR_SP:
				      break;

				    case ADDR_ABSB:
				    case ADDR_ADDB:
				    case ADDR_CFLB:
				    case ADDR_RAMB:
				      (*offset) += 1;
				      break;

				    case ADDR_ADDW:
				    case ADDR_ABSW:
				    case ADDR_CFLW:
				    case ADDR_RAMW:
				      (*offset) += 2;
				      break;

				    case ADDR_ABSL:
				    case ADDR_ADDL:
				    case ADDR_CFLL:
				    case ADDR_RAML:
				      (*offset) += 4;
				      break;
				    }
				}
			    }
			}
		    }
		}
	    }
	}
    }
}

void
StoreNewLabel (char *name, long offset, int section, int segment)
{
  label *thislabel, *newlabel;

  newlabel = malloc (sizeof (label));

  if (newlabel == NULL)
    {
      if ((errno == ENOMEM) || (errno == EAGAIN))
	{
	  printf ("FATAL - Unable to allocate %d bytes of memory for label\n",
		  sizeof (label));
	  exit (-1);
	}
    }

  newlabel->offset = offset;
  newlabel->segment = segment;
  newlabel->section = section;
  strcpy (newlabel->name, name);
  newlabel->next = NULL;

  if (labeltable)
    {
      for (thislabel = labeltable;
	   thislabel->next != NULL; thislabel = thislabel->next);

      thislabel->next = newlabel;
    }
  else
    labeltable = newlabel;
}
