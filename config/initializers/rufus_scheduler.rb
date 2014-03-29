scheduler = Rufus::Scheduler.new

scheduler.every('20') do
  pinger = Pinger.new
  pinger.start
end
