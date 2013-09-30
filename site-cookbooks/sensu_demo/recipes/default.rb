#
# Cookbook Name:: sensu_demo
# Recipe:: default
#
# Copyright (C) 2013 Blue Box Group, LLC
# 
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#    http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

node.set.sensu.version            = node.sensu_demo.sensu_version
node.set.sensu.rabbitmq.host      = node.sensu_demo.rabbitmq.host
node.set.sensu.rabbitmq.password  = node.sensu_demo.rabbitmq.password
node.set.sensu.api.host           = node.sensu_demo.api.host
node.set.sensu.redis.host         = node.sensu_demo.redis.host
node.set.sensu.dashboard.bind     = node.sensu_demo.dashboard.bind
node.set.sensu.dashboard.password = node.sensu_demo.dashboard.password

# have our ruby checks use sensu's ruby
node.set.sensu.use_embedded_ruby = true

include_recipe "sensu"
