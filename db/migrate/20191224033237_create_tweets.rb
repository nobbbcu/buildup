class CreateTweets < ActiveRecord::Migration[5.2]
  def change
    create_table :tweets do |t|
      t.string :content, index: true
      t.string :image
      t.string :hour
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
