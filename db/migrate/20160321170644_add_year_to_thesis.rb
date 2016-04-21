class AddYearToThesis < ActiveRecord::Migration
  def change
    add_column :theses, :year, :integer
  end
end
