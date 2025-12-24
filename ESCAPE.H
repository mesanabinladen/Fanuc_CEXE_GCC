
#define cls()           printf( "\033[2J" )  
#define clear_from()    printf( "\033[0J" )  
#define home()          printf( "\033[H" )   
#define cursor_on()     printf( "\033[>5l" ) 
#define cursor_off()    printf( "\033[>5h" ) 
#define beam_on()       printf( "\033[>9l" ) 
#define beam_off()      printf( "\033[>9h" ) 
#define blink_on()      printf( "\033[5m" )  
#define blink_off()     printf( "\033[25m" ) 
#define reverse_on()    printf( "\033[7m" )  
#define reverse_off()   printf( "\033[27m" ) 
#define normal_size()   printf( "\033(4" )   
#define triple_size()   printf( "\033(6" )   
#define setmode4016()   crt_setmode( 0 )     
#define setmode8025()   crt_setmode( 1 )
#define attrib_clr()    printf( "\033[0m" )


/* color */

#define color(x)        printf( "\033[3%um", x )
#define black()         printf( "\033[30m" )
#define red()           printf( "\033[31m" )
#define green()         printf( "\033[32m" )
#define yellow()        printf( "\033[33m" )
#define blue()          printf( "\033[34m" )
#define magenta()       printf( "\033[35m" )
#define cyan()          printf( "\033[36m" )
#define white()         printf( "\033[37m" )


/* move coursor and display string */

#define locate(y, x)             printf("\033[%d;%dH", y, x)
#define locprintf(y, x, string)  { locate(y, x); printf("%s", string); }
#define rprintf(string)          printf("\033[7m%s\x1b[0m", string)
#define locrprintf(y, x, string) { locate(y, x); reverse(string); }



#define wrap_on()       printf( "\033[7h" )
#define wrap_off()      printf( "\033[7l" )
