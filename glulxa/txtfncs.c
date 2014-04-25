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

/* Is this an opcode? */
/* If yes, return true, with the number of the opcode in temp */
int
IsOpCode (char *buf, opcode ** temp)
{
  (*temp) = NULL;

  for ((*temp) = opcodes;
       (((*temp) != NULL) && (strcmp ((*temp)->name, buf) != 0));
       (*temp) = (*temp)->next);

  if ((*temp) == NULL)
    return 0;

  return 1;
}

/* Is this a label? */
/* if yes, return true, with the number of the label in temp or */
/* NEW_LABEL for a new one */
int
IsLabel (char *buf, label ** thislabel)
{
  (*thislabel) = NULL;

  if (buf[0] != '.' && buf[0] != ':')
    return 0;

  if (!labeltable)
    return 1;

  for ((*thislabel) = labeltable;
       (((*thislabel) != NULL) && (strcmp ((*thislabel)->name, buf) != 0));
       (*thislabel) = (*thislabel)->next);

  return 1;
}

int
IsString (char *buf)
{
  if ((buf[0] == '\'') || (buf[0] == '\"'))
    return 1;

  return 0;
}

int
IsHex (char *buf)
{
  if ((buf[0] == '0') && (buf[1] == 'x'))
    return 1;
  return 0;
}

long
ParseNumber (char *buf, long *result)
{
  char fstring[4] = "%ld";

  if (IsHex (buf))
    {
      fstring[2] = 'x';
      buf = buf + 2;
    }

  if ((sscanf (buf, fstring, result)) == 0)
    return 0;
  else
    return 1;
}
