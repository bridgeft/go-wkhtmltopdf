VERSION=1.7.1

ifndef VERBOSE
.SILENT:
endif
.PHONY:

# Tagging and release
tags:
	# first tag the build with the version
	git tag -f -a v${VERSION} -m 'Version ${VERSION}'

	# push tags to remote origin
	git push origin --tags

# runs all the preparation done by goreleaser
prep-release:
	go fmt ./...
	go mod tidy
	go mod download
	go generate ./...
