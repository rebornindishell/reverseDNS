#!/bin/bash

for i in {1..255}
do
echo "192.168.0.$i" >> ipRange
done
# replace the ip with your desired value, replace /modify CIDR accordingly.
#list of ips generated in ipRange file.
#####################################################################
# now for reverse DNS script we can do it with host or dig commands.
# this is with host command which will give you list of subdomains :

cat ipRange| while read line
do
host $line |grep -v "not found" | awk '{print $NF}'
done

### OR with dig command:

cat ipRange | while read line                       
do
dig -x $line | awk '{print $NF}' |grep ".com" ## change grep according to tld .com/.in whatever
done

## this will not give an exhaustive list but it's a good start for initial enumeration.
