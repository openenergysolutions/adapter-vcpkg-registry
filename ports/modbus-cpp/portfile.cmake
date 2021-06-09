vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

vcpkg_from_github (
    OUT_SOURCE_PATH SOURCE_PATH
    REPO openenergysolutions/modbus-cpp
    REF 67c5fc8477b47cc6ff35944186eeec933c87724e
    SHA512 3e430f2342917d7df26d14bb3003c75e4e7cc864ca38f8ceffee01a85e8e1661b3e8b30fd369e7d0dca14ab80f92ee466d7a40294902ccd935a9be72a74011b6
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

