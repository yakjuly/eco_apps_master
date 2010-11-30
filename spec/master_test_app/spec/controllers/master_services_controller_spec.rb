require File.join(File.dirname(__FILE__), '../spec_helper')

describe MasterServicesController do

  it "should reset config" do
    post :create, :master_service=>{:app => YAML.dump({:name => "test", :url => "http://www.test.com"})}
    EcoAppsStore.find_by_name("test").url.should == "http://www.test.com"
  end

  it "should find app by name" do
    app = EcoAppsStore.create({"name" => "test", "url" => "http://www.test.com"})
    get :show, :id => 'test'
    response.body.should == app.to_xml

    get :show, :id => "no_exist"
    response.body.should == {:error=>"not_found"}.to_xml
  end

end
