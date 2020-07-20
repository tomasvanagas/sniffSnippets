#!/bin/bash

#PROTOCOL="pop"
PROTOCOL="http.request || http.response"
SIMPLE_NAME="http"


touch $SIMPLE_NAME.pcap
ls *pcap* | while read in; 
do
  echo $in;
  tshark -r $in -w $in.$SIMPLE_NAME $PROTOCOL;
  mergecap -a -w $SIMPLE_NAME.pcap.new $SIMPLE_NAME.pcap $in.$SIMPLE_NAME;
  rm $in.$SIMPLE_NAME;
  mv $SIMPLE_NAME.pcap.new $SIMPLE_NAME.pcap;
done;
