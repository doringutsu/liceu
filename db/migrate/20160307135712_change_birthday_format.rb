class ChangeBirthdayFormat < ActiveRecord::Migration
  def up
    execute 'ALTER TABLE teachers ALTER COLUMN birthday TYPE date USING (birthday::date)'
  end

  def down
    execute 'ALTER TABLE teachers ALTER COLUMN birthday TYPE text USING (birthday::text)'
  end
end
