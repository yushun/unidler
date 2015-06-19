# == Schema Information
#
# Table name: sites
#
#  id              :integer          not null, primary key
#  address         :string(255)
#  name            :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#  failure_counter :integer          default("0"), not null
#

class Site < ActiveRecord::Base
  validates :name, presence: true
  validates :address, presence: true, uniqueness: { case_sensitive: false, message: ' has already been added. No need to add it twice.'}
  validate :address_is_an_url
  
  before_validation :set_name

  def increase_failure_counter
    self.failure_counter += 1
  end

  private

  def set_name
    self.name = self.address if self.name.blank?
  end

  def address_is_an_url
    begin
      http = Net::HTTP.new(self.address, 80)
      http.request_get('/')
    rescue SocketError => e
      errors.add(:address, ' entered is not valid. Please check the url again.')
    end
  end
end
