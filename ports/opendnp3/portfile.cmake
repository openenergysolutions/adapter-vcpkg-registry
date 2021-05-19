vcpkg_from_github (
    OUT_SOURCE_PATH SOURCE_PATH
    REPO openenergysolutions/opendnp3
    REF 5788b0a7238e70076cf0bba45aa8a2e813d194b1
    SHA512 04e6b9e287a180e2debff643b7702e98fad95518c351d2f09bf971e510e992de15ea47010b2740077799563fe841a9a5746336a727e937a2e55be222a65a8473
    HEAD_REF master
)

vcpkg_configure_cmake(
    SOURCE_PATH "${SOURCE_PATH}"
    PREFER_NINJA
    OPTIONS
        -DDNP3_STATIC_LIBS=ON
        -DDNP3_TLS=ON
)

vcpkg_install_cmake()
vcpkg_fixup_cmake_targets(CONFIG_PATH lib/cmake/opendnp3 TARGET_PATH share/opendnp3)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")

# Handle copyright
configure_file(${SOURCE_PATH}/LICENSE ${CURRENT_PACKAGES_DIR}/share/${PORT}/copyright COPYONLY)

