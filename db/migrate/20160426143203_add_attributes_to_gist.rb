class AddAttributesToGist < ActiveRecord::Migration
  def change
    add_column :gists, :description, :string
    add_column :gists, :title, :string
    add_column :gists, :code, :string
  end
end
