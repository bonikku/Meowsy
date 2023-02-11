class AddMeowIdToMeows < ActiveRecord::Migration[7.0]
  def change
    add_column :meows, :meow_id, :integer
  end
end
