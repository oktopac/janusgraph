SLEEP_INTERVAL=10

while true;
do
  ./bin/janusgraph.sh status | grep 'does not'
  ret=$?
  if [ $ret -eq 0 ]; then
    echo "Cant find the processes, exiting"
    exit 1
  fi
  sleep $SLEEP_INTERVAL
done
