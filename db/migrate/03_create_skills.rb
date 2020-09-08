class CreateSkills < ActiveRecord::Migration[6.0]
    def change
        create_table :skills do |t|
            t.integer :coding, :default => 1
            t.integer :electricity, :default => 1
            t.integer :hunger, :default => 1
            t.integer :education, :default => 1
            t.integer :happiness, :default => 1
        end
    end
end