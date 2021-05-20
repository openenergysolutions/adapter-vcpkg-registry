vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

vcpkg_from_github (
    OUT_SOURCE_PATH SOURCE_PATH
    REPO openenergysolutions/modbus-cpp
    REF 4e5d5fcf8c838beb25b6e21be90416a5be576a01
    SHA512 634622e1da05d57a8bc78ed72554e8c59183d7ce92d2801a522fabd0a73bddbcfa5dcd223e7dbcff3d642f87fd3b80a68119d3560b1a0c148f8f4c03d1b8d7f4
    HEAD_REF master
)

vcpkg_configure_cmake(
    SOURCE_PATH "${SOURCE_PATH}"
    PREFER_NINJA
    OPTIONS
        -DMODBUS_VENDORED_DEPS=OFF
        -DMODBUS_BUILD_TESTS=OFF
        -DMODBUS_BUILD_EXAMPLES=OFF
)

vcpkg_install_cmake()
vcpkg_fixup_cmake_targets(CONFIG_PATH lib/cmake/modbuscpp TARGET_PATH share/modbuscpp)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")

# Handle copyright
configure_file(${SOURCE_PATH}/LICENSE ${CURRENT_PACKAGES_DIR}/share/${PORT}/copyright COPYONLY)

