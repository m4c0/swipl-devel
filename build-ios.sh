#!/bin/sh

# Based on script at:
# http://stackoverflow.com/questions/26812060/cross-compile-libgcrypt-static-lib-for-use-on-ios

dobuild() {
    # EXTRAS="-g -DO_DEBUG"

    export CC="$(xcrun -find -sdk ${SDK} cc)"
    export CXX="$(xcrun -find -sdk ${SDK} cpp)"
    export CPP="$(xcrun -find -sdk ${SDK} cpp)"
    export CFLAGS="${EXTRAS} ${HOST_FLAGS}"
    export CXXFLAGS="${EXTRAS} ${HOST_FLAGS}"
    export LDFLAGS="${EXTRAS} ${HOST_FLAGS}"
    export PLARCH="${PLARCH}"

    ./configure --host=${CHOST} --enable-static --disable-shared --disable-gmp --disable-mt --disable-readline --disable-largefile
    
    make clean
    make ../lib/${PLARCH}/libswipl.a
}

cd src

autoconf
autoheader

SDK="iphoneos"
ARCH_FLAGS="-arch armv7"
HOST_FLAGS="${ARCH_FLAGS} -miphoneos-version-min=8.0 -isysroot $(xcrun -sdk ${SDK} --show-sdk-path)"
CHOST="arm-apple-darwin"
PLARCH="arm-apple-darwin"
dobuild

SDK="iphoneos"
ARCH_FLAGS="-arch arm64"
HOST_FLAGS="${ARCH_FLAGS} -miphoneos-version-min=8.0 -isysroot $(xcrun -sdk ${SDK} --show-sdk-path)"
CHOST="arm-apple-darwin"
PLARCH="arm64-apple-darwin"
dobuild

SDK="iphonesimulator"
ARCH_FLAGS="-arch i386"
HOST_FLAGS="${ARCH_FLAGS} -mios-simulator-version-min=8.0 -isysroot $(xcrun -sdk ${SDK} --show-sdk-path)"
CHOST="i386-apple-darwin"
PLARCH="i386-apple-darwin"
dobuild

SDK="iphonesimulator"
ARCH_FLAGS="-arch x86_64"
HOST_FLAGS="${ARCH_FLAGS} -mios-simulator-version-min=8.0 -isysroot $(xcrun -sdk ${SDK} --show-sdk-path)"
CHOST="x86_64-apple-darwin"
PLARCH="x86_64-apple-darwin"
dobuild

cd ../lib
lipo -create -output libswipl.a {arm-apple-darwin,arm64-apple-darwin,x86_64-apple-darwin}/libswipl.a

