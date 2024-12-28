#######################################################################
# FUNCTIONS 
# Some functions to make things easier for the sysadmin.
#######################################################################

## Show all processes listening on TCP ports
function tcplisten() {
	sudo netstat -tlnp
}

## Show all processes listening on UDP ports
function udplisten() {
	sudo netstat -ulnp
}

## Try to exec a program until get success
function tryrun() {
	local COUNT=0
	until $@  
	do
		let COUNT++
		echo "${COUNT}o. error running $@"
		sleep 2
	done
}

## Check of a process is running using its name
function is_running() {
	sudo ps -ef | grep --color=auto -v grep | grep --color=auto "$1"
	[ $? -eq 0 ] && echo "Yes, it is running." || echo "No, it is stopped."
}

## Show the lan IP
function my_ip_lan() {
  ip addr list | 
  egrep -o 'inet [0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | 
  cut -d ' ' -f 2
}

## Show the Internet address
function my_ip_wan() {
  curl -s http://ifconfig.me
}

## Creates a directory and cd to it
function mkdircd() {
	mkdir "$1" && cd "$1"
}

function ruby_http_server() {
	ruby -run -e httpd . -p 8080
}

function set_proxy() {
	export http_proxy="http://$1"
	export https_proxy="$http_proxy"
	export ftp_proxy="$http_proxy"
	export HTTP_PROXY="$http_proxy"
	export HTTPS_PROXY="$http_proxy"
	export FTP_PROXY="$http_proxy"
	env | grep -i proxy
}

function unset_proxy() {
	unset http_proxy
	unset https_proxy
	unset ftp_proxy
	unset HTTP_PROXY
	unset HTTPS_PROXY
	unset FTP_PROXY
	env | grep -i proxy
}

function debupdate() {
	sudo apt-get update
	sudo apt-get install -y
	sudo apt-get dist-upgrade -y
	sudo apt-get dist-upgrade -y
	sudo flatpak update -y
	sudo apt-get autoremove
}

function docker-ip() {
	for container in $(docker ps -aq)
	do
		docker inspect --format '{{.Name}} -> {{.NetworkSettings.IPAddress}}' $container
	done
}
