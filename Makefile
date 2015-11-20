OPENWRT_DIR = ./openwrt
DOWNLOAD_DIR = ./downloads

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
	ln -s $(DOWNLOAD_DIR) $(OPENWRT_DIR)/dl
	cd $(OPENWRT_DIR); make V=s
