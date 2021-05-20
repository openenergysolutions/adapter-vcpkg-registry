vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

vcpkg_from_github (
    OUT_SOURCE_PATH SOURCE_PATH
    REPO nats-io/nats.c
    REF b1a56d7ac44e4c9318d7b734b3309785451194a0
    SHA512 2dc56c93de51c31ad8a2bc6ec34501a2252283a954fe43e51260b8b74fdaf672a7e7cbd55de95d33650b31bf1619ece83c4d3b69e10e79ec475eed68de3d3ade
    HEAD_REF master
)

vcpkg_configure_cmake(
    SOURCE_PATH "${SOURCE_PATH}"
    PREFER_NINJA
    OPTIONS
    	-DNATS_BUILD_WITH_TLS=ON
    	-DNATS_BUILD_TLS_USE_OPENSSL_1_1_API=ON
	-DNATS_BUILD_EXAMPLES=OFF
	-DNATS_BUILD_STREAMING=OFF
	-DNATS_BUILD_LIB_SHARED=OFF
)

vcpkg_install_cmake()
vcpkg_fixup_cmake_targets(CONFIG_PATH lib/cmake/cnats TARGET_PATH share/cnats)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")

# Handle copyright
configure_file(${SOURCE_PATH}/LICENSE ${CURRENT_PACKAGES_DIR}/share/${PORT}/copyright COPYONLY)

