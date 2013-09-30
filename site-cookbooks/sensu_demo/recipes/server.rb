include_recipe "sensu_demo"
include_recipe "sensu::rabbitmq"
include_recipe "sensu::redis"
# include_recipe "sensu_demo::checks"
include_recipe "sensu::server_service"
include_recipe "sensu_demo::client"
include_recipe "sensu::api_service"
include_recipe "sensu::dashboard_service"
# include_recipe "sensu_demo::handlers"
# include_recipe "sensu_demo::sensu_server_checks"

service "sendmail" do
  action [ :enable, :start ]
end
