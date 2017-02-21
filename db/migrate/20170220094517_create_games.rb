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
      t.string :release_date
      t.integer :genres, array:true, default: []
      t.integer :platforms, array:true, default: []
      t.string :screenshots, array:true, default: []

      t.timestamps
    end
  end
end
