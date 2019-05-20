namespace :schedules do
  namespace :reminder do
    desc 'Deliver reminders about schedules'
    task :deliver => :environment do
      puts "Initializing (#{Time.current})... "
      puts

      Schedule.remindable.each do |schedule|
        puts " - #{schedule.scheduled_to}"

        print "   + Delivering to talker (#{schedule.talker.email})... "
        SuccessfullyScheduledToTalkerMailer.new(schedule, reminder: true).deliver
        puts "done!"

        print "   + Delivering to listener (#{schedule.listener.email})... "
        SuccessfullyScheduledToListenerMailer.new(schedule, reminder: true).deliver
        puts "done!"
      end
      puts
      puts "finished (#{Time.current})!"
    end
  end
end
