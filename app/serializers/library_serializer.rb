class LibrarySerializer < ActiveModel::Serializer
  attributes :id, :played, :owned, :game
  has_one :user
  has_one :game
end
