require 'bcrypt'

class User < ApplicationRecord
    has_secure_password
    validates :user_name, uniqueness: { case_sensitive: true }
    validates :user_name, presence: true
    validates :name, presence: true
    validates :location, presence: true
    validates :bio, presence: true

    has_many :posts, dependent: :destroy
    has_many :likes, dependent: :destroy

    def liked?(post)
        self.likes.find_by(post_id: post.id)
    end
end
