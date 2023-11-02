class User < ApplicationRecord
     has_secure_password
     has_many :posts
     has_many :followed_users, foreign_key: :follower_id, class_name: 'Follow'
     has_many :followeds, through: :followed_users

     has_many :follower_users, foreign_key: :followed_id, class_name: 'Follow'
     has_many :followers, through: :follower_users
end
