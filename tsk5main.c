#include "escape.h"
#include <hilev.h>

int task_start()
{
	int i;
	
	for (;;) 
	{
		cnc_hldata(DATA_START);

		for (i=100;i>0;i--)
		{
			
		}
		cnc_hldata(DATA_END);

		rettask();
	}
}







