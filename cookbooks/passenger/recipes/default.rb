#
# Cookbook Name:: nginx
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
# Recipe changed to install passenger for apache, instead of nginx.
#
package "libperl5.10"
package "libxslt1.1"
package "libgeoip1"
package "libgd2-noxpm"
package "libgeoip-dev"
package "libxslt1-dev"
package "libpcre3-dev"
package "libgd2-noxpm-dev"
package "libssl-dev"
package "libcurl4-openssl-dev"

gem_package "passenger"

execute "compile with passenger" do
  command "/usr/local/ruby/bin/passenger-install-apache2-module --auto"
end

