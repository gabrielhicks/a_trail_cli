class CreateStories < ActiveRecord::Migration[6.0]
    def change
        create_table :stories do |t|
            t.string :name
            t.integer :character_id
        end
    end
end