require File.join(File.dirname(__FILE__), '../spec_helper')

describe "EcoAppsStore" do

  it "should set url if it's blank" do
    app = EcoAppsStore.create({:name => "test"})
    app.url.should == "/test"
  end
  
end 

