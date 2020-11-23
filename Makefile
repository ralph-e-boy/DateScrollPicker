#!/usr/bin/env make

all: ios sim

clean: 
	rm -rf .build
ios: 
	swift build -Xswiftc "-sdk" -Xswiftc "`xcrun --sdk iphoneos --show-sdk-path`" -Xswiftc "-target" -Xswiftc "arm64-apple-ios13"
sim: 
	swift build -Xswiftc "-sdk" -Xswiftc "`xcrun --sdk iphonesimulator --show-sdk-path`"  -Xswiftc "-target" -Xswiftc "x86_64-apple-ios13.0-simulator"
test: 
	swift test -Xswiftc "-sdk" -Xswiftc "`xcrun --sdk iphoneos --show-sdk-path`" -Xswiftc "-target" -Xswiftc "arm64-apple-ios13"

#	-Xswiftc "-sdk" -Xswiftc "`xcrun --sdk iphonesimulator --show-sdk-path`"  -Xswiftc "-target" -Xswiftc "x86_64-apple-ios13.0-simulator"

