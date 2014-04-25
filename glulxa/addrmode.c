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
/* addrmode.c */
/* parse address mode of operand */

#include "glulxa.h"

unsigned char
ParseOperand (char *buf, long *value)
{
  char tbuf[64];
  int tlen;

  /* check for null addressing mode */
  if (strlen (buf) == 0)
    {
      (*value) = 0;
      return ADDR_NULL;
    }

  if (strcmp (buf, "~") == 0)
    {
      (*value) = 0;
      return ADDR_NULL;
    }

  /* check for (sp) */

  if (strcmp (buf, "(sp)") == 0)
    {
      (*value) = 0;
      return ADDR_SP;
    }

  /* Now check for the various indirect addressing modes */
  switch (buf[0])
    {
    case '[':
      /* RAM Address */

      /* Get the address section */
      tlen = strcspn (buf + 1, "]");
      tbuf[0] = '\0';
      strncat (tbuf, buf + 1, tlen);

      /* what is its value ? */
      ParseValue (tbuf, value);

      /* little hack to change the value - RAM addresses are relative to RAMSTART */
      (*value) -= headsize;
      (*value) -= romdsize;
      (*value) -= romrsize;

	  if (tbuf[0] == ':')
		  return ADDR_RAML;

      switch (buf[strlen (buf) - 1])
	{
	case 'b':
	  return ADDR_RAMB;
	case 'w':
	  return ADDR_RAMW;
	case 'l':
	  return ADDR_RAML;
	default:
	  /* Determine the most efficient addressing mode.
	   * Labels are always referred to by RAML, because of limitations
	   * elsewhere. */
	  if ((*value <= 0xFF) && (*value >= 0x00))
	    return ADDR_RAMB;
	  else if ((*value <= 0xFFFF) && (*value >= 0x0000))
	    return ADDR_RAMW;
	  else
	    return ADDR_RAML;
	}

    case '{':
      /* Call Frame Local */

      /* Get the address section */
      tlen = strcspn (buf + 1, "}");
      tbuf[0] = '\0';
      strncat (tbuf, buf + 1, tlen);

      /* what is its value ? */
      ParseValue (tbuf, value);

	  if (tbuf[0] == ':')
		  return ADDR_CFLL;

      switch (buf[strlen (buf) - 1])
	{
	case 'b':
	  return ADDR_CFLB;
	case 'w':
	  return ADDR_CFLW;
	case 'l':
	  return ADDR_CFLL;
	default:
	  /* Determine the most efficient addressing mode.
	   * Labels are always referred to by CFLL, because of limitations
	   * elsewhere. */
	  if ((*value <= 0xFF) && (*value >= 0x00))
	    return ADDR_CFLB;
	  else if ((*value <= 0xFFFF) && (*value >= 0x0000))
	    return ADDR_CFLW;
	  else
	    return ADDR_CFLL;
	}

    case '(':
      /* Generic Address */

      /* Get the address section */
      tlen = strcspn (buf + 1, ")");
      tbuf[0] = '\0';
      strncat (tbuf, buf + 1, tlen);

      /* what is its value ? */
      ParseValue (tbuf, value);

	  if (tbuf[0] == ':')
		  return ADDR_ADDL;

      switch (buf[strlen (buf) - 1])
	{
	case 'b':
	  return ADDR_ADDB;
	case 'w':
	  return ADDR_ADDW;
	case 'l':
	  return ADDR_ADDL;
	default:
	  /* Determine the most efficient addressing mode.
	   * Labels are always referred to by ADDL, because of limitations
	   * elsewhere. */
	  if ((*value <= 0xFF) && (*value >= 0x00))
	    return ADDR_ADDB;
	  else if ((*value <= 0xFFFF) && (*value >= 0x0000))
	    return ADDR_ADDW;
	  else
	    return ADDR_ADDL;
	}

    default:

      /* Get the address section */
      tlen = strcspn (buf, ".");
      tbuf[0] = '\0';
      strncat (tbuf, buf, tlen);

      /* what is its value ? */
      ParseValue (tbuf, value);

	  if (tbuf[0] == ':')
		return ADDR_ABSL;

      switch (buf[strlen (buf) - 1])
	{
	case 'b':
	  return ADDR_ABSB;
	case 'w':
	  return ADDR_ABSW;
	case 'l':
	  return ADDR_ABSL;
	default:
	  /* Determine the most efficient addressing mode.
	   * Labels are always referred to by ABSL, because of limitations
	   * elsewhere. */
	  if (*value == 0)
	    return ADDR_NULL;
	  else if ((*value <= 0x7F) && (*value >= -0x80))
	    return ADDR_ABSB;
	  else if ((*value <= 0x7FFF) && (*value >= -0x8000))
	    return ADDR_ABSW;
	  else
	    return ADDR_ABSL;
	}
    }
}


void
ParseValue (char *buf, long *value)
{
  long myvalue;
  label *mylabel;
  char *offset;

  offset = strchr (buf + 1, ':');
  if (offset)
    {
      *offset = '\0';
      offset++;
    }

  if (IsLabel (buf, &mylabel))
    {
      if (mylabel)
		(*value) = mylabel->offset;
      else
		(*value) = 0;
	 
	
	  if ((pass> 1 ) && (*value==0)) printf("Warning: label lookup %s @ %x\n", buf, *value);

      if (offset)
		{
		long nval;
		ParseValue (offset, &nval);
		*value += nval;
		}
      return;
    }

  if (ParseNumber (buf, value))
    return;

  else
    {
      printf ("ERROR - Unparseable operand - File %s, line %d\n", filename,
	      linenum);
      asserrors++;
    }

}
