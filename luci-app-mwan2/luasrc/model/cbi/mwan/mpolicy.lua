require("luci.tools.webadmin")
local e=require"luci.sys"
local e=require"luci.model.uci".cursor()
require("luci.sys")
local t,e,a
t=Map("mwan3",translate("策略路由"),translate("如果你有多个运营商线路，可以在此设置策略路由，策略路由会导致某些应用负载均衡失效，请先设置好wan口、跃点分配防火墙区域为wan并连线成功后再进行设置。第一次设置好后可能需要重启才能生效。"))
t:section(SimpleSection).template="mwan/web_script"
e=t:section(TypedSection,"mpolicy","开启设置")
e.anonymous=true
enable=e:option(Flag,"enable",translate("开启"),translate("开启或关闭策略路由"))
enable.rmempty=false
reset=e:option(Flag,"reset",translate("初始化"),translate("出现不能正确策略路由时选择,选择初始化后需要再次重新设置一次。"))
reset.rmempty=false
e=t:section(TypedSection,"mpolicy","线路设置【不是你的运营商保持默认设置为无】")
e.anonymous=true
e.addremove=false
telecom=e:option(Value,"telecom",translate("连接中国电信的wan口名称"))
luci.tools.webadmin.cbi_add_networks(telecom)
telecom:value("none",translate("none"))
telecom.optional=false
telecom.rmempty=true
telecom.default="none"
unicom=e:option(Value,"unicom",translate("连接中国联通的wan口名称"))
luci.tools.webadmin.cbi_add_networks(unicom)
unicom:value("none",translate("none"))
unicom.optional=false
unicom.rmempty=true
unicom.default="none"
mobile=e:option(Value,"mobile",translate("连接中国移动的wan口名称"))
luci.tools.webadmin.cbi_add_networks(mobile)
mobile:value("none",translate("none"))
mobile.optional=false
mobile.rmempty=true
mobile.default="none"
cernet=e:option(Value,"cernet",translate("连接教育网的wan口名称"))
luci.tools.webadmin.cbi_add_networks(cernet)
cernet:value("none",translate("none"))
cernet.optional=false
cernet.rmempty=true
cernet.default="none"
e=t:section(TypedSection,"mpolicy","特殊设置【会影响下载速度叠加，如无特殊需要不要设置】")
e.anonymous=true
e.addremove=false
cnn=e:option(Value,"cnn",translate("访问国内网站使用的线路"))
luci.tools.webadmin.cbi_add_networks(cnn)
cnn:value("none",translate("none"))
cnn.optional=false
cnn.rmempty=true
cnn.default="none"
foreign=e:option(Value,"foreign",translate("访问国外网站使用的线路"))
luci.tools.webadmin.cbi_add_networks(foreign)
foreign:value("none",translate("none"))
foreign.optional=false
foreign.rmempty=true
foreign.default="none"
return t
