while getopts t: opt
do
case "$opt" in
t)
if [ $OPTARG = "IPv4" ]
then
pingcommand=$(which ping)
elif [ $OPTARG = "IPv6" ]
then
pingcommand=$(which ping6)
else
echo "usage: -t IPv4 or -t IPv6"
echo "Exiting script..."
exit
fi
;;
*)echo "Usage: -t IPv4 or -t IPv6"
echo "Exiting script..."
exit;;
esac
shift$[ $OPTIND -1 ]
if [ $# -eq 0 ]
then
echo
echo "IP Address(es) parameters are missing."
echo
echo "Exiting script..."
exit
fi
for ipaddress in "$@"
do
echo
echo "Checking system at $ipaddress..."
echo 
$pingcommand -q -c 10 $ipaddress
echo
done
exit
done