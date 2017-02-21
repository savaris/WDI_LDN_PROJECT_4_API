class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :library
  def library
    Library.all.where({user_id: object.id})
  end
end
