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
OpenFiles ()
{
  infilepointer = fopen (infilename, "r");

  if (infilepointer == NULL)
    {
      printf ("FATAL - Unable to open input file %s\n", infilename);
      exit (-1);
    }
}

void
RewindFiles ()
{
  linenum = 0;
  rewind (infilepointer);
  ramdatasize = 0;
  romdatasize = 0;
  ramroutsize = 0;
  romroutsize = 0;
}

void
OutputGameFile ()
{
  long temp;

  outfilepointer = fopen (outfilename, "wb");

  if (outfilepointer == NULL)
    {
      printf ("FATAL - Unable to open output file %s\n", outfilename);
      exit (-1);
    }

  /* Now dump the sections of data to the file */
  for (temp = 0; temp < headsize; temp++)
    fputc (headerblock[temp], outfilepointer);
  for (temp = 0; temp < romrsize; temp++)
    fputc (romroutblock[temp], outfilepointer);
  for (temp = 0; temp < romdsize; temp++)
    fputc (romdatablock[temp], outfilepointer);
  for (temp = 0; temp < ramrsize; temp++)
    fputc (ramroutblock[temp], outfilepointer);
  for (temp = 0; temp < ramdsize; temp++)
    fputc (ramdatablock[temp], outfilepointer);

}


void
CloseFiles ()
{
  if (infilepointer)
    fclose (infilepointer);
  if (outfilepointer)
    fclose (outfilepointer);
}

int
GetNextLine ()
{
  char *t;

  if ((t = fgets (inputline, MAX_LINE, infilepointer)) == NULL)
    {
      strcpy (inputline_backup, inputline);
      return EOF;
    }

  strcpy (inputline_backup, inputline);
  linenum++;

  return 0;


}
