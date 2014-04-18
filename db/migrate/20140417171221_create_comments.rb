class CreateComments < ActiveRecord::Migration
  def change
  drop_table :comments
    create_table :comments do |t|
      t.text :body
      t.references :answer, index: true
      t.timestamps
    end
  end
end
