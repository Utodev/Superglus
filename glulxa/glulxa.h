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
#ifndef GLULXA_H
#define GLULXA_H 1

/* Inclusions */
#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <string.h>

/* Definitions */
/* Special opcodes */
#define NO_OPCODE -1
#define SEC_DIR -2
#define STK_DIR -3
#define DCB_DIR -4
#define DCW_DIR -5
#define DCL_DIR -6
#define DSB_DIR -7
#define DSW_DIR -8
#define DSL_DIR -9
#define EXT_DIR -10

#define ADDR_ERR 0xff
#define ADDR_NULL 0x00
#define ADDR_ABSB 0x01
#define ADDR_ABSW 0x02
#define ADDR_ABSL 0x03
#define ADDR_ADDB 0x05
#define ADDR_ADDW 0x06
#define ADDR_ADDL 0x07
#define ADDR_SP 0x08
#define ADDR_CFLB 0x09
#define ADDR_CFLW 0x0a
#define ADDR_CFLL 0x0b
#define ADDR_RAMB 0x0d
#define ADDR_RAMW 0x0e
#define ADDR_RAML 0x0f

#define ROM 1
#define RAM 2
#define CODE 3
#define DATA 4

#define NEW_LABEL -1

#define MAX_FILE_NAME 1024
#define MAX_LINE 32768
#define MAX_OPERAND 32768

typedef struct _define
{
  char *name;
  char *definition;
  struct _define *next;
}
define;

#define MAX_LABELS 1024
/* structure for containing the labels table */
typedef struct _label
{
  char name[64];
  long offset;
  int segment;
  int section;
  struct _label *next;
}
label;

#define MAX_OPCODES 69
/* Structure for containing the opcodes table */
typedef struct _opcode
{
  char name[64];
  long code;
  int operands;
  struct _opcode *next;
}
opcode;

/* Extern Definitions */
extern label *labeltable;
extern int numlabels;

extern define *definetable;

extern char inputline[MAX_LINE];
extern char inputline_backup[MAX_LINE];

extern int pass;
extern opcode *opcodes;

extern char *infilename, *outfilename, filename[1280];

extern FILE *infilepointer, *outfilepointer;

extern char *ramdatablock, *romdatablock, *ramroutblock, *romroutblock,
  *headerblock;
extern long ramdatasize, romdatasize, ramroutsize, romroutsize, headersize;

extern long ramrsize, ramdsize, romrsize, romdsize, headsize, extsize;
extern long BlockBase;

extern long stacksize;

extern int section, segment, linenum, asserrors;

extern long *offset;
extern char *block;



extern int errno;

/* Function Definitions */
void OpenFiles (void);
void Assemble (void);
void AllocateMemory (void);
void OutputGameFile (void);
void CloseFiles (void);
void RewindFiles (void);
void StoreNewLabel (char *, long, int, int);
void DumpString (char *);
void DumpByte (long);
void DumpWord (long);
void DumpLong (long);
unsigned char ParseOperand (char *, long *);
void ParseValue (char *, long *);
long ParseNumber (char *, long *);
void CorrectLabels (void);
void InitHeader (void);
void Finalise (void);
void CreateOpcodeTable (void);
void AddOpCode (char *, long, int);
void AddLabel (char *, long, int, int);
void AddDefine (char *, char *);


#endif
