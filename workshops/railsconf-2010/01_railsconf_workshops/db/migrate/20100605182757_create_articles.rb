class CreateArticles < ActiveRecord::Migration
  def self.up
    create_table :articles do |t|
      t.string :title
      t.text :body
      t.belongs_to :state
      t.belongs_to :category

      t.timestamps
    end
    add_index :articles, :state_id
    add_index :articles, :category_id
  end

  def self.down
    drop_table :articles
  end
end
