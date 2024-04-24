# Variables
REPO_URL := https://github.com/ngoduykhanh/wireguard-ui
LOCAL_DIR := ngoduykhanh-wireguard-ui
LAST_COMMIT_FILE := .ngoduykhanh-wireguard-ui-last-commit

# Targets
all: display_diff

download_repo:
	@echo "Downloading repository from $(REPO_URL)..."
	@git clone --quiet $(REPO_URL) $(LOCAL_DIR)

display_diff:
	@if [ -f $(LAST_COMMIT_FILE) ]; then \
		echo "Checking differences since last run..."; \
		git --git-dir=$(LOCAL_DIR)/.git --work-tree=$(LOCAL_DIR) diff --stat `cat $(LAST_COMMIT_FILE)` HEAD; \
	else \
		echo "This is the first run, no differences to display."; \
	fi
	@echo "Recording current commit..."
	@echo `git --git-dir=$(LOCAL_DIR)/.git --work-tree=$(LOCAL_DIR) rev-parse HEAD` > $(LAST_COMMIT_FILE)

clean:
	@echo "Cleaning up..."
	@rm -rf $(LOCAL_DIR)
	@rm -f $(LAST_COMMIT_FILE)

.PHONY: all download_repo display_diff clean