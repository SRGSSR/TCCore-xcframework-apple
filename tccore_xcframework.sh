#!/bin/bash

execution_dir=`pwd`

xcframework_name="TCCore.xcframework"
xcframework_zip_name="$xcframework_name.zip"

xcframework_path="$execution_dir/$xcframework_name"
package_file_path="$execution_dir/Package.swift"

framework_dir="$1/TagCommander"
if [ ! -d "$framework_dir" ]; then
    echo "Please provide a correct Tag Commander local source code repository file path"
    exit 0
fi

rm -rf "$xcframework_path"

pushd "$framework_dir" > /dev/null

echo "Building iphoneos variant..."
mkdir -p variants/iphoneos
xcodebuild archive -scheme TCCore -sdk iphoneos &> /dev/null
cp -r TCCore.framework variants/iphoneos

echo "Building iphonesimulator variant..."
mkdir -p variants/iphonesimulator
xcodebuild archive -scheme TCCore -sdk iphonesimulator &> /dev/null
cp -r TCCore.framework variants/iphonesimulator

echo "Building appletvos variant..."
mkdir -p variants/appletvos
xcodebuild archive -scheme TCCore -sdk appletvos &> /dev/null
cp -r TCCore.framework variants/appletvos

echo "Building appletvsimulator variant..."
mkdir -p variants/appletvsimulator
xcodebuild archive -scheme TCCore -sdk appletvsimulator &> /dev/null
cp -r TCCore.framework variants/appletvsimulator

echo "Packaging XCFramework..."
xcodebuild -create-xcframework \
    -framework variants/iphoneos/TCCore.framework \
    -framework variants/iphonesimulator/TCCore.framework \
    -framework variants/appletvos/TCCore.framework \
    -framework variants/appletvsimulator/TCCore.framework \
    -output "$xcframework_path" &> /dev/null

# rm -rf variants
popd > /dev/null

pushd $execution_dir > /dev/null

zip -r "$xcframework_zip_name" "$xcframework_name" > /dev/null
rm -rf "$xcframework_name"

# Currently a Package.swift file must be found for the command to succeed
dummy_package_file_created=false
if [ ! -f "$package_file_path" ]; then
    touch "$package_file_path"
    dummy_package_file_created=true
fi

hash=`swift package compute-checksum "$xcframework_zip_name"`

echo ""
echo "The zip hash is $hash"
echo ""
echo "Please keep the zip and its hash in a safe place, as regenerating a new zip will produce a new hash."

if $dummy_package_file_created; then
    rm "$package_file_path"
fi

popd > /dev/null
