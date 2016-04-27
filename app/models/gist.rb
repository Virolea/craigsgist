class Gist < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :user, :title, :language, :description, :code, presence: true

  LANGUAGES = %w(javascript php python ruby)
end
