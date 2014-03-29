class Pinger
  def initialize
    @sites = Site.all
  end

  def start
    @sites.each do |site|
      http = Net::HTTP.new(site.address, 80)
      response = http.request_get('/')
      p "#{site.address}: #{response.code}"
    end
  end
end
