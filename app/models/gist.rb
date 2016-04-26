class Gist < ActiveRecord::Base
  belongs_to :user

  validates :user, :title, :description, :code, presence: true
end
