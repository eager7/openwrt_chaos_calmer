REVISION_OPENWRT = 20141127-30965ec3
REVISION_OPENWRT_FEEDS = 20141127-30965ec3
REVISION_LUCI = mtk-20141127-30965ec3

DOWNLOAD_DIR = ./downloads/

.PHONY: 

define install_package
	cd $(OPENWRT_DIR) && ./scripts/feeds install $(1)
endef

default:bulid

install_depends:
	sudo apt-get install gcc g++ git binutils patch bzip2 flex bison make autoconf gettext texinfo unzip sharutils subversion libncurses5-dev ncurses-term zlib1g-dev gawk
	
all:  bulid

distclean:
	cd $(OPENWRT_DIR) ; make distclean
	
clean:
	cd $(OPENWRT_DIR); make clean

menuconfig:
	cd $(OPENWRT_DIR); make menuconfig
	
bulid:
	cd $(OPENWRT_DIR); make V=s
