class AddQrCodeScanCountToCampaign < ActiveRecord::Migration[5.1]
  def change
    add_column :campaigns, :qr_code_scan_count, :integer, :default => 0
  end
end
