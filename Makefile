export THEOS=/opt/theos
GO_EASY_ON_ME=1

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = FiveIconDockXI
FiveIconDockXI_FILES = Tweak.xm

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
