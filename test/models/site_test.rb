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

require 'test_helper'

class SiteTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
