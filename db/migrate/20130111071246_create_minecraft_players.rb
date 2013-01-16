class CreateMinecraftPlayers < ActiveRecord::Migration
  def change
    create_table :minecraft_players do |t|
      t.string :username
      t.string :email
      t.string :verification_code
      t.boolean :active, :default => false

      t.timestamps
    end
  end
end
