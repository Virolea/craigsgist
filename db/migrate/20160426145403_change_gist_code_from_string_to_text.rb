class ChangeGistCodeFromStringToText < ActiveRecord::Migration
  def change
    change_column :gists, :code, :text
  end
end
