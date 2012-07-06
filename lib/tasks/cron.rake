desc "This task is called by the Heroku cron add-on"
task :cron => :environment do
	print "The time is #{Time.now}"
end