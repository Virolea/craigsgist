class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :gist

  validates :content, :user, presence: true
end
