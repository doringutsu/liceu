class AddFieldsToThesis < ActiveRecord::Migration
  def change
    add_column :theses, :semester, :integer
    add_column :theses, :profile, :string
  end
end
