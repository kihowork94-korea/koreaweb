.PHONY: help dev dev-clean build preview test test-run test-cov storybook storybook-build

# nvm 로드
SHELL := /bin/bash
NVM_USE := source "$$HOME/.nvm/nvm.sh" && nvm use

# Include private makefile if exists
-include Makefile.private

help:
	@echo "Runners Web - Makefile"
	@echo ""
	@echo "Development:"
	@echo "  make dev             - 개발 서버 시작 (port 3500)"
	@echo "  make dev-clean       - .nuxt 캐시 삭제 후 개발 서버 시작"
	@echo "  make build           - 프로덕션 빌드"
	@echo "  make preview         - 빌드 미리보기"
	@echo ""
	@echo "Test:"
	@echo "  make test            - 테스트 실행 (watch mode)"
	@echo "  make test-run        - 테스트 실행 (단일)"
	@echo "  make test-cov        - 테스트 실행 (coverage)"
	@echo ""
	@echo "Storybook:"
	@echo "  make storybook       - Storybook 시작 (port 6500)"
	@echo "  make storybook-build - Storybook 빌드"
	@echo ""

dev:
	$(NVM_USE) && yarn dev

dev-clean:
	$(NVM_USE) && yarn dev:clean

build:
	$(NVM_USE) && yarn build

preview:
	$(NVM_USE) && yarn preview

test:
	$(NVM_USE) && yarn test

test-run:
	$(NVM_USE) && yarn test:run

test-cov:
	$(NVM_USE) && yarn test:coverage

storybook:
	$(NVM_USE) && yarn storybook

storybook-build:
	$(NVM_USE) && yarn build-storybook
