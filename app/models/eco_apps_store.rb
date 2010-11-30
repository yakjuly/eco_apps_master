class EcoAppsStore < ActiveRecord::Base

  before_save :set_url

  def set_url
    self.url = "/#{self.name}" if self.url.blank?
  end

  def self.reset_config(options)
    returning self.find_or_create_by_name(options["name"]) do |app|
      app.update_attributes(options)
    end
  end

  def to_xml(options = {})
    super(options.merge!(:only => [:name, :api, :url, :database]))
  end
end
