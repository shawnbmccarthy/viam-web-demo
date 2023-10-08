ifndef $(VERSION)
VERSION=development
endif

set_version:
	echo "VERSION = '$(VERSION)'" > $(INSTALL_DIR)/app_cfg.py

install_app:
	mkdir -p $(INSTALL_DIR)
	cp -r * $(INSTALL_DIR)
	$(INSTALL_DIR)/install.sh
	$(INSTALL_DIR)/web.sh start

install_web: install_app set_version
