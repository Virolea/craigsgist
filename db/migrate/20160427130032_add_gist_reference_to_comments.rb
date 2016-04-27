class AddGistReferenceToComments < ActiveRecord::Migration
  def change
    add_reference :comments, :gist, index: true, foreign_key: true
  end
end
