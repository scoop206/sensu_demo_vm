#
# Cookbook Name:: sensu_demo
# Recipe:: client
#
# Copyright 2013, Blue Box Group, LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
#

include_recipe "sensu_demo"

# install ntp
include_recipe "ntp"

sensu_client node.name do
    address node.ipaddress
    subscriptions node.roles + ["all"]
end

sensu_gem "sensu-plugin" do
  version node["sensu_demo"]["sensu_plugin_version"]
end

%w[
  check-procs.rb
  check-banner.rb
  check-http.rb
  check-log.rb
  check-mtime.rb
  check-tail.rb
].each do |default_plugin|
  cookbook_file "/etc/sensu/plugins/#{default_plugin}" do
    source "plugins/#{default_plugin}"
    mode 0755
  end
end

# a dir for the check-log plugin to use for caching
directory "/var/cache/check-log" do
  owner "sensu"
end

# run one check
sensu_check "ntp-proc" do
  command "check-procs.rb -p ntpd -W 1"
  handlers ["default"]
  subscribers["all"]
  interval 60
end

include_recipe "sensu::client_service"
