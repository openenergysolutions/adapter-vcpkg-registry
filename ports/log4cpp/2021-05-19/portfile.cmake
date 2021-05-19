vcpkg_from_github (
    OUT_SOURCE_PATH SOURCE_PATH
    REPO openenergysolutions/log4cpp
    REF 96c716b0d3b4d6921df4bb77d7749aaaeee19dfe 
    SHA512 f6e712c45a2d378870078b2cf17f6eab4ca9b062aa6fcd284353fcc7e6556ed2ad2e91178f68442297a1b717ce591926590256a830bc203cd3c7955649543185
    HEAD_REF master
)

vcpkg_configure_cmake(
    SOURCE_PATH "${SOURCE_PATH}"
    PREFER_NINJA
    OPTIONS
        -DINSTALL_CMAKE_DIR=share/log4cpp
)

vcpkg_install_cmake()
vcpkg_fixup_cmake_targets(CONFIG_PATH lib/cmake/log4cpp TARGET_PATH share/log4cpp)

file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug ${CURRENT_PACKAGES_DIR}/lib)

# Handle copyright
configure_file(${SOURCE_PATH}/LICENSE ${CURRENT_PACKAGES_DIR}/share/${PORT}/copyright COPYONLY)

