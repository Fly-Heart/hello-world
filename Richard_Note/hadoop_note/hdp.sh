#!/bin/bash
if [ $# -lt 1 ]
then
    echo "No Args Input..."
    exit ;
fi
case $1 in
"start")
    echo " =================== 启动 hadoop集群 ==================="
    echo " --------------- 启动 hdfs ---------------"
    ssh hadoop101 "/opt/module/hadoop-2.8.0/sbin/start-dfs.sh"
    echo " --------------- 启动 yarn ---------------"
    ssh hadoop102 "/opt/module/hadoop-2.8.0/sbin/start-yarn.sh"
	echo " --------------- 启动 yarn ---------------"
    ssh hadoop103 "/opt/module/hadoop-2.8.0/sbin/start-yarn.sh"
    echo " --------------- 启动 historyserver ---------------"
    ssh hadoop103 "/opt/module/hadoop-2.8.0/sbin/mr-jobhistory-daemon.sh start historyserver"
  ;;

"stop")
    echo " =================== 关闭 hadoop集群 ==================="
    echo " --------------- 关闭 historyserver ---------------"
    ssh hadoop103 "/opt/module/hadoop-2.8.0/sbin/mr-jobhistory-daemon.sh stop historyserver"
    echo " --------------- 关闭 yarn ---------------"
    ssh hadoop102 "/opt/module/hadoop-2.8.0/sbin/stop-yarn.sh"
	echo " --------------- 关闭 yarn ---------------"
    ssh hadoop103 "/opt/module/hadoop-2.8.0/sbin/stop-yarn.sh"
    echo " --------------- 关闭 hdfs ---------------"
    ssh hadoop101 "/opt/module/hadoop-2.8.0/sbin/stop-dfs.sh"
  ;;

*)
    echo "Input Args Error..."
  ;;
esac

