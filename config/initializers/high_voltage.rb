# config/initializers/high_voltage.rb
HighVoltage.configure do |config|
  config.content_path = 'static/'
  config.route_drawer = HighVoltage::RouteDrawers::Root
end