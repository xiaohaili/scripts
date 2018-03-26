#!/bin/bash

# jobstat-json2csv.sh
# 
# jq: commandline JSON processor https://stedolan.github.io/jq
# json2csv: command line tool to convert json to csv http://github.com/jehiah/json2csv

json="job.json"

strdate=$(cat $json | ./jq -r '. | .datelist | .[] ')
strhpc=$(cat $json | ./jq -r '. | .hpclist | .[] ')

cat $json | ./jq -c '. | .data | .children[] | {name, u: .children[]}' | \
    ./json2csv -k name,u.name,u.jobcount,u.coresum,u.walltime | \
    awk -F',' -v strdate="$strdate" -v strhpc="$strhpc" '
	BEGIN {
		split(strdate, datelist, "\n");
		split(strhpc, hpclist, "\n");
	}
	{
		jobcount[$1, $2] = $3;
		coresum[$1, $2] = $4;
		walltime[$1, $2] = $5;
	}
	END {
		printf(" , ");
		for (j=1; j<=length(hpclist); j++) {
			printf("%s, ", hpclist[j]);
		}
		printf("\n");
		for (i=1; i<=length(datelist); i++) {
			printf("%s, ", datelist[i]);
			for (j=1; j<=length(hpclist); j++) {
				printf("%-4d, ", jobcount[datelist[i], hpclist[j]]);
			}
			printf("\n");
		}
		printf("\n");


		printf(" , ");
		for (j=1; j<=length(hpclist); j++) {
			printf("%s, ", hpclist[j]);
		}
		printf("\n");
		for (i=1; i<=length(datelist); i++) {
			printf("%s, ", datelist[i]);
			for (j=1; j<=length(hpclist); j++) {
				printf("%-4d, ", coresum[datelist[i], hpclist[j]]);
			}
			printf("\n");
		}
		printf("\n");


		printf(" , ");
		for (j=1; j<=length(hpclist); j++) {
			printf("%s, ", hpclist[j]);
		}
		printf("\n");
		for (i=1; i<=length(datelist); i++) {
			printf("%s, ", datelist[i]);
			for (j=1; j<=length(hpclist); j++) {
				printf("%-4d, ", walltime[datelist[i], hpclist[j]]);
			}
			printf("\n");
		}
	}'
