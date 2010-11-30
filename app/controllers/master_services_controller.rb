class MasterServicesController < ActionController::Base
  caches_action :show
  ip_limited_access

  unloadable

  def create
    app = EcoAppsStore.reset_config(YAML.load(params[:master_service][:app]))
    expire_action(url_for(:controller => '/master_services', :action => 'show', :id=>app.name, :format=>"xml"))
    render :xml => app.to_xml, :status => :ok
  end

  def show
    app = EcoAppsStore.find_by_name(params[:id])
    render app.blank? ? {:xml => {:error=>"not_found"}.to_xml, :status => :not_found} : {:xml => app.to_xml, :status => :ok}
  end

end


