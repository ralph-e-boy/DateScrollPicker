#!/usr/bin/env make

all: lib xcode

lib:  
	swift build
clean: 
	rm -rf .build
test:
	swift test
test-generate: 
	swift test --generate-linuxmain
doc: 
	jazzy
ios: 
	swift build -Xswiftc "-sdk" -Xswiftc "`xcrun --sdk iphoneos --show-sdk-path`" -Xswiftc "-target" -Xswiftc "arm64-apple-ios13"
sim: 
	swift build -Xswiftc "-sdk" -Xswiftc "`xcrun --sdk iphonesimulator --show-sdk-path`  -Xswiftc "-target" -Xswiftc "x86_64-apple-ios13.0-simulator"
xcode: 
	swift package generate-xcodeproj --enable-code-coverage
xcodetest: xcode
	xcrun xcodebuild  -workspace TestHarness/TestHarness.xcworkspace -scheme TestHarness  -destination "platform=iOS Simulator,name=iPhone 12" test
