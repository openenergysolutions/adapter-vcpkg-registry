vcpkg_from_github (
    OUT_SOURCE_PATH SOURCE_PATH
    REPO openenergysolutions/exe4cpp
    REF 17599be72ee3d8bd0107d09b628e211d81d14eb5
    SHA512 100b1ded467e8c5bc32deab24a566a566529bba62428373267c595a8cbf6c12431e40b29737ef9c6357456c3e36ef67bf5f447f8c66b896fdae66d5ef1ca59e8
    HEAD_REF master
)

vcpkg_configure_cmake(
    SOURCE_PATH "${SOURCE_PATH}"
    PREFER_NINJA
    OPTIONS
        -DINSTALL_CMAKE_DIR=share/exe4cpp
)

vcpkg_install_cmake()
vcpkg_fixup_cmake_targets(CONFIG_PATH lib/cmake/exe4cpp TARGET_PATH share/exe4cpp)

file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug ${CURRENT_PACKAGES_DIR}/lib)

# Handle copyright
configure_file(${SOURCE_PATH}/LICENSE ${CURRENT_PACKAGES_DIR}/share/${PORT}/copyright COPYONLY)

