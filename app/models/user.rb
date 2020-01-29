class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,:validatable

  has_many :books, dependent: :destroy

  has_many :book_comments, dependent: :destroy

  has_many :active_relationships, class_name:  "Relationship",
            foreign_key: "follower_id",
            dependent: :destroy
  has_many :passive_relationships, class_name:  "Relationship",
            foreign_key: "followed_id",
            dependent:   :destroy
  has_many :following_user, through: :active_relationships,  source: :followed
  has_many :followers_user, through: :passive_relationships, source: :follower


  # フォローしていればtrueを返す
  def following?(user)
    following_user.include?(user)
  end

    # ユーザーをフォローする
  def follow(followed,follower)
    Relationship.create(followed_id: followed.id,follower_id: follower.id)
  end

  # ユーザーのフォローを外す
  def unfollow(followed,follower)
    Relationship.find_by(followed_id: followed.id,follower_id: follower.id).destroy
  end


  # いいね機能
  has_many :favorites

  attachment :profile_image, destroy: false

  #バリデーションは該当するモデルに設定する。エラーにする条件を設定できる。
  validates :name, length: {maximum: 20, minimum: 2}
  validates :introduction, length: {maximum: 50}
end
