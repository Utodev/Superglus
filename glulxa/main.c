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
/* main.c - The main function for the glulx assembler */

#include "glulxa.h"
#include "globals.h"
#include "opt.h"
#include <ctype.h>
#include <string.h>

#define STANDALONE
#ifdef STANDALONE
int
main (int argc, char *argv[])
#else
int
glulxamain (int argc, char *argv[])
#endif
{
  int c, err_flag = 2;
  extern char *optarg;
  extern int optind;


  printf("Glulx Assembler 0.51\n");

  while ((c = getopt (argc, argv, "i:o:")) != -1)
    switch (tolower (toascii (c)))
      {
      case '?':
	err_flag++;
	break;

      case 'i':
	infilename = strdup (optarg);
	err_flag--;
	break;

      case 'o':
	outfilename = strdup (optarg);
	err_flag--;
	break;

      default:
	err_flag++;
	break;
      }

  if (err_flag)
    {
      printf ("FATAL - arguments error on invocation.\n\n");
      printf ("syntax :\n");
      printf ("glulxa -i <sourcefile> -o <gamefile>\n");

      exit (-1);
    }

  CreateOpcodeTable ();

  OpenFiles ();

  strcpy (filename, infilename);

  /* Do the first pass.  Create offsets, table of labels */
  pass = 1;
  Assemble ();

  /* Allocate blocks for the data and code sections */
  AllocateMemory ();

  CorrectLabels ();
  InitHeader ();

  if (!asserrors)
    {
      /* Do the second pass. Finalise the code and data sections */
      pass = 2;
      Assemble ();

      Finalise ();

      OutputGameFile ();
    }

  CloseFiles ();

  return 0;
}
