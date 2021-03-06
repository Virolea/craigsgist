class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :gists, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :username, uniqueness: true

  def to_param
    username
  end
end
