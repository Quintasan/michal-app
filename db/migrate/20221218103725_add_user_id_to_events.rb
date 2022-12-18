class AddUserIdToEvents < ActiveRecord::Migration[7.0]
  def change
    change_table :events do |t|
      t.belongs_to :user
    end
  end
end
