#!/bin/bash

PROTOCOL="irc"

touch $PROTOCOL.pcap
ls | while read in; 
do 
  echo $in;
  tshark -r $in -w $in.$PROTOCOL $PROTOCOL;
  mergecap -a -w $PROTOCOL.pcap.new $PROTOCOL.pcap $in.$PROTOCOL;
  rm $in.$PROTOCOL;
  mv $PROTOCOL.pcap.new $PROTOCOL.pcap;
done;
