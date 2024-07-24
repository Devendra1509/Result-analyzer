class ChangeColumnName < ActiveRecord::Migration[7.1]
  def change
      rename_column :monthly_averages, :monthly_result_count_used, :monthly_result_count
  end
end
