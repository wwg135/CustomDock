THEOS_PACKAGE_SCHEME=rootless
TARGET := iphone:clang:latest:14.0
ARCHS = arm64 arm64e
FINALPACKAGE = 1
DEBUG = 0

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = CustomDock
CustomDock_FILES = Tweak.xm
CustomDock_FRAMEWORKS = UIKit Foundation

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
