#
# Cookbook Name:: postfix
# Recipe:: default
#
# Copyright 2010, ProtectedPlanet.net
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

bash "install postfix" do
  code "DEBIAN_FRONTEND=noninteractive apt-get install -y postfix"  
end  

service "postfix" do
  service_name "postfix"
  supports :restart => true, :status => true, :reload => true
end

gem_package "pony" do
  action :install
  version "1.0"
end