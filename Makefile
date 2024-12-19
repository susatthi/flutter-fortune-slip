FVM := $(shell which fvm)
FLUTTER := $(FVM) flutter
DART := $(FVM) dart

.PHONY: pub-get
pub-get:
	$(FLUTTER) pub get

.PHONY: pub-upgrade
pub-upgrade:
	$(FLUTTER) pub upgrade

.PHONY: clean
clean:
	$(FLUTTER) clean
	rm -rf ios/Pods ios/Podfile.lock

.PHONY: pod-install
pod-install:
	cd ios && pod install && cd ..

.PHONY: clean-build
clean-build:
	make clean
	make pub-get
	make pod-install
	make build-slang

.PHONY: analyze
analyze:
	$(FLUTTER) analyze
	$(FVM) dart run custom_lint

.PHONY: format
format:
	$(FLUTTER) format lib/

.PHONY: format-dry-exit-if-changed
format-dry-exit-if-changed:
	$(FLUTTER) format --dry-run --set-exit-if-changed lib/

.PHONY: build-runner-build
build-runner-build:
	$(DART) run build_runner build --delete-conflicting-outputs

.PHONY: build-runner-watch
build-runner-watch:
	$(DART) run build_runner clean
	$(DART) run build_runner watch --delete-conflicting-outputs
