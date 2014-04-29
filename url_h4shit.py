#!/usr/bin/python

import csv, urllib2, re, sys, getopt

def main(argv):
	in_url='www.epa.gov'
	vt_result = vt_lookup(in_url)
	vt_result = vt_result.split(", ")
	scan_count = len(vt_result)
	#scan_count = vt_result.count("/")
	bad_scan=0
	for scan in vt_result:
		if scan.startswith("'0"):
			good_scan=1
		else:
			bad_scan=bad_scan+1
	print in_url + " was scanned by VT " + str(scan_count) + " times and " + str(bad_scan) + " reported badness."	

def vt_lookup(in_url):
	vt_url="https://www.virustotal.com/en/domain/" + in_url + "/information/"
        vt_request = urllib2.Request(vt_url)
        vt_request.add_header("User-agent", "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.72 Safari/537.36")
        vt_result = urllib2.urlopen(vt_request)
	vt_result_string = (str(vt_result.read()))
	print vt_result_string
	#regex = re.compile('\\d+\\s+\\/\\s+\\d+', re.IGNORECASE)
	regex = re.compile('\\d+\\/\\d+', re.IGNORECASE)
	regex_result = str(re.findall(regex,vt_result_string))
	vt_output = str(regex_result)[2:-2]
	if vt_output != "":
		return  vt_output
	else:
		return "NO_DATA"

if __name__ == "__main__":
	main(sys.argv[1:])
