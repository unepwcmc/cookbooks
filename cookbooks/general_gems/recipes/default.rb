#
# Cookbook Name:: general_gems
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


package "libonig2"
package "libonig-dev"
package "libxml2"
package "libxml2-dev"
package "libxslt1.1"
package "libxslt1-dev"
package "libcurl4-gnutls-dev"
package "unzip"


gem_package "nokogiri" do
  action :install
  version "1.4.1"
end

gem_package "tzinfo"
gem_package "builder"
gem_package "memcache-client"
gem_package "rack"
gem_package "rack-test"
gem_package "erubis"
gem_package "mail"
gem_package "thor"
gem_package "i18n"
gem_package "rack-mount"
