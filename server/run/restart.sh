#/bin/sh
#start or stop the im-server


curpath=$(pwd)

LD_LIBRARY_PATH=$curpath/lib
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH"

function restart() {
    cd $1
    if [ ! -e *.conf  ]
    then
        echo "no config file"
        return
    fi

    if [ -e server.pid  ]; then
        pid=`cat server.pid`
        echo "kill pid=$pid"
        kill $pid
        while true
        do
            oldpid=`ps -ef|grep $1|grep $pid`;
            if [ $oldpid" " == $pid" " ]; then
                echo $oldpid" "$pid
                sleep 1
            else
                break
            fi
        done
        ../daeml ./$1
    else 
        ../daeml ./$1
    fi
    cd ..
}

case $1 in
    login_server)
        restart $1
        ;;
    msg_server)
        restart $1
        ;;
    route_server)
        restart $1
        ;;
    http_msg_server)
        restart $1
        ;;
    file_server)
        restart $1
        ;;
    push_server)
        restart $1
        ;;
    db_proxy_server)
        restart $1
        ;;
    msfs)
        restart $1
        ;;
	all)
        restart db_proxy_server
        restart login_server
        restart route_server
        restart msg_server
        restart http_msg_server
        restart file_server
        restart msfs
        restart push_server
	ps -ef | grep _server
	ps -ef | grep msfs
        ;;
    *)
        echo "Usage: "
        echo "  ./restart.sh (login_server|msg_server|route_server|http_msg_server|file_server|push_server)"
        ;;
esac
