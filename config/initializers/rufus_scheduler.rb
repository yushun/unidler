scheduler = Rufus::Scheduler.new

scheduler.every('20m') do
  pinger = Pinger.new
  pinger.start
  #pinger.second_wave
end

scheduler.every('14d') do
  p "Cleaning sites"
  Site.failures.destroy_all
  Site.reset_counters
  p "Cleaning finish"
end
