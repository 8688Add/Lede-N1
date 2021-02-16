#!/bin/bash
# 修改默认IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate
# 修改默认主题
#sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile
#修改主机名
#sed -i 's/OpenWrt/Bin-Lean/g' package/base-files/files/bin/config_generate
#关闭自建私有源签名验证
#sed -i '92d' package/system/opkg/Makefile
# 设置密码为空（安装固件时无需密码登陆，然后自己修改想要的密码）
sed -i 's@.*CYXluq4wUazHjmCDBCqXF*@#&@g' package/lean/default-settings/files/zzz-default-settings

#添加额外软件包
rm -rf package/lean/luci-app-dockerman
git clone https://github.com/lisaac/luci-app-dockerman.git package/openwrt-packages/luci-app-dockerman
#svn co https://github.com/xiaorouji/openwrt-package/trunk/package/brook package/openwrt-packages/brook
#svn co https://github.com/xiaorouji/openwrt-package/trunk/package/chinadns-ng package/openwrt-packages/chinadns-ng
#svn co https://github.com/xiaorouji/openwrt-package/trunk/package/trojan-go package/openwrt-packages/trojan-go
#svn co https://github.com/xiaorouji/openwrt-package/trunk/package/trojan-plus package/openwrt-packages/trojan-plus
#svn co https://github.com/xiaorouji/openwrt-package/trunk/package/ssocks package/openwrt-packages/ssocks
#svn co https://github.com/xiaorouji/openwrt-package/trunk/lienol/luci-app-passwall package/openwrt-packages/luci-app-passwall
#rm -rf package/lean/xray
#svn co https://github.com/xiaorouji/openwrt-passwall/trunk/xray package/lean/xray
#svn co https://github.com/garypang13/openwrt-packages/trunk/smartdns package/smartdns
#git clone https://github.com/garypang13/luci-app-bypass.git package/luci-app-bypass
git clone https://github.com/Lienol/openwrt-package.git package/openwrt-package
git clone https://github.com/xiaorouji/openwrt-passwall.git package/openwrt-passwall
rm -rf package/lean/luci-theme-argon
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git package/lean/luci-theme-argon
git clone https://github.com/jerrykuku/luci-app-argon-config.git package/luci-app-argon-config
#svn co https://github.com/siropboy/mypackages/trunk/luci-app-autopoweroff package/openwrt-packages/luci-app-autopoweroff
#svn co https://github.com/siropboy/mypackages/trunk/luci-app-control-timewol package/openwrt-packages/luci-app-control-timewol
#rm -rf package/lean/v2ray
#svn co https://github.com/8688Add/Lienol-openwrt-package/trunk/package/v2ray package/lean/v2ray
git clone https://github.com/jerrykuku/luci-app-vssr.git package/luci-app-vssr
git clone https://github.com/jerrykuku/lua-maxminddb.git package/lua-maxminddb
git clone https://github.com/jerrykuku/luci-app-jd-dailybonus.git package/openwrt-packages/luci-app-jd-dailybonus
#git clone https://github.com/8688Add/luci-app-vssr-plus.git package/luci-app-vssr-plus
#git clone https://github.com/bin20088/luci-theme-argon-mc.git package/openwrt-packages/luci-theme-argon-mc
#git clone https://github.com/Leo-Jo-My/luci-theme-opentomcat.git package/openwrt-packages/luci-theme-opentomcat
#git clone https://github.com/bin20088/luci-theme-butongwifi.git package/openwrt-packages/luci-theme-butongwifi
#git clone https://github.com/openwrt-develop/luci-theme-atmaterial.git package/openwrt-packages/luci-theme-atmaterial
#git clone https://github.com/bin20088/luci-app-koolproxy.git package/openwrt-packages/luci-app-koolproxy
#git clone https://github.com/bin20088/luci-app-koolddns.git package/openwrt-packages/luci-app-koolddns
git clone https://github.com/tuanqing/install-program package/install-program
git clone https://github.com/vernesong/OpenClash.git package/luci-app-openclash
svn co https://github.com/xiaoqingfengATGH/luci-theme-infinityfreedom/trunk/luci-theme-infinityfreedom package/openwrt-packages/luci-theme-infinityfreedom
#svn co https://github.com/project-openwrt/openwrt/trunk/package/ctcgfw/luci-app-gost package/lean/luci-app-gost
#svn co https://github.com/project-openwrt/openwrt/trunk/package/ctcgfw/gost package/lean/gost
#svn co https://github.com/8688Add/sirpdboy-package/trunk/luci-app-ddnsto package/luci-app-ddnsto

sed -i 's/"Turbo ACC 网络加速"/"网络加速"/g' package/lean/luci-app-flowoffload/po/zh-cn/flowoffload.po
sed -i 's/"Turbo ACC 网络加速"/"网络加速"/g' package/lean/luci-app-sfe/po/zh-cn/sfe.po
#sed -i 's/"解锁网易云灰色歌曲"/"网易云音乐"/g' package/lean/luci-app-unblockmusic/po/zh-cn/unblockmusic.po

#赋予koolddns权限
#chmod 0755 package/openwrt-packages/luci-app-koolddns/root/etc/init.d/koolddns
#chmod 0755 package/openwrt-packages/luci-app-koolddns/root/usr/share/koolddns/aliddns

#修改bypass的makefile
#find package/*/ feeds/*/ -maxdepth 2 -path "*luci-app-bypass/Makefile" | xargs -i sed -i 's/shadowsocksr-libev-ssr-redir/shadowsocksr-libev-alt/g' {}
#find package/*/ feeds/*/ -maxdepth 2 -path "*luci-app-bypass/Makefile" | xargs -i sed -i 's/shadowsocksr-libev-ssr-server/shadowsocksr-libev-server/g' {}

./scripts/feeds update -a
./scripts/feeds install -a
