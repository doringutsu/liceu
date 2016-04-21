class RemoveYearFromTheses < ActiveRecord::Migration
  def change
    remove_column :theses, :year
  end
end
