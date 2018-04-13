# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron
# https://github.com/javan/whenever
#update whenever `whenever  --update-crontab`

#log output source code
set :output, "log/cron_log.log"

#per 30 minutes task which recieve 1 or 0 from light cencer whose ardino
every 1.minute do
  rake "ardino_data:reciever"
end
