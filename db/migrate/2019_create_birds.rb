# db/migrate/2019_create_birds.rb

class CreateBirds < ActiveRecord::Migration[5.2]
  def change
    create_table :birds do |t|
      t.string :name
      t.string :species

      t.timestamps
    end
  end
end
