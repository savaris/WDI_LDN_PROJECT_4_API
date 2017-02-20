class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :games
end
