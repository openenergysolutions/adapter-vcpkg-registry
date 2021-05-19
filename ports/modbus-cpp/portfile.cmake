vcpkg_from_github (
    OUT_SOURCE_PATH SOURCE_PATH
    REPO openenergysolutions/modbus-cpp
    REF 4287a7fa582c0e91deb930abdb24f170720643db
    SHA512 e3e74d911783f4138c8435ccfff4bc4a64daceb00389de692bdd8faf825a68294a5725d2c2c10bd9f73c93e1e0e79836758ed0a609515753c577dfcc147efbff
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
vcpkg_fixup_cmake_targets(CONFIG_PATH lib/cmake/modbus-cpp TARGET_PATH share/modbus-cpp)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")

# Handle copyright
configure_file(${SOURCE_PATH}/LICENSE ${CURRENT_PACKAGES_DIR}/share/${PORT}/copyright COPYONLY)

