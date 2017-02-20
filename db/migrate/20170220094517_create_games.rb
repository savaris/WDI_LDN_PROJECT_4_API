class CreateGames < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|
      t.string :title
      t.text :description
      t.float :critic_rating
      t.integer :time_to_beat
      t.integer :pegi_rating
      t.string :cover_img
      t.string :video_url
      t.string :category
      t.string :status_flag
      t.string :screenshots, array:true, default: []
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
