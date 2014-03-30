scheduler = Rufus::Scheduler.new

scheduler.every('30m') do
  pinger = Pinger.new
  pinger.start
end
