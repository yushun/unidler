class Pinger
  def initialize
    @sites = Site.all
  end

  def start
    @sites.find_each do |site|
      begin
        http = Net::HTTP.new(site.address, 80)
        response = http.request_get('/')
        p "#{site.address}: #{response.code}"
        site.increase_failure_counter
        site.save
      rescue => e
        p "Error #{site.address}: #{e}"
      end  
    end
  end

  def second_wave
    @sites.each do |site|
      begin
        Timeout.timeout(5) do
          s = TCPSocket.open(site.address, 80)
          code = s.read
          s.close
          p "#{site.address}: #{code}"
        end
      rescue => e
        p "Error #{site.address}: second wave #{e}"
      end
    end
  end
end
