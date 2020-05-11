#!/bin/bash

# HCCAPX
echo "[*] Now working on HCCAPX hashes! Please wait...";
hcxpcaptool $1 -o tempHashes.hccapx &>/dev/null;
mkdir -p hccapx;
hcxessidtool --hccapx1=tempHashes.hccapx --essidout=/dev/stdout | grep -v "tempHashes.hccapx" | while read in;
do
        echo "[*] HCCAPX Generate: $in";
        hcxessidtool --hccapx1=tempHashes.hccapx -e "$in" --hccapxout="./hccapx/$in.hccapx" &>/dev/null;
done;
rm tempHashes.hccapx;


# PMKID
echo "[*] Now working on PMKID hashes! Please wait...";
hcxpcaptool $1 -z tempHashes.pmkid &>/dev/null;
mkdir -p pmkid;
hcxessidtool --pmkid1=tempHashes.pmkid --essidout=/dev/stdout | grep -v "tempHashes.pmkid" | while read in;
do
        echo "[*] PMKID Generate: $in";
        hcxessidtool --pmkid1=tempHashes.pmkid -e "$in" --pmkidout="./pmkid/$in.pmkid" &>/dev/null;
done;
rm tempHashes.pmkid;
