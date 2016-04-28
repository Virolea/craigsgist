class Label < ActiveRecord::Base
  belongs_to :gist

  validates :name, :gist, presence: true
end
