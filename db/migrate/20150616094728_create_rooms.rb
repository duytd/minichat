class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :name
      t.boolean :is_private
      t.references :user, index: true
      t.timestamps
    end

    create_table :rooms_users, id: false do |t|
      t.belongs_to :room, index: true
      t.belongs_to :user, index: true
    end

  end
end
