class AddDescriptiveFieldsToPricing < ActiveRecord::Migration
  def change
		add_column :pricings, :hourly_rate, :float
		add_column :pricings, :tagline, :string
  end
end
