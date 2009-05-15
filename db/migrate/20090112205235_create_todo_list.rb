class CreateTodoList < ActiveRecord::Migration
  def self.up
    create_table "todolists", :force => true do |t|
      t.timestamps
      t.column :facebook_id, :string, :limit => 20
      t.column :description, :string, :limit => 255
      t.column :position, :int
      t.column :listname, :string, :limit => 10
    end
  end

  def self.down
    drop_table "todolists"
  end
end
