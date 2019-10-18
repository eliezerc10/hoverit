class ChangeColumnNumberToNumberPhone < ActiveRecord::Migration[5.2]
  def change
  	rename_column :messages, :number, :number_phone
  end
end
