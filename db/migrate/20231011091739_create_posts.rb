class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.string :ref1
      t.string :ref2
      t.string :media
      t.datetime :discarded_at
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
