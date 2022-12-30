echo "Enter the starting date :"
read d1
echo "Enter the ending date:"
read dz
echo $((($(date -d $dz +%s)-$(date -d $d1 +%s ))/(24*60*60)))days
