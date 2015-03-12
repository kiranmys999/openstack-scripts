if [ $# -lt 1 ]
	then
		echo "Correct Syntax: $0 [ controller | compute | networknode ] <controller-ip-address>"
		exit 1;
fi

case $1 in
	controller) 
		bash $(dirname $0)/../update-etc-hosts.sh controller
		bash $(dirname $0)/update-nova-config-ip.sh controller
		bash $(dirname $0)/restart.sh controller all
		;;
	compute)
		bash $(dirname $0)/../update-etc-hosts.sh compute $2
		bash $(dirname $0)/update-nova-config-ip.sh compute $2
		bash $(dirname $0)/restart.sh compute all
		;;
	networknode)
		bash $(dirname $0)/../update-etc-hosts.sh networknode $2
		bash $(dirname $0)/restart.sh networknode all
		;;
	*)
		echo "Invalid node type: $1"
		exit 1
esac
		
