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
  validates :address, presence: true, uniqueness: true

  before_validation :set_name

  private

  def set_name
    self.name = self.address if self.name.blank?
  end
end
