class CreateTwitts < ActiveRecord::Migration[5.1]
  def change
    create_table :twitts do |t|
      t.string :content

      t.timestamps
    end
  end
end
