/*Definition file of the user application's version number.(must be required)
The user application's version number is defined in this file.
For example, version number definition is as follows.
char version[] = "TEST0001" ;
"TEST" is the series string and "0001" is edition number.
You can replace them with your original version number.
There are no particular naming rules of version number.
You can define them arbitrarily. However, limited characters(such as uppercase
and numeric character, some marks) are available in the version string. The
version string which is defined in this file is displayed in SYSTEM screen of
CNC.*/

char version[] = "TEST1234" ;
/*               "SSSSeeee"  "SSSS":Series, "eeee":Edition */
/* Version string length MUST BE 8 !!                      */

/*-----------------------------------------------------------
Available character is 20H-5FH in ASCII code as follows.

	     0123456789ABCDEF
	   +-----------------
	20 |  !"#$%&'()*+,-./
	30 | 0123456789:;<=>?
	40 | @ABCDEFGHIJKLMNO
	50 | PQRSTUVWXYZ[\]^_

-----------------------------------------------------------*/

/*   End of file [version.c] */
