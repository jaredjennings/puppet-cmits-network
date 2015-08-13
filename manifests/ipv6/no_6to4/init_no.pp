# % CMITS - Configuration Management for Information Technology Systems
# % Based on <https://github.com/afseo/cmits>.
# % Copyright 2015 Jared Jennings <mailto:jjennings@fastmail.fm>.
# %
# % Licensed under the Apache License, Version 2.0 (the "License");
# % you may not use this file except in compliance with the License.
# % You may obtain a copy of the License at
# %
# %    http://www.apache.org/licenses/LICENSE-2.0
# %
# % Unless required by applicable law or agreed to in writing, software
# % distributed under the License is distributed on an "AS IS" BASIS,
# % WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# % See the License for the specific language governing permissions and
# % limitations under the License.

define network::ipv6::no_6to4::init_no() {
    augeas { "${name}_turn_off_6to4":
	changes => "set IPV6TO4INIT no",
	context => 
    "/files/etc/sysconfig/network-scripts/ifcfg-${name}",
	onlyif => "match \
    /files/etc/sysconfig/network-scripts/ifcfg-${name} \
	    size == 1",
    }
}
