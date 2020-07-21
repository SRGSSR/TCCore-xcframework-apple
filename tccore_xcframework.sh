#!/bin/bash

execution_dir=`pwd`

xcframework_name="TCCore.xcframework"
xcframework_zip_name="$xcframework_name.zip"

xcframework_path="$execution_dir/$xcframework_name"
package_file_path="$execution_dir/Package.swift"

main_dir="$1/TagCommander"
framework_dir="$main_dir/TCCore"
if [ ! -d "$framework_dir" ]; then
    echo "Please provide a correct Tag Commander local source code repository file path"
    exit 0
fi

pushd "$framework_dir" > /dev/null

rm -rf "$xcframework_path"

echo "Bulding iphoneos variant..."
mkdir -p variants/iphoneos
xcodebuild -sdk iphoneos &> /dev/null
mv "$main_dir/TCCore.framework" variants/iphoneos

echo "Bulding iphonesimulator variant..."
mkdir -p variants/iphonesimulator
xcodebuild -sdk iphonesimulator &> /dev/null
mv "$main_dir/TCCore.framework" variants/iphonesimulator

echo "Bulding appletvos variant..."
mkdir -p variants/appletvos
xcodebuild -sdk appletvos &> /dev/null
mv "$main_dir/TCCore.framework" variants/appletvos

echo "Bulding appletvsimulator variant..."
mkdir -p variants/appletvsimulator
xcodebuild -sdk appletvsimulator &> /dev/null
mv "$main_dir/TCCore.framework" variants/appletvsimulator

echo "Packaging XCFramework..."
xcodebuild -create-xcframework \
    -framework variants/iphoneos/TCCore.framework \
    -framework variants/iphonesimulator/TCCore.framework \
    -framework variants/appletvos/TCCore.framework \
    -framework variants/appletvsimulator/TCCore.framework \
    -output "$xcframework_path" &> /dev/null

rm -rf variants
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
