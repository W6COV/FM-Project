find_package(PkgConfig)

PKG_CHECK_MODULES(PC_GR_NEWFM gnuradio-newFM)

FIND_PATH(
    GR_NEWFM_INCLUDE_DIRS
    NAMES gnuradio/newFM/api.h
    HINTS $ENV{NEWFM_DIR}/include
        ${PC_NEWFM_INCLUDEDIR}
    PATHS ${CMAKE_INSTALL_PREFIX}/include
          /usr/local/include
          /usr/include
)

FIND_LIBRARY(
    GR_NEWFM_LIBRARIES
    NAMES gnuradio-newFM
    HINTS $ENV{NEWFM_DIR}/lib
        ${PC_NEWFM_LIBDIR}
    PATHS ${CMAKE_INSTALL_PREFIX}/lib
          ${CMAKE_INSTALL_PREFIX}/lib64
          /usr/local/lib
          /usr/local/lib64
          /usr/lib
          /usr/lib64
          )

include("${CMAKE_CURRENT_LIST_DIR}/gnuradio-newFMTarget.cmake")

INCLUDE(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(GR_NEWFM DEFAULT_MSG GR_NEWFM_LIBRARIES GR_NEWFM_INCLUDE_DIRS)
MARK_AS_ADVANCED(GR_NEWFM_LIBRARIES GR_NEWFM_INCLUDE_DIRS)
