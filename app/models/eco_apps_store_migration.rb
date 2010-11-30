class EcoAppsStoreMigration < ActiveRecord::Migration
  def self.up
    create_table :eco_apps_stores do |f|
      f.string :name, :url
      f.text :api, :database
      f.timestamps
    end

    add_index :eco_apps_stores, :name
  end

  def self.down
    drop_table :cheese_widgets
  end
end