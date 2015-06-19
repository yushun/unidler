class AddFailureCounterToSite < ActiveRecord::Migration
  def change
    add_column :sites, :failure_counter, :integer, null: false, default: 0
  end
end
