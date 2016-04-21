class LinkThesesToSessions < ActiveRecord::Migration
  def change
    add_reference :theses, :session, index: true, foreign_key: true
  end
end
