THEOS_PACKAGE_SCHEME=rootless
TARGET := iphone:clang:latest:14.0
ARCHS = arm64 arm64e
DEBUG = 0
FINALPACKAGE = 1

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = CustomDock
CustomDock_FILES = Tweak.xm
CustomDock_FRAMEWORKS = UIKit Foundation
CustomDock_LDFLAGS += -Wl,-segalign,4000
CustomDock_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard; killall -9 Preferences"
SUBPROJECTS += CustomDock
include $(THEOS_MAKE_PATH)/aggregate.mk
