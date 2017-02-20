class GameSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :critic_rating, :time_to_beat, :pegi_rating, :cover_img, :video_url, :category, :screenshots
  has_one :user
end
