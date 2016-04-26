class AddUserAndPrivacyToGist < ActiveRecord::Migration
  def change
    add_reference :gists, :user, index: true, foreign_key: true
    add_column :gists, :public, :boolean
  end
end
