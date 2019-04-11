class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :posts, :followed_users, :follower_users, :entries, :followings, :avatar, :bio

end
