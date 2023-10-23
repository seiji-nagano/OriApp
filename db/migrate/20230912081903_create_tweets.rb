class CreateTweets < ActiveRecord::Migration[7.0]
  def change
    create_table :tweets do |t|
      t.string :title
      t.string :text
      t.text :video
      t.integer :category_id
      t.timestamps
    end
  end
end
