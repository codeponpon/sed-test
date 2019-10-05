web: bundle exec puma  -t 0:5 -p $PORT -e ${RACK_ENV:-development}

worker: bundle exec rake resque:workers COUNT=5 QUEUE="*"