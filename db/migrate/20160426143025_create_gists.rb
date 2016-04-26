class CreateGists < ActiveRecord::Migration
  def change
    create_table :gists do |t|

      t.timestamps null: false
    end
  end
end
