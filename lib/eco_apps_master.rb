require 'rails'
require 'action_controller'
require 'eco_apps'

module EcoAppsMaster
  class Engine < Rails::Engine

    initializer "init_store_table" do
      EcoAppsStoreMigration.up unless EcoAppsStore.table_exists?
    end

  end
end