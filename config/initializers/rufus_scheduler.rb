scheduler = Rufus::Scheduler.new

scheduler.every('20m') do
  pinger = Pinger.new
  pinger.start
  #pinger.second_wave
end

scheduler.every('14d') do
  p "Cleaning sites"
  failures = Site.failures
  addresses = failures.addresses.to_sentence
  failures.destroy_all

  SiteMailer.creation_notice(addresses).deliver
  Site.reset_counters
  p "Cleaning finish"
end
