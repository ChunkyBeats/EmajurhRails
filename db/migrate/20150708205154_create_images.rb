class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.column :title, :string
      t.column :description, :string
      t.timestamps
    end
  end
end
