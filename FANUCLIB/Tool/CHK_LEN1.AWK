# gawk
# chk_len1.awk
$0~/^\.cex_end/ {
	printf("TASK%d_LEN %s\n",task,$2);
}

$0~/^\.comm_end/ {
	printf("COMM_LEN %s\n",$2);
}

$0~/^\.dram_end/ {
	printf("DRAM_LEN %s\n",$2);
}

$0~/^\.sram_data/ {
	printf("SRAM_ALEN %s\n",$3);
}
