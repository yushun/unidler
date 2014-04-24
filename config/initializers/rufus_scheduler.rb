scheduler = Rufus::Scheduler.new

scheduler.every('15m') do
  pinger = Pinger.new
  pinger.start
  pinger.second_wave
end
