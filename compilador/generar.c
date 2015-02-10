/* generar.c
 *
 * En este archivo se trata todo lo
 * relacionado con la generación de
 * código.
 */

#include <config.h>

#include <errno.h>
#include <malloc.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "comun.h"
#include "generar.h"
#include "vocabula.h"
#include "textos.h"
#include "salidas.h"
#include "objetos.h"
#include "procesos.h"
#include "condacto.h"
#include "lexico.h"
#include "cfgvars.h"

FILE *fichUla, *fichLib, *fichSpellCheck;

char libFile[2024];

TipoCondacto elCondacto;

void VolcarProcesos (void);
void VolcarPalabras (void);
void VolcarMensajesSistema (void);
void VolcarMensajesUsuario (void);
void VolcarMensajesWrite (void);
void VolcarDescripcionesDeObjetos (void);
void VolcarDescripcionesDeLugares (void);
void VolcarConexiones (void);
void VolcarFicheroCFG (const char *);
void VolcarVariablesDeConfiguracion (void);
void VolcarObjetos (void);
char * ChangeSpaces(char *cadena);
void dumpStringAsNumbers(FILE * f, char * s);




void trim(char *s)
{
       // Trim spaces and tabs from beginning:
       int i=0,j;
       while((s[i]==' ')||(s[i]=='\t')) {
               i++;
       }
       if(i>0) {
               for(j=0;j<strlen(s);j++) {
                       s[j]=s[j+i];
               }
       s[j]='\0';
       }

       // Trim spaces and tabs from end:
       i=strlen(s)-1;
       while((s[i]==' ')||(s[i]=='\t')) {
               i--;
       }
       if(i<(strlen(s)-1)) {
               s[i+1]='\0';
       }
}




void
GenerarEnsamblador (char *nombreFuente)
{
  char nombreDestino[256];
  char *finNombre;
  char linea[32768];

  /* Primero de todo, ver si las variables de configuración son válidas */
  
  if(!checkvalidcfgvars()) {
    exit(-1);
  }
  
  /* Generar el nombre del fichero destino
     basado en el nombre del fichero de fuente. */
  strcpy (nombreDestino, nombreFuente);
  /*finNombre = strpbrk(nombreDestino, "."); */
  finNombre = strrchr (nombreDestino, '.');
  if (finNombre)
    *finNombre = '\0';
  strcat (nombreDestino, ".ula");
  /* Abrir el fichero de destino */
  if ((fichUla = fopen (nombreDestino, "wt")) == NULL)
    {
      printf ("No se puede crear el fichero de destino.\n");
      exit (-1);
    }
  /* Generar el nombre del fichero de spell check 
     basado en el nombre del fichero de fuente. */
  strcpy (nombreDestino, nombreFuente);
  finNombre = strrchr (nombreDestino, '.');
  if (finNombre)
    *finNombre = '\0';
  strcat (nombreDestino, ".txt");
  /* Abrir el fichero de destino */
  if ((fichSpellCheck = fopen (nombreDestino, "wt")) == NULL)
    {
      printf ("No se puede crear el fichero de correción ortográfica.\n");
      exit (-1);
    }


  /* Copiar en el el codigo de inicio */
  /*perror("ERROR"); */
  /*printf("Memoria libre: %dbytes.\n", coreleft()); */
  strcpy (libFile, wd);
  strcat (libFile, "/pgl/inicio.pgl");
  /*printf ("%s\n", libFile);*/
  if ((fichLib = fopen (libFile, "rt")) != NULL)
    {
      while (!feof (fichLib))
	{
	  fgets (linea, 32768, fichLib);
	  fputs (linea, fichUla);
	}
      fclose (fichLib);
    }
  else
    perror ("ERROR");
  /* Volcar los procesos */
  VolcarProcesos ();
  /* Copiar en el el codigo de los condactos */
  strcpy (libFile, wd);
  strcat (libFile, "/pgl/condacto.pgl");
  /*printf ("%s\n", libFile);*/
  if ((fichLib = fopen (libFile, "rt")) != NULL)
    {
      while (fgets (linea, 32768, fichLib))
	{
	  fputs (linea, fichUla);
	}
      fclose (fichLib);
    }
  /* Copiar en el el codigo de los condactos plugin */
  strcpy (libFile, wd);
  strcat (libFile, "/pgl/plugin.pgl");
  /*printf ("%s\n", libFile);*/
  if ((fichLib = fopen (libFile, "rt")) != NULL)
    {
      while (fgets (linea, 32768, fichLib))
	{
	  fputs (linea, fichUla);
	}
      fclose (fichLib);
    }
  /* Copiar en el el codigo del interprete */
  strcpy (libFile, wd);
  strcat (libFile, "/pgl/interpre.pgl");
  /* printf ("%s\n", libFile);*/
  if ((fichLib = fopen (libFile, "rt")) != NULL)
    {
      while (fgets (linea, 32768, fichLib))
	{
	  fputs (linea, fichUla);
	}
      fclose (fichLib);
    }
  /* Volcar el vocabulario */
  VolcarPalabras ();
  /* Volcar los mensajes */
  VolcarMensajesSistema ();
  VolcarMensajesUsuario ();
  VolcarMensajesWrite();
  VolcarDescripcionesDeObjetos ();
  VolcarDescripcionesDeLugares ();
  VolcarConexiones ();
  /* Copiar en el el codigo de las variables */
  strcpy (libFile, wd);
  strcat (libFile, "/pgl/vriables.pgl");
  /*printf ("%s\n", libFile);*/
  if ((fichLib = fopen (libFile, "rt")) != NULL)
    {
      while (fgets (linea, 32768, fichLib))
	{
	  fputs (linea, fichUla);
	}
      fclose (fichLib);
    }
  /* Volcar los valores de las variables de configuracion */
  VolcarVariablesDeConfiguracion();
  /* Volcar los objetos */
  VolcarObjetos ();
  /* Copiar en el el codigo de finalizacion */
  strcpy (libFile, wd);
  strcat (libFile, "/pgl/final.pgl");
  /*printf ("%s\n", libFile);*/
  if ((fichLib = fopen (libFile, "rt")) != NULL)
    {
      while (fgets (linea, 32768, fichLib))
	{
	  fputs (linea, fichUla);
	}
      fclose (fichLib);
    }
  VolcarFicheroCFG(nombreFuente);
};

void
VolcarProcesos ()
{

  TipoEntrada *laEntrada;
  int npro, nent, posicion;
  int *pCondacto, i;
  char verboDeLaEntrada[20], nombreDeLaEntrada[20];

  /* Primero, volcar la tabla de procesos */

  fputs (":tabla_procesos\n", fichUla);
  for (i = 0; i < ultProceso + 1; i++)
    {
      if (!(i % 8))
	fputs ("\n dc.l", fichUla);
      fprintf (fichUla, " :pro%03d", i);
    }
  fputs ("\n\n", fichUla);

  fprintf ( fichUla, ":ultimo_proceso dc.l %d.l\n", ultProceso);


  /* Seguimos con la variable que indica si hay proceso interrupcion */

  if (interrupt_proc == -1) 
	  fprintf(fichUla, ":hay_interrupt dc.l 0\n\n");
  else
	  fprintf(fichUla, ":hay_interrupt dc.l 1\n\n");

  for (npro = 0; npro < ultProceso + 1; npro++)
    {
		  if (npro == interrupt_proc)
			  fprintf (fichUla, ":interrupt_proc\n");

		  fprintf (fichUla, ":pro%03d\n", npro);
		  fputs (" dc.b 0xc1 0x04 0x03 0x00 0x00\n", fichUla);
		  fprintf (fichUla, ":pro%03d_restart\n", npro);
		  nent = 0;
		  /* Al principio de cada proceso veremos si hemos recibido un número de entrada como primer parámetro; si es así saltamos */
		  fprintf(fichUla,
				  " jz (:bandera_en_doall).l :no_entrada_para_doall_p%03d.l\n"
				  " jne (:proceso_en_doall).l %03d.l :no_entrada_para_doall_p%03d.l\n"
				  " jump (:entrada_para_doall).l\n"
				  ":no_entrada_para_doall_p%03d\n", npro, npro, npro, npro);
				  laEntrada = SiguienteEntrada (npro, NULL);
		  while (laEntrada != NULL)
		{
		  pCondacto = laEntrada->condactos;
		  posicion = 0;
		  fprintf (fichUla, ":p%03de%04d\n", npro, nent);
		  strcpy (verboDeLaEntrada,
			  BuscarPalabraPorNumero (laEntrada->verbo, verbo));
		  strcpy (nombreDeLaEntrada,
			  BuscarPalabraPorNumero (laEntrada->nombre, nombre));
		  fprintf (fichUla, "; %s %s\n", verboDeLaEntrada, nombreDeLaEntrada);
		  /* generar el codigo de entrada a la entrada */
		  fprintf (fichUla,
			   " jz (:bandera_en_response).l :p%03de%04d_condactos.l\n",
			   npro, nent);
		  if (laEntrada->verbo != -1)
			fprintf (fichUla, " jne (:flag033).l 0x%x.l :p%03de%04d.l\n",
				 laEntrada->verbo, npro, nent + 1);
		  if (laEntrada->nombre != -1)
			fprintf (fichUla, " jne (:flag034).l 0x%x.l :p%03de%04d.l\n",
				 laEntrada->nombre, npro, nent + 1);
		  /* generar codigo de condactos */
		  fprintf (fichUla, ":p%03de%04d_condactos\n", npro, nent);
		  while (posicion < (laEntrada->posicion))
			{
			  elCondacto = condactos[pCondacto[posicion]];
			  /* generar el codigo del condacto */
			  if (!strcmp (elCondacto.nombre, "DOALL"))
				{
					fprintf (fichUla, " copy :p%03de%04d.l {4}.l\n", npro,nent + 1); 
					fprintf (fichUla, " sub {4}.l :no_entrada_para_doall_p%03d.l {4}.l\n", npro);
					fprintf (fichUla, " add {4}.l 2.l {4}.l\n");
					fprintf (fichUla, " copy {4}.l (:entrada_para_doall).l\n");
					fprintf (fichUla, " copy %d.l (:proceso_en_doall).l\n", npro);
				}

			  if (!strcmp (elCondacto.nombre, "RESTART"))
				{
					fprintf (fichUla, " jump :pro%03d_restart.l\n", npro); 
				}


				  if (elCondacto.tipoArg3 != nada)
					{
					 if (pCondacto[posicion+3] & 0x80000000) /* Direccionamiento indirecto */
					 fprintf (fichUla, " copy (:flag%03d).l (sp)\n",  pCondacto[posicion + 3] & 0x7FFFFFFF);
					  else
					 fprintf (fichUla, " copy 0x%x.l (sp)\n",  pCondacto[posicion + 3]);
					}


				  if (elCondacto.tipoArg2 != nada)
					{
					 if (pCondacto[posicion+2] & 0x80000000) /* Direccionamiento indirecto */
					 fprintf (fichUla, " copy (:flag%03d).l (sp)\n",  pCondacto[posicion + 2] & 0x7FFFFFFF);
					  else
					 fprintf (fichUla, " copy 0x%x.l (sp)\n",  pCondacto[posicion + 2]);
					}
                
				   if (elCondacto.tipoArg1 != nada)
					{
					 if (pCondacto[posicion+1] & 0x80000000) /* Direccionamiento indirecto */
					 fprintf (fichUla, " copy (:flag%03d).l (sp)\n",  pCondacto[posicion + 1] & 0x7FFFFFFF);
					  else
					 fprintf (fichUla, " copy 0x%x.l (sp)\n",  pCondacto[posicion + 1]);
					}
                
			switch (elCondacto.tipo)
			{
				case condicion:
				case mixto:
				  fprintf (fichUla, " call :cnd_%s.l 0x%x.b (sp)\n",
					   aMinusculas (elCondacto.nombre),
					   0 + ((elCondacto.tipoArg1 != nada) ? 1 : 0) +
					   ((elCondacto.tipoArg2 != nada) ? 1 : 0) + 
					   ((elCondacto.tipoArg3 != nada) ? 1 : 0));
				  fprintf (fichUla, " jz (sp) :p%03de%04d.l\n", npro,
					   nent + 1);
				  break;
				case accion:
				  fprintf (fichUla, " call :acc_%s.l %x.b ~\n",
					   aMinusculas (elCondacto.nombre),
					   0 + ((elCondacto.tipoArg1 != nada) ? 1 : 0) +
					   ((elCondacto.tipoArg2 != nada) ? 1 : 0) +
					   ((elCondacto.tipoArg3 != nada) ? 1 : 0) );
				  if (!strcmp (elCondacto.nombre, "process"))
					{
					  fprintf (fichUla,
						   " jnz (:bandera_describir_localidad).l :p%03de9999.l\n",
						   npro);
					  fprintf (fichUla,
						   " jnz (:bandera_salir).l 0 ; por si se ha ejecutado END\n");
					}
				  break;
				default:
				  printf ("ERROR: tipo de condacto no reconocido\n");
			}
			  /* y ahora, las operaciones de limpieza del condacto según el tipo del mismo */
			switch (elCondacto.limpieza)
			{
				case aDescribir:
				case aEnd:
				case aFinDeTabla:
				  fprintf (fichUla,
					   " return 0 ; debemos salir de todas las funciones\n");
				  break;
				case aCondicional:
				  fprintf (fichUla,  " jz (:exito).l :p%03de9999.l ; debemos salir de la tabla\n",
					   npro);
				  break;
			}
			posicion += 4;
		  }
		  laEntrada = SiguienteEntrada (npro, laEntrada);
		  nent++;
		}
    fprintf (fichUla, ":p%03de%04d\n:p%03de9999\nreturn 0\n", npro, nent, npro);
   }
}

void
VolcarPalabras ()
{

  PPalabra palabra;
  int np, i;

  np = 0;
  palabra = SiguientePalabra (NULL);
  while (palabra != NULL)
    {
      fprintf (fichUla, ":pal%04d\n", np);
      fprintf (fichUla, " dc.b \"%s\"\n", palabra->pal);
      for (i = strlen (palabra->pal); i < 14; i++)
  	fprintf (fichUla, " dc.b 0x00.b\n");
      fprintf (fichUla, " dc.l %d.l\n", palabra->tipo);
      fprintf (fichUla, " dc.l %d.l\n", palabra->num);
      palabra = SiguientePalabra (palabra);
      np++;
    }
  fputs (":pal9999 ; ultima palabra\n", fichUla);
  fputs (" dc.b 0x00.b 0x00.b 0x00.b 0x00.b 0x00.b 0x00.b 0x00.b 0x00.b 0x00.b 0x00.b 0x00.b 0x00.b b 0x00.b 0x00.b 0x00.b 0x00.b\n",
	 fichUla);
  fputs (" dc.l 0.l\n", fichUla);
  fputs (" dc.l 0.l\n", fichUla);
}

void
VolcarMensajesSistema ()
{
  int i;
  fputs (";;;;;;;;;;;;\n", fichUla);
  fputs ("; MENSAJES ;\n", fichUla);
  fputs (";;;;;;;;;;;;\n", fichUla);
  fputs ("\n", fichUla);
  fputs ("; MENSAJES DEL SISTEMA\n", fichUla);
  fputs ("\n", fichUla);
  fprintf (fichUla, ":total_mensajes_sistema\ndc.l %d\n", txtSistema->ocupado);
  fputs (":tabla_mensajes_sistema\n", fichUla);
  for (i = 0; i < txtSistema->ocupado; i++)
    {
      if (!(i % 4))
	fputs ("\n dc.l", fichUla);
      fprintf (fichUla, " %d :ms%010d", txtSistema->mensajes[i].num_mensaje, i);
    }
  fputs ("\n", fichUla);
    fputs ("-- MENSAJES DEL SISTEMA  --\n\n", fichSpellCheck);

  for (i = 0; i < txtSistema->ocupado; i++)
  {
    fprintf (fichUla, ":ms%010d\n",i);
	dumpStringAsNumbers(fichUla, ChangeSpaces(txtSistema->mensajes[i].mensaje));
	fprintf (fichSpellCheck,"%s\n", limpiarTexto(txtSistema->mensajes[i].mensaje) );
  }
  fputs ("\n\n", fichSpellCheck);
   
}


void
VolcarMensajesWrite ()
{
  int i;
  fputs (";;;;;;;;;;;;\n", fichUla);
  fputs ("; WRITES   ;\n", fichUla);
  fputs (";;;;;;;;;;;;\n", fichUla);
  fputs ("\n", fichUla);
  fputs ("; TEXTOS DE WRITE\n", fichUla);
  fputs ("\n", fichUla);
  fprintf (fichUla, ":total_mensajes_write\ndc.l %d\n", txtWrite->ocupado);
  fputs (":tabla_mensajes_write\n", fichUla);
  for (i = 0; i < txtWrite->ocupado; i++)
    {
      if (!(i % 4))
	fputs ("\n dc.l", fichUla);
      fprintf (fichUla, " %d :mw%010d", txtWrite->mensajes[i].num_mensaje, i);
    }
  fputs ("\n", fichUla);

  fputs ("-- WRITE --\n\n", fichSpellCheck);
  for (i = 0; i < txtWrite->ocupado; i++)
  {
    fprintf (fichUla, ":mw%010d\n",i);
    dumpStringAsNumbers(fichUla, ChangeSpaces(txtWrite->mensajes[i].mensaje));
	fprintf (fichSpellCheck,"%s\n", limpiarTexto(txtWrite->mensajes[i].mensaje ));
  }
  fputs ("\n\n", fichSpellCheck);
  
}

void
VolcarMensajesUsuario ()
{
  int i;

  fputs ("; MENSAJES DE USUARIO\n", fichUla);
  fputs ("\n", fichUla);
  fprintf (fichUla, ":total_mensajes_usuario\ndc.l %d\n", txtMensajes->ocupado);
  fputs (":tabla_mensajes_usuario\n", fichUla);
  for (i = 0; i < txtMensajes->ocupado; i++)
    {
      if (!(i % 4))
	fputs ("\n dc.l", fichUla);
      fprintf (fichUla, " %d :mu%010d", txtMensajes->mensajes[i].num_mensaje, i);
    }
  fputs ("\n", fichUla);

  fputs ("-- MENSAJES --\n\n", fichSpellCheck);
  for (i = 0; i < txtMensajes->ocupado; i++)
  {
    fprintf (fichUla, ":mu%010d\n",i);
    dumpStringAsNumbers(fichUla, ChangeSpaces(txtMensajes->mensajes[i].mensaje));
	fprintf (fichSpellCheck,"%s\n", limpiarTexto(txtMensajes->mensajes[i].mensaje) );
  }
  fputs ("\n\n", fichSpellCheck);
  
  
  
}

void
VolcarDescripcionesDeObjetos ()
{
  int i;

  fputs ("\n", fichUla);
  fputs ("; DESCRIPCIONES DE OBJETOS\n", fichUla);
  fputs ("\n", fichUla);
  fprintf (fichUla, ":total_mensajes_objetos\ndc.l %d\n", txtObjetos->ocupado);
  fputs (":tabla_desc_objetos\n", fichUla);
  for (i = 0; i < txtObjetos->ocupado; i++)
    {
      if (!(i % 4))
	fputs ("\n dc.l", fichUla);
      fprintf (fichUla, " %d :do%010d", txtObjetos->mensajes[i].num_mensaje, i);
    }
  fputs ("\n", fichUla);

 fputs ("-- OBJETOS --\n\n", fichSpellCheck);
  for (i = 0; i < txtObjetos->ocupado; i++)
  {
    fprintf (fichUla, ":do%010d\n",i);
    dumpStringAsNumbers(fichUla, ChangeSpaces(txtObjetos->mensajes[i].mensaje));
	fprintf (fichSpellCheck,"%s\n", limpiarTexto(txtObjetos->mensajes[i].mensaje) );
  }
 fputs ("\n\n", fichSpellCheck);
  


  
}

void
VolcarDescripcionesDeLugares ()
{
  int i;

  fputs ("\n", fichUla);
  fputs ("; DESCRIPCIONES DE LUGARES\n", fichUla);
  fputs ("\n", fichUla);
  fprintf (fichUla, ":total_mensajes_localidades\ndc.l %d\n", txtLugares->ocupado);
  fputs (":tabla_desc_lugares\n", fichUla);
  for (i = 0; i < txtLugares->ocupado; i++)
    {
      if (!(i % 4))
	fputs ("\n dc.l", fichUla);
      fprintf (fichUla, " %d :dl%010d", txtLugares->mensajes[i].num_mensaje, i);
    }
  fputs ("\n", fichUla);
  
  fputs ("-- LOCALIDADES --\n\n", fichSpellCheck);
  for (i = 0; i < txtLugares->ocupado; i++)
  {
    fprintf (fichUla, ":dl%010d\n",i);
    dumpStringAsNumbers(fichUla, ChangeSpaces(txtLugares->mensajes[i].mensaje));
	fprintf (fichSpellCheck,"%s\n", limpiarTexto(txtLugares->mensajes[i].mensaje) );
  }
  fputs ("\n\n", fichSpellCheck);
}

void
VolcarConexiones ()
{
  int i, j;
  fputs ("\n", fichUla);
  fputs (";;;;;;;;;;;;;;\n", fichUla);
  fputs ("; CONEXIONES ;\n", fichUla);
  fputs (";;;;;;;;;;;;;;\n", fichUla);

  fputs ("\n", fichUla);
  fputs (":conexiones\n", fichUla);


  /* Conexiones de cada localida */
  for (i = 0; i < ultTextoLugar + 1; i++)
    {
      fprintf (fichUla, ":cx%03d\n", i);
      for (j = 0; j < 16; j++)
		{
		    fprintf (fichUla, "dc.l %d.l\n", Salida (i, j));
		}
      fputs ("\n", fichUla);
    }

  fputs ("\n\n", fichUla);
  fputs (":conexiones_copia\n", fichUla);


  /* Conexiones de cada localida */
  for (i = 0; i < ultTextoLugar + 1; i++)
    {
      fprintf (fichUla, ":cxc%03d\n", i);
      for (j = 0; j < 16; j++)
		{
		    fprintf (fichUla, "dc.l %d.l\n", Salida (i, j));
		}
      fputs ("\n", fichUla);
    }


}

void
VolcarFicheroCFG(const char * nombreFuente)
{
  
  char nombreDestino[2048];
  FILE *fichCFG;
  char * finNombre;

  strcpy (nombreDestino, nombreFuente);
  finNombre = strrchr (nombreDestino, '.');
  if (finNombre)
    *finNombre = '\0';
  strcat (nombreDestino, ".cfg");
  /* Abrir el fichero de destino */
  if ((fichCFG = fopen (nombreDestino, "wt")) == NULL)
  {
      printf ("No se puede crear el fichero de configuracion para escribirlo.\n");
      exit (-1);
  }
  
  if(iscfgvar("WINDOWBORDERS"))fprintf(fichCFG, "WindowBorders=%s\n", (!strcasecmp(cfgvarvalue("WINDOWBORDERS", "ON"),"ON")?"yes":"no"));
  if(iscfgvar("WINDOWFRAME"))fprintf(fichCFG, "WindowFrame=%s\n", (!strcasecmp(cfgvarvalue("WINDOWFRAME", "ON"),"ON")?"yes":"no"));
  if(iscfgvar("WINDOWWIDTH"))fprintf(fichCFG, "WindowWidth=%s\n", cfgvarvalue("WINDOWWIDTH", "640"));
  if(iscfgvar("WINDOWHEIGHT"))fprintf(fichCFG, "WindowHeight=%s\n", cfgvarvalue("WINDOWHEIGHT", "400"));
  if(iscfgvar("WINDOWMASK"))fprintf(fichCFG, "WindowMask=%s\n", cfgvarvalue("WINDOWMASK", "0"));
  
  if(iscfgvar("PROPORTIONALFACE"))fprintf(fichCFG, "FontName=%s\n", cfgvarvalue("PROPORTIONALFACE", "Arial"));
  if(iscfgvar("PROPORTIONALSIZE"))fprintf(fichCFG, "FontSize=%s\n", cfgvarvalue("PROPORTIONALSIZE", "12"));
  if(iscfgvar("TYPEWRITERFACE"))fprintf(fichCFG, "FixedFontName=%s\n", cfgvarvalue("TYPEWRITERFACE", "Courier New"));
  if(iscfgvar("TYPEWRITERSIZE"))fprintf(fichCFG, "FixedFontSize=%s\n", cfgvarvalue("TYPEWRITERSIZE", "14"));
  
  fclose(fichCFG);
}


#define NUL '\0'




void
VolcarVariablesDeConfiguracion(void)
{
  int i;
  char cad1[2048];
  const char * graphic_pos = cfgvarvalue("GRAPHIC_POSITION","UP");
  char * graphic_pos_val;
  
  char * deftypewriter [] = {
  "OFF", "OFF", "OFF", "OFF", "OFF", "OFF", "OFF", "OFF", "OFF", "OFF", "OFF" };
  
  char * defbold [] = {
  "OFF", "OFF", "OFF", "OFF", "OFF", "OFF", "OFF", "OFF", "ON" , "ON" , "OFF" };
  
  char * defitalic [] = {
  "OFF", "OFF", "OFF", "OFF", "OFF", "OFF", "OFF", "OFF", "OFF", "OFF", "ON"  };
  
  char * defforeground [] = {
  "ffffff", "ff0000", "00ff00", "0000ff", "ffff00", "00ffff", "ff00ff", "808080", "ffffff", "ffffff", "ffffff"  };
  
  char * defbackground [] = {
  "000000", "000000", "000000", "000000", "000000", "000000", "000000", "000000", "000000", "000000", "000000"  };
  
  fputs ("\n", fichUla);
  fputs (";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;\n", fichUla);
  fputs ("; VARIABLES DE CONFIGURACION ;\n", fichUla);
  fputs (";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;\n", fichUla);
  fputs ("\n", fichUla);

  fprintf(fichUla, ":cfg_musicstop dc.l %d.l\n", !strcasecmp(cfgvarvalue("MUSICSTOP","ON"), "ON")?1:0);
  
  for(i=0;i<11;i++) {
    trim(deftypewriter[i]);
    trim(defbold[i]);
    trim(defitalic[i]);
    trim(defforeground[i]);
    trim(defbackground[i]);
  	sprintf(cad1, "TYPEWRITER_%d", i);
  	fprintf(fichUla, ":cfg_typewriter_%d dc.l %s.l\n", i, !strcasecmp(cfgvarvalue(cad1, (deftypewriter[i])), "ON")?"0":"1");
  	
	sprintf(cad1, "BOLD_%d", i);
  	fprintf(fichUla, ":cfg_bold_%d dc.l %s.l\n", i, !strcasecmp(cfgvarvalue(cad1, (defbold[i])), "ON")?"1":"0");
	
	sprintf(cad1, "ITALIC_%d", i);
  	fprintf(fichUla, ":cfg_italic_%d dc.l %s.l\n", i, !strcasecmp(cfgvarvalue(cad1, (defitalic[i])), "ON")?"1":"0");
	
	sprintf(cad1, "FOREGROUND_%d", i);
  	fprintf(fichUla, ":cfg_foreground_%d dc.l 0x%s.l\n", i, cfgvarvalue(cad1, (defforeground[i])));
	
	sprintf(cad1, "BACKGROUND_%d", i);
  	fprintf(fichUla, ":cfg_background_%d dc.l 0x%s.l\n", i, cfgvarvalue(cad1, (defbackground[i])));
  }
  
  fprintf(fichUla, ":cfg_graphic_percent dc.l %s.l\n", cfgvarvalue("GRAPHIC_PERCENT","50"));
  
  if(!strcasecmp(graphic_pos, "UP")||!strcasecmp(graphic_pos, "TOP") || !strcasecmp(graphic_pos, "NORTH"))
  {
    graphic_pos_val="22"; /* winMethod_Above|winMethod_Proportional */
  }
  else if (!strcasecmp(graphic_pos, "DOWN")||!strcasecmp(graphic_pos, "BOTTOM") || !strcasecmp(graphic_pos, "SOUTH"))
  {
    graphic_pos_val="23"; /* winMethod_Below|winMethod_Proportional */
  }
  else if (!strcasecmp(graphic_pos, "LEFT")||!strcasecmp(graphic_pos, "WEST"))
  {
    graphic_pos_val="20"; /* winMethod_Left|winMethod_Proportional */
  }
  else if (!strcasecmp(graphic_pos, "RIGHT")||!strcasecmp(graphic_pos, "EAST"))
  {
    graphic_pos_val="21"; /* winMethod_Right|winMethod_Proportional */
  }
  else
  {
    graphic_pos_val="22"; /* winMethod_Above|winMethod_Proportional */
  }
  
  fprintf(fichUla, ":cfg_graphic_position dc.l 0x%s.l\n", graphic_pos_val);
  
}

void
VolcarObjetos (void)
{
  int i, objetosLlevados;
  fputs ("\n", fichUla);
  fputs (";;;;;;;;;;;;;;;;;;;;\n", fichUla);
  fputs ("; TABLA DE OBJETOS ;\n", fichUla);
  fputs (";;;;;;;;;;;;;;;;;;;;\n", fichUla);
  fputs ("\n", fichUla);
  fputs (":objetos\n", fichUla);
  objetosLlevados = 0;
  for (i = 0; i < ultTextoObjeto + 1; i++)
    {
      fprintf (fichUla, ":obj%03d\n", i);
      fprintf (fichUla, " dc.l %d.l\n", objetos[i].nombre);
      fprintf (fichUla, " dc.l %d.l\n", objetos[i].adjetivo);
      fprintf (fichUla, " dc.l %d.l\n", objetos[i].lugar);
      fprintf (fichUla, " dc.l %d.l\n", objetos[i].peso);
      fprintf (fichUla, " dc.l %d.l\n", objetos[i].lo_flags); /* Antes 'contenedor' */
      fprintf (fichUla, " dc.l %d.l\n", objetos[i].hi_flags);/* Antes 'prenda' */
      fprintf (fichUla, " dc.l :do%010d\n", i);
      if (objetos[i].lugar == 254)
	objetosLlevados++;
    }
  fprintf (fichUla, ":fin_de_objetos\n ds.l 1\n");
  fprintf (fichUla, ":numero_ultimo_objeto dc.l %d.l\n", ultTextoObjeto);
  fprintf (fichUla, ":numero_inicial_de_objetos_llevados dc.l %d\n",
	   objetosLlevados);
  fprintf (fichUla, ":tamaño_buffer_ramsave dc.l %d\n",
	   1024 + (ultTextoObjeto + 1) * 28);
  fprintf (fichUla, ":ramsave_buffer ds.l %d\n",
	   1024 + (ultTextoObjeto + 1) * 28);
  fprintf (fichUla, ":localidad_inicial\n");
  for (i = 0; i < ultTextoObjeto + 1; i++)
    {
      fprintf (fichUla, " dc.l %d.l\n", objetos[i].lugar);
    }


  fprintf (fichUla, ":atributos_inicial\n");
  for (i = 0; i < ultTextoObjeto + 1; i++)
    {
      fprintf (fichUla, " dc.l %d.l\n dc.l %d.l\n", objetos[i].lo_flags,objetos[i].hi_flags);
    }




}

char * ChangeSpaces(char *cadena)
{

	int i;

	/* Substituyo caracteres ¬ por espacios */
	for (i=0;cadena[i]!=0;i++)
		if ((unsigned char)cadena[i]==0xAC) cadena[i] = (unsigned char)0x20;
	return(cadena);
}


void dumpStringAsNumbers(FILE * f, char * s)
{

	int i;
	unsigned char c;

	fprintf(f,"dc.b 0xE0");
	for (i=0;s[i]!=0;i++)
	{
	  if (!(i % 8))
		  fprintf(f,"\ndc.b ");


	  c = s[i];

	  if (c=='\\')
	  {
		  switch (s[i+1])
		  {
				case '\\': i++;
						  if (!(i % 8)) fprintf(f,"\ndc.b ");

				break;
				case 'n': i++;
					      c=(unsigned char)10;
						  if (!(i % 8)) fprintf(f,"\ndc.b ");
				break;
		  }
	  }
    fprintf (f,"%i ",(unsigned char)c);


	}
	
	if (strlen(s)>1000) {
		s[997] = '.';	/* Corto la cadena a 1000 caracteres y la pongo como comentario, ademas del 0 final de cadena */
		s[998] = '.';
		s[999] = '.';
		s[1000] = 0;	
	};

	fprintf(f,"\ndc.b 0x00 0x00\n ; %s\n", s);
	

}
