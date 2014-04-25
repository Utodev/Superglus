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

void
AllocateMemory ()
{
  //headersize = 4 * (9 + 5);
  headersize = 4 * (9);

  /* Quick hack by Yokiyoki to try & fix the checksum.
     May add up to 6 bytes to the game file. */

  if ((ramroutsize) % 4)
    ramroutsize =
      ((((ramroutsize) / 4) + 1) * 4);

  if ((romroutsize) % 4)
    romroutsize =
      ((((romroutsize) / 4) + 1) * 4);

  /* End of quick hack. */

  if ((ramdatasize + ramroutsize) % 256)
    ramdatasize =
      ((((ramroutsize + ramdatasize) / 256) + 1) * 256) - ramroutsize;

  ramdatablock = malloc (ramdatasize);
  if (ramdatablock == NULL)
    {
      if ((errno == ENOMEM) || (errno == EAGAIN))
	{
	  printf
	    ("FATAL - Unable to allocate %d bytes of memory for RAM data\n",
	     ramdatasize);
	  exit (-1);
	}
    }
  memset (ramdatablock, 0, ramdatasize);

  if ((romdatasize + romroutsize + headersize) % 256)
    romdatasize =
      ((((romdatasize + romroutsize + headersize) / 256) + 1) * 256) -
      romroutsize - headersize;

  romdatablock = malloc (romdatasize);
  if (romdatablock == NULL)
    {
      if ((errno == ENOMEM) || (errno == EAGAIN))
	{
	  printf
	    ("FATAL - Unable to allocate %d bytes of memory for ROM data\n",
	     romdatasize);
	  exit (-1);
	}
    }
  memset (romdatablock, 0, romdatasize);

  ramroutblock = malloc (ramroutsize);
  if (ramroutblock == NULL)
    {
      if ((errno == ENOMEM) || (errno == EAGAIN))
	{
	  printf
	    ("FATAL - Unable to allocate %d bytes of memory for RAM routines\n",
	     ramroutsize);
	  exit (-1);
	}
    }
  memset (ramroutblock, 0, ramroutsize);

  romroutblock = malloc (romroutsize);
  if (romroutblock == NULL)
    {
      if ((errno == ENOMEM) || (errno == EAGAIN))
	{
	  printf
	    ("FATAL - Unable to allocate %d bytes of memory for ROM routines\n",
	     romroutsize);
	  exit (-1);
	}
    }
  memset (romroutblock, 0, romroutsize);

  headerblock = malloc (headersize);
  if (headerblock == NULL)
    {
      if ((errno == ENOMEM) || (errno == EAGAIN))
	{
	  printf
	    ("FATAL - Unable to allocate %d bytes of memory for header\n",
	     headersize);
	  exit (-1);
	}
    }
  memset (headerblock, 0, headersize);

  ramrsize = ramroutsize;
  ramdsize = ramdatasize;
  romrsize = romroutsize;
  romdsize = romdatasize;
  headsize = headersize;

}

void
DumpString (char *buf)
{
  char *temp;

  DumpByte ((long) 0xE0);

  for (temp = inputline_backup; *temp != '\"'; temp++);

  temp++;

  for (; *temp != '\"'; temp++)
    {
      if (*temp == '\\')
	{
	  if (*(temp + 1) == 'n')
	    {
	      temp++;
	      DumpByte ((long) (0x0a));
	    }
	  else
	    {
	      DumpByte ((long) ('\\'));
	    }
	}
      else
	DumpByte ((long) (*temp));
    }

  DumpByte ((long) 0);

}

void
DumpByte (long num)
{
  block[(*offset)++] = (char) (num & 0xFF);
}

void
DumpWord (long num)
{
  block[(*offset)++] = (char) ((num & 0xFF00) / 256);
  block[(*offset)++] = (char) (num & 0xFF);
}

void
DumpLong (long num)
{
  block[(*offset)++] = (char) ((num & 0xFF000000l) / 16777216);
  block[(*offset)++] = (char) ((num & 0xFF0000) / 65536);
  block[(*offset)++] = (char) ((num & 0xFF00) / 256);
  block[(*offset)++] = (char) (num & 0xFF);
}

void
CorrectLabels (void)
{
  label *temp;

  for (temp = labeltable; temp != NULL; temp = temp->next)
    {
      switch (temp->section)
	{
	case RAM:
	  switch (temp->segment)
	    {
	    case DATA:
	      temp->offset =
		temp->offset + headsize + romrsize + romdsize + ramrsize;
	      break;
	    case CODE:
	      temp->offset = temp->offset + headsize + romrsize + romdsize;
	      break;
	    }
	  break;
	case ROM:
	  switch (temp->segment)
	    {
	    case DATA:
	      temp->offset = temp->offset + headsize + romrsize;
	      break;
	    case CODE:
	      temp->offset = temp->offset + headsize;
	      break;
	    }
	  break;
	}
    }
}

void
InitHeader ()
{
  label *pos;

  block = headerblock;
  (*offset) = 0;

  /* 'Glul' */
  DumpLong (0x476c756cL);
  /* Version */
  DumpLong (0x00020000);
  /* RamStart */
  DumpLong (headsize + romrsize + romdsize);
  /* Extstart */
  DumpLong (headsize + romrsize + romdsize + ramrsize + ramdsize);
  /* EndMem */
  DumpLong (headsize + romrsize + romdsize + ramrsize + ramdsize + extsize);
  /* Stacksize */
  DumpLong (stacksize);
  /* start function */
  if ((IsLabel (":main", &pos)) && pos)
    DumpLong (pos->offset);
  else
    {
      printf ("FATAL - No :main defined\n");
      exit (-1);
    }

  /* string table */
  if ((IsLabel (":string_decoding_table", &pos)) && pos)
    DumpLong (pos->offset);
  else
    DumpLong (0);

  /* temp checksum */
  DumpLong (0);
}

long
SumBlock (char *theblock, long blocklen, long *total)
{
  /*long *num;

  for (num = (long *) theblock; num < ((long *) (theblock + blocklen)); num++) {
    (*total) += (*num);
    }*/

  unsigned long i;
  unsigned long b1, b2, b3, b4;
  long temp;
  for (i = 0; i < blocklen; i+=4) {
    b1 = (unsigned char)theblock[i];
    b2 = (unsigned char)theblock[i+1];
    b3 = (unsigned char)theblock[i+2];
    b4 = (unsigned char)theblock[i+3];
    temp = (b1 << 24) | (b2 << 16) | (b3 << 8) | (b4);
    (*total) += temp;
  }
}


void
Finalise ()
{
  long total = 0;

  /* block = headerblock;
  *offset = 32;
  DumpLong (0); */

  SumBlock (headerblock, headsize, &total);
  printf("Header size: %d bytes.\n", headsize);
  SumBlock (romroutblock, romrsize, &total);
  printf("ROM routines size: %d bytes.\n", romrsize);
  SumBlock (romdatablock, romdsize, &total);
  printf("ROM data size: %d bytes.\n", romdsize);
  SumBlock (ramroutblock, ramrsize, &total);
  printf("RAM routines size: %d bytes.\n", ramrsize);
  SumBlock (ramdatablock, ramdsize, &total);
  printf("RAM data size: %d bytes.\n", ramdsize);

  block = headerblock;
  *offset = 32;

  printf("Checksum: %d\n", total);

  DumpLong (total);
}

void
CreateOpcodeTable ()
{
  AddOpCode ("nop", 0x00, 0);

  AddOpCode ("add", 0x10, 3);
  AddOpCode ("sub", 0x11, 3);
  AddOpCode ("mul", 0x12, 3);
  AddOpCode ("div", 0x13, 3);
  AddOpCode ("mod", 0x14, 3);
  AddOpCode ("neg", 0x15, 2);
  AddOpCode ("bitand", 0x18, 3);
  AddOpCode ("bitor", 0x19, 3);
  AddOpCode ("bitxor", 0x1A, 3);
  AddOpCode ("bitnot", 0x1B, 2);
  AddOpCode ("shiftl", 0x1C, 3);
  AddOpCode ("sshiftr", 0x1D, 3);
  AddOpCode ("ushiftr", 0x1E, 3);

  AddOpCode ("jump", 0x20, 1);
  AddOpCode ("jz", 0x22, 2);
  AddOpCode ("jnz", 0x23, 2);
  AddOpCode ("jeq", 0x24, 3);
  AddOpCode ("jne", 0x25, 3);
  AddOpCode ("jlt", 0x26, 3);
  AddOpCode ("jge", 0x27, 3);
  AddOpCode ("jgt", 0x28, 3);
  AddOpCode ("jle", 0x29, 3);
  AddOpCode ("jltu", 0x2A, 3);
  AddOpCode ("jgeu", 0x2B, 3);
  AddOpCode ("jgtu", 0x2C, 3);
  AddOpCode ("jleu", 0x2D, 3);

  AddOpCode ("call", 0x30, 3);
  AddOpCode ("return", 0x31, 1);
  AddOpCode ("catch", 0x32, 2);
  AddOpCode ("throw", 0x33, 2);
  AddOpCode ("tailcall", 0x34, 2);

  AddOpCode ("copy", 0x40, 2);
  AddOpCode ("copys", 0x41, 2);
  AddOpCode ("copyb", 0x42, 2);
  AddOpCode ("sexs", 0x44, 2);
  AddOpCode ("sexb", 0x45, 2);
  AddOpCode ("aload", 0x48, 3);
  AddOpCode ("aloads", 0x49, 3);
  AddOpCode ("aloadb", 0x4A, 3);
  AddOpCode ("aloadbit", 0x4B, 3);
  AddOpCode ("astore", 0x4C, 3);
  AddOpCode ("astores", 0x4D, 3);
  AddOpCode ("astoreb", 0x4E, 3);
  AddOpCode ("astorebit", 0x4F, 3);

  AddOpCode ("stkcount", 0x50, 1);
  AddOpCode ("stkpeek", 0x51, 2);
  AddOpCode ("stkswap", 0x52, 0);
  AddOpCode ("stkroll", 0x53, 2);
  AddOpCode ("stkcopy", 0x54, 1);

  AddOpCode ("streamchar", 0x70, 1);
  AddOpCode ("streamnum", 0x71, 1);
  AddOpCode ("streamstr", 0x72, 1);
  AddOpCode ("streamunichar", 0x73, 1);

  AddOpCode ("gestalt", 0x100, 3);
  AddOpCode ("debugtrap", 0x101, 1);
  AddOpCode ("getmemsize", 0x102, 1);
  AddOpCode ("setmemsize", 0x103, 2);
  AddOpCode ("jumpabs", 0x104, 1);

  AddOpCode ("random", 0x110, 2);
  AddOpCode ("setrandom", 0x111, 1);

  AddOpCode ("quit", 0x120, 0);
  AddOpCode ("verify", 0x121, 1);
  AddOpCode ("restart", 0x122, 0);
  AddOpCode ("save", 0x123, 2);
  AddOpCode ("restore", 0x124, 2);
  AddOpCode ("saveundo", 0x125, 1);
  AddOpCode ("restoreundo", 0x126, 1);
  AddOpCode ("protect", 0x127, 2);

  AddOpCode ("glk", 0x130, 3);

  AddOpCode ("getstringtbl", 0x140, 1);
  AddOpCode ("setstringtbl", 0x141, 1);

  AddOpCode ("getiosys", 0x148, 2);
  AddOpCode ("setiosys", 0x149, 2);

  AddOpCode ("linearsearch", 0x150, 8);
  AddOpCode ("binarysearch", 0x151, 8);
  AddOpCode ("linkedsearch", 0x152, 7);

  AddOpCode ("callf", 0x160, 2);
  AddOpCode ("callfi", 0x161, 3);
  AddOpCode ("callfii", 0x162, 4);
  AddOpCode ("callfiii", 0x163, 5);

  AddOpCode ("mzero", 0x170, 3);
  AddOpCode ("mcopy", 0x171, 3);

  AddOpCode ("malloc", 0x178, 2);
  AddOpCode ("mfree", 0x179, 1);
  AddOpCode ("accelfunc", 0x180, 2);
  AddOpCode ("accelparam", 0x181, 2);
    
  AddOpCode ("section", SEC_DIR, 0);
  AddOpCode ("stack", STK_DIR, 1);
  AddOpCode ("ext", EXT_DIR, 1);
  AddOpCode ("dc.b", DCB_DIR, 1);
  AddOpCode ("dc.w", DCW_DIR, 1);
  AddOpCode ("dc.l", DCL_DIR, 1);
  AddOpCode ("ds.b", DSB_DIR, 1);
  AddOpCode ("ds.w", DSW_DIR, 1);
  AddOpCode ("ds.l", DSL_DIR, 1);
}

void
AddOpCode (char *name, long code, int operands)
{
  opcode *thisopcode, *newopcode;

  newopcode = malloc (sizeof (opcode));

  if (newopcode == NULL)
    {
      if ((errno == ENOMEM) || (errno == EAGAIN))
	{
	  printf
	    ("FATAL - Unable to allocate %d bytes of memory for opcode\n",
	     sizeof (opcode));
	  exit (-1);
	}
    }

  strcpy (newopcode->name, name);
  newopcode->code = code;
  newopcode->operands = operands;
  newopcode->next = NULL;

  if (opcodes)
    {
      thisopcode = opcodes;

      while (thisopcode->next != NULL)
	thisopcode = thisopcode->next;

      thisopcode->next = newopcode;
    }
  else
    opcodes = newopcode;
}

void
AddLabel (char *name, long offset, int segment, int section)
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

  strcpy (newlabel->name, name);
  newlabel->offset = offset;
  newlabel->segment = segment;
  newlabel->next = NULL;

  if (labeltable)
    {
      thislabel = labeltable;

      while (thislabel->next != NULL)
	thislabel = thislabel->next;

      thislabel->next = newlabel;
    }
  else
    labeltable = newlabel;
}

void
AddDefine (char *name, char *definition)
{
  define *thisdefine, *newdefine;

  newdefine = malloc (sizeof (define));

  if (newdefine == NULL)
    {
      if ((errno == ENOMEM) || (errno == EAGAIN))
	{
	  printf
	    ("FATAL - Unable to allocate %d bytes of memory for define\n",
	     sizeof (define));
	  exit (-1);
	}
    }

  newdefine->name = malloc (strlen (name));
  if (newdefine->name == NULL)
    {
      if ((errno == ENOMEM) || (errno == EAGAIN))
	{
	  printf
	    ("FATAL - Unable to allocate %d bytes of memory for define\n",
	     sizeof (name));
	  exit (-1);
	}
    }
  newdefine->definition = malloc (strlen (definition));
  if (newdefine->definition == NULL)
    {
      if ((errno == ENOMEM) || (errno == EAGAIN))
	{
	  printf
	    ("FATAL - Unable to allocate %d bytes of memory for define\n",
	     sizeof (definition));
	  exit (-1);
	}
    }

  strcpy (newdefine->name, name);
  strcpy (newdefine->definition, definition);
  newdefine->next = NULL;

  if (definetable)
    {
      thisdefine = definetable;

      while (thisdefine->next != NULL)
	thisdefine = thisdefine->next;

      thisdefine->next = newdefine;
    }
  else
    definetable = newdefine;
}
