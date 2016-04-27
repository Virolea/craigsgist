class Gist < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :user, :title, :language, :description, :code, presence: true

  LANGUAGES = %w(javascript php python ruby)

  search_syntax do
    search_by :text do |scope, phrases|
      columns = [:title, :language, :description, :code]
      scope.where_like(columns => phrases)
    end
  end
end
