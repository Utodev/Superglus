
#include <config.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#include "lexico.h"
#include "sintacti.h"
#include "errores.h"
#include "textos.h"
#include "vocabula.h"
#include "objetos.h"
#include "generar.h"

#if (defined(__MSDOS__))||(defined(WIN32))
#define PATH_SEPARATOR '\\'
#define uSOFT 1
#else
#define PATH_SEPARATOR '/'
#endif

int glulxamain (int argc, char *argv[]);

/* programa principal */

char wd[2024];
char * nombre_archivo;

char *comando[5]; /*={
"glulxa",
"-i",
"                                                                               ",
"-o",
"                                                                               "
};*/

int ver_hi=1;
int ver_lo=1;
int ver_verylo = 1;

int
main (int argc, char *argv[])
{
  char *buscar;

  char *pgldir = getenv("SPGLIBPATH");

  if (argc < 2)
    {
      error (errGeneral, 0);
      return -1;
    };


  if(pgldir==NULL) {

  #ifdef WIN32
      strcpy(wd,argv[0]);
  #else
      strcpy (wd, getenv ("_"));
  #endif
    buscar = strrchr (wd, PATH_SEPARATOR);
    if (!buscar)
      buscar = strrchr (wd, PATH_SEPARATOR);
    if (buscar)
      *buscar = 0;
    else
      strcpy (wd, ".");

}
else {
	strcpy(wd, pgldir);
}
  nombre_archivo = strdup(argv[1]);
  printf("=== Compilador de Superglus v%i.%i.%i ===\n\n",ver_hi,ver_lo, ver_verylo);
  printf("Directorio PGL  en %s\n",wd);
  InicializaCondactos();
  prepLexico (argv[1]);
  analizar ();
  printf ("Analisis completado.\n");
  termLexico ();
  GenerarEnsamblador (argv[1]);
  FinalizarVocabulario ();


  
  return 0;
}
