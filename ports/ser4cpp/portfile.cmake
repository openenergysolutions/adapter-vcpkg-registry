vcpkg_from_github (
    OUT_SOURCE_PATH SOURCE_PATH
    REPO openenergysolutions/ser4cpp
    REF 672854d02cfb377b578f1e3fcb16b5892e0d6b70
    SHA512 b05ae27d1f604c4901e5cb481f937e58cb633482defbed789a1cebb51f8ac12d59077f0f2c4daed4bca7cb1505137c972f046c0437526044851089311611bedd
    HEAD_REF master
)

vcpkg_configure_cmake(
    SOURCE_PATH "${SOURCE_PATH}"
    PREFER_NINJA
    OPTIONS
        -DINSTALL_CMAKE_DIR=share/ser4cpp
)

vcpkg_install_cmake()
vcpkg_fixup_cmake_targets(CONFIG_PATH lib/cmake/ser4cpp TARGET_PATH share/ser4cpp)

file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug ${CURRENT_PACKAGES_DIR}/lib)

# Handle copyright
configure_file(${SOURCE_PATH}/LICENSE ${CURRENT_PACKAGES_DIR}/share/${PORT}/copyright COPYONLY)

