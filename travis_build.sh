#!/bin/bash
echo "${TRAVIS_OS_NAME}"
echo "${TRAVIS_GO_VERSION}"
if [ "${TRAVIS_OS_NAME}" = "linux" ]; then
    export GOOS=windows
    export GOARCH=amd64
    go build -o windows/ethr-kai.exe -ldflags "-X main.gVersion=$TRAVIS_TAG"
    export GOOS=linux
    go build -o linux/ethr-kai -ldflags "-X main.gVersion=$TRAVIS_TAG"
    export GOOS=darwin
    go build -o osx/ethr-kai -ldflags "-X main.gVersion=$TRAVIS_TAG"
    zip -j ethr_kai_windows.zip windows/ethr-kai.exe
    zip -j ethr_kai_linux.zip linux/ethr-kai
    zip -j ethr_kai_osx.zip osx/ethr-kai
fi

