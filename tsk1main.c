/********** Sample program tsk1main.c **********/
#include <stdio.h>
#include <stdlib.h>
#include <conio.h>
#include <mdi.h>
#include <crt.h>
#include <fwindow.h>
#include <data.h>
#include <errno.h>
#include <bios.h>
#include <time.h>
#include <oscall.h>
#include <graph.h>
#include "escape.h"
int task1_var1;
int task1_var2 = 0;
//const task1_var3 = 0;
void task_start( void )
{
	int ret, line, col, i, key_code;
	int crt_table[] = { CRT_POS_REL };
	struct odbdy all_data;
	/* setting video mode */
	ret = _setvideomode( _VRES16COLOR );
	/* usee screen setting */
	crt_setuserscrn( scrn_tbl_size(crt_table),crt_table );
	crt_cncscrn(CRT_POS_ALL) ;
	cls();
	crt_opengr() ;
	crt_graphic(CRT_ON_BEAM);
	_clearscreen( _GCLEARSCREEN );
	/* graphics sample */
	_setlinestyle(0xFFEA);
	for (i = 0 ; i < 40 ; i++) 
	{
		_setcolor((short)(i % 7 + 1)) ;
		_moveto((short)(8 * i), (short)(6 * i)) ;
		_lineto((short)(639 - 8 * i), (short)(6 * i)) ;
		_lineto((short)(639 - 8 * i), (short)(479 - 6 * i)) ;
		_lineto((short)(8 * i), (short)(479 - 6 * i)) ;
		_lineto((short)(8 * i), (short)(6 * i)) ;
	}
	printf("¥n") ;
	printf("PRESS INPUT KEY¥n") ;
	for (;;) 
	{
		/* key read */
		key_code = _kbhit() ;
		if (key_code) break;
	}
	cls();
	_clearscreen( _GCLEARSCREEN );
	crt_closegr();
	/* position sample */
	cursor_off();
	while( 1 ) {
		cnc_rddynamic( -1, sizeof(all_data), &all_data );
		line = 2;
		col = 20;
		locate( line++, col );
		printf( "ABSOLUTE" ) ;
		locate( line++, col );
		printf( "1:%8ld", all_data.pos.faxis.absolute[0] );
		locate( line++, col );
		printf( "2:%8ld", all_data.pos.faxis.absolute[1] );
		locate( line++, col );
		printf( "3:%8ld", all_data.pos.faxis.absolute[2] );
		locate( line++, col );
		printf( "4:%8ld", all_data.pos.faxis.absolute[3] );
		line++;
		locate( line++, col );
		printf( "MACHINE" );
		locate( line++, col );
		printf( "1:%8ld", all_data.pos.faxis.machine[0] );
		locate( line++, col );
		printf( "2:%8ld", all_data.pos.faxis.machine[1] );
		locate( line++, col );
		printf( "3:%8ld", all_data.pos.faxis.machine[2] );
		locate( line++, col );
		printf( "4:%8ld", all_data.pos.faxis.machine[3] );
		line++;
		locate( line++, col );
		printf( "RELATIVE" ) ;
		locate( line++, col );
		printf( "1:%8ld", all_data.pos.faxis.relative[0] );
		locate( line++, col );
		printf( "2:%8ld", all_data.pos.faxis.relative[1] );
		locate( line++, col );
		printf( "3:%8ld", all_data.pos.faxis.relative[2] );
		locate( line++, col );
		printf( "4:%8ld", all_data.pos.faxis.relative[3] );
		line++;
		locate( line++, col );
		printf( "DIST" );
		locate( line++, col );
		printf( "1:%8ld", all_data.pos.faxis.distance[0] );
		locate( line++, col );
		printf( "2:%8ld", all_data.pos.faxis.distance[1] );
		locate( line++, col );
		printf( "3:%8ld", all_data.pos.faxis.distance[2] );
		locate( line++, col );
		printf( "4:%8ld", all_data.pos.faxis.distance[3] );
		}
	}
/*----- end of main.c -----*/