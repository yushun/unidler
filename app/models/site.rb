# == Schema Information
#
# Table name: sites
#
#  id         :integer          not null, primary key
#  address    :string(255)
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Site < ActiveRecord::Base
  validates :name, presence: true
  validates :address, presence: true, uniqueness: { case_sensitive: false, message: 'The url has already been added. No need to add it twice.'}
  validate :address_is_an_url
  
  before_validation :set_name

  private

  def set_name
    self.name = self.address if self.name.blank?
  end

  def address_is_an_url
    begin
      http = Net::HTTP.new(self.address, 80)
      http.request_get('/')
    rescue SocketError => e
      errors.add(:address, 'The url entered is not valid. Please check the url again.')
    end
  end
end
