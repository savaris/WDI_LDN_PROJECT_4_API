class GameSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :critic_rating, :time_to_beat, :pegi_rating, :cover_img, :video_url, :screenshots, :genres, :platforms, :release_date
end
