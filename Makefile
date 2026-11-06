check:
	tools/check.sh

zip:
	tools/build-zip.sh

test: zip
	tests/run-e2e.sh "$(CURDIR)/dist/job-search.zip"
