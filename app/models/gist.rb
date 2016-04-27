class Gist < ActiveRecord::Base
  belongs_to :user
  has_many :comments

  validates :user, :title, :description, :code, presence: true

  LANGUAGES = %w(javascript php python ruby)
end
