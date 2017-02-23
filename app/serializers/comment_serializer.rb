class CommentSerializer < ActiveModel::Serializer
  attributes :id, :body, :comment_poster, :created_at
  has_one :user
  has_one :game

  def comment_poster
    user = UserSerializer.new(object.user).attributes
    p user, 'User'
    return {
      full_name: "#{user[:first_name]} #{user[:last_name]}",
      profile_img: user[:profile_img]
    }
  end
end
