# gawk
# chk_len2.awk
BEGIN{
	adr["TASK1_LEN"] = "0" ;
	adr["TASK2_LEN"] = "0" ;
	adr["TASK3_LEN"] = "0" ;
	adr["TASK4_LEN"] = "0" ;
	adr["TASK5_LEN"] = "0" ;
	adr["TASK6_LEN"] = "0" ;
}
{
	 for (i = 1; i < ARGC; i++) {
		filename[i] =  ARGV[i];
	}
	for(i = 1; i < ARGC; i++){
		while( getline < filename[i] > 0 ) {
			adr[$1] = $2;
		}
		if (getline < filename[i] == -1) {
            print "Error reading file:", filename[i]  # Stampa di debug per errori
        }
	}
}
END{
	if(adr["TASK1_LEN"]!="0"){
		HEAD_TSK = "task1";
	}else if(adr["TASK2_LEN"]!="0"){
		HEAD_TSK = "task2";
	}else if(adr["TASK3_LEN"]!="0"){
		HEAD_TSK = "task3";
	}else if(adr["TASK4_LEN"]!="0"){
		HEAD_TSK = "task4";
	}else if(adr["TASK5_LEN"]!="0"){
		HEAD_TSK = "task5";
	}else{
		HEAD_TSK = "task6";
	}
#	adr["TASK1_TOP"] = hextodec("220") ;
	adr["TASK1_TOP"] = hextodec("224") ;
	adr["TASK1_LEN"] = hextodec(adr["TASK1_LEN"])+hextodec("10") ;
	adr["TASK1_END"] = adr["TASK1_TOP"] + adr["TASK1_LEN"] -1 ;

	adr["TASK2_TOP"] = adr["TASK1_END"] +1 ;
	adr["TASK2_LEN"] = hextodec(adr["TASK2_LEN"])+hextodec("10") ;
	adr["TASK2_END"] = adr["TASK2_TOP"] + adr["TASK2_LEN"] -1 ;

	adr["TASK3_TOP"] = adr["TASK2_END"] +1 ;
	adr["TASK3_LEN"] = hextodec(adr["TASK3_LEN"])+hextodec("10") ;
	adr["TASK3_END"] = adr["TASK3_TOP"] + adr["TASK3_LEN"] -1 ;

	adr["TASK4_TOP"] = adr["TASK3_END"] +1 ;
	adr["TASK4_LEN"] = hextodec(adr["TASK4_LEN"])+hextodec("10") ;
	adr["TASK4_END"] = adr["TASK4_TOP"] + adr["TASK4_LEN"] -1 ;

	adr["TASK5_TOP"] = adr["TASK4_END"] +1 ;
	adr["TASK5_LEN"] = hextodec(adr["TASK5_LEN"])+hextodec("10") ;
	adr["TASK5_END"] = adr["TASK5_TOP"] + adr["TASK5_LEN"] -1 ;

	adr["TASK6_TOP"] = adr["TASK5_END"] +1 ;
	adr["TASK6_LEN"] = hextodec(adr["TASK6_LEN"])+hextodec("10") ;
	adr["TASK6_END"] = adr["TASK6_TOP"] + adr["TASK6_LEN"] -1 ;

	adr["COMM_TOP"] = adr["TASK6_END"] +1 ;
	adr["COMM_LEN"] = hextodec(adr["COMM_LEN"])-hextodec("600000")+hextodec("10") ; 
	adr["COMM_END"] = adr["COMM_TOP"] + adr["COMM_LEN"] -1 ;

	adr["DRAM_TOP"] = adr["COMM_END"] +1 ;
	adr["DRAM_LEN"] = hextodec(adr["DRAM_LEN"])-hextodec("700000")+hextodec("10") ;
	adr["DRAM_END"] = adr["DRAM_TOP"] + adr["DRAM_LEN"] -1 ;

	if( (adr["DRAM_END"]+0x80)%0x20000 )	{	adr["UNIT_SIZE"] = int((adr["DRAM_END"]+0x80) / 0x20000) + 1 ;	}
	else									{	adr["UNIT_SIZE"] = int((adr["DRAM_END"]+0x80) / 0x20000) ;		}
	adr["CHK_SIZE"] = adr["UNIT_SIZE"] * 0x20000 ;
	if( adr["UNIT_SIZE"] <= 0x04 )		{	adr["FROM_NAME"] = 0x20 ;	}
	else if( adr["UNIT_SIZE"] <= 0x08 )	{	adr["FROM_NAME"] = 0x30 ;	}
	else if( adr["UNIT_SIZE"] <= 0x0C )	{	adr["FROM_NAME"] = 0x90 ;	}
	else if( adr["UNIT_SIZE"] <= 0x10 )	{	adr["FROM_NAME"] = 0x40 ;	}
	else if( adr["UNIT_SIZE"] <= 0x14 )	{	adr["FROM_NAME"] = 0xA0 ;	}
	else if( adr["UNIT_SIZE"] <= 0x18 )	{	adr["FROM_NAME"] = 0x50 ;	}
	else if( adr["UNIT_SIZE"] <= 0x1C )	{	adr["FROM_NAME"] = 0xB0 ;	}
	else if( adr["UNIT_SIZE"] <= 0x20 )	{	adr["FROM_NAME"] = 0x60 ;	}
	else if( adr["UNIT_SIZE"] <= 0x28 )	{	adr["FROM_NAME"] = 0x70 ;	}
	else if( adr["UNIT_SIZE"] <= 0x30 )	{	adr["FROM_NAME"] = 0x80 ;	}
	else if( adr["UNIT_SIZE"] <= 0x38 )	{	adr["FROM_NAME"] = 0xC0 ;	}
	else if( adr["UNIT_SIZE"] <= 0x40 )	{	adr["FROM_NAME"] = 0xD0 ;	}
	else if( adr["UNIT_SIZE"] <= 0x48 )	{	adr["FROM_NAME"] = 0xE0 ;	}
	else if( adr["UNIT_SIZE"] <= 0x50 )	{	adr["FROM_NAME"] = 0xF0 ;	}
	else if( adr["UNIT_SIZE"] <= 0x58 )	{	adr["FROM_NAME"] = 0x100 ;	}
	else if( adr["UNIT_SIZE"] <= 0x60 )	{	adr["FROM_NAME"] = 0x110 ;	}
	else if( adr["UNIT_SIZE"] <= 0x68 )	{	adr["FROM_NAME"] = 0x120 ;	}
	else if( adr["UNIT_SIZE"] <= 0x70 )	{	adr["FROM_NAME"] = 0x130 ;	}
	else if( adr["UNIT_SIZE"] <= 0x78 )	{	adr["FROM_NAME"] = 0x140 ;	}
	else if( adr["UNIT_SIZE"] <= 0x80 )	{	adr["FROM_NAME"] = 0x150 ;	}
	else								{	adr["FROM_NAME"] = 0x00 ;	}
	adr["FROM_END"] = adr["CHK_SIZE"] - 1 ;

	printf("s/SRAM_ALEN/%08s/g\n",adr["SRAM_ALEN"]);
	printf("s/HEAD_TSK/%s/g\n",HEAD_TSK);
	printf("s/TASK1_TOP/%07x/g\n",adr["TASK1_TOP"]);
	printf("s/TASK1_LEN/%08x/g\n" ,adr["TASK1_LEN"]);
	printf("s/TASK1_END/%07x/g\n",adr["TASK1_END"]);
	printf("s/TASK2_TOP/%07x/g\n",adr["TASK2_TOP"]);
	printf("s/TASK2_LEN/%08x/g\n" ,adr["TASK2_LEN"]);
	printf("s/TASK2_END/%07x/g\n",adr["TASK2_END"]);
	printf("s/TASK3_TOP/%07x/g\n",adr["TASK3_TOP"]);
	printf("s/TASK3_LEN/%08x/g\n" ,adr["TASK3_LEN"]);
	printf("s/TASK3_END/%07x/g\n",adr["TASK3_END"]);
	printf("s/TASK4_TOP/%07x/g\n",adr["TASK4_TOP"]);
	printf("s/TASK4_LEN/%08x/g\n" ,adr["TASK4_LEN"]);
	printf("s/TASK4_END/%07x/g\n",adr["TASK4_END"]);
	printf("s/TASK5_TOP/%07x/g\n",adr["TASK5_TOP"]);
	printf("s/TASK5_LEN/%08x/g\n" ,adr["TASK5_LEN"]);
	printf("s/TASK5_END/%07x/g\n",adr["TASK5_END"]);
	printf("s/TASK6_TOP/%07x/g\n",adr["TASK6_TOP"]);
	printf("s/TASK6_LEN/%08x/g\n" ,adr["TASK6_LEN"]);
	printf("s/TASK6_END/%07x/g\n",adr["TASK6_END"]);
	printf("s/COMM_TOP/%07x/g\n" ,adr["COMM_TOP"]);
	printf("s/COMM_LEN/%08x/g\n"  ,adr["COMM_LEN"]);
	printf("s/COMM_END/%07x/g\n" ,adr["COMM_END"]);
	printf("s/DRAM_TOP/%07x/g\n" ,adr["DRAM_TOP"]);
	printf("s/DRAM_LEN/%08x/g\n"  ,adr["DRAM_LEN"]);
	printf("s/DRAM_END/%07x/g\n" ,adr["DRAM_END"]);
	printf("s/UNIT_SIZE/%04x/g\n" ,adr["UNIT_SIZE"]);
	printf("s/CHK_SIZE/%07x/g\n" ,adr["CHK_SIZE"]);
	printf("s/FROM_NAME/%03x/g\n" ,adr["FROM_NAME"]);
	printf("s/FROM_END/%07x/g\n" ,adr["FROM_END"]);
}
#============== function ===============================================
function hextodec(hex) {
	num = 0;
	cnt = length(hex);
	while (cnt > 0) {
		loc = length(hex)-cnt+1;
		if ( match(substr(hex,loc,1),/[aA]/) ) 
			dec = 10;
		else if ( match(substr(hex,loc,1),/[bB]/) ) 
			dec = 11;
		else if ( match(substr(hex,loc,1),/[cC]/) ) 
			dec = 12;
		else if ( match(substr(hex,loc,1),/[dD]/) ) 
			dec = 13;
		else if ( match(substr(hex,loc,1),/[eE]/) ) 
			dec = 14;
		else if ( match(substr(hex,loc,1),/[fF]/) ) 
			dec = 15;
		else
			dec = substr(hex,loc,1);

		num = num + dec*16^(cnt-1);
		cnt--;
	}
	return num ;
}
