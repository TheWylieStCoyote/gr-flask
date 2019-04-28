INCLUDE(FindPkgConfig)
PKG_CHECK_MODULES(PC_FLASK flask)

FIND_PATH(
    FLASK_INCLUDE_DIRS
    NAMES flask/api.h
    HINTS $ENV{FLASK_DIR}/include
        ${PC_FLASK_INCLUDEDIR}
    PATHS ${CMAKE_INSTALL_PREFIX}/include
          /usr/local/include
          /usr/include
)

FIND_LIBRARY(
    FLASK_LIBRARIES
    NAMES gnuradio-flask
    HINTS $ENV{FLASK_DIR}/lib
        ${PC_FLASK_LIBDIR}
    PATHS ${CMAKE_INSTALL_PREFIX}/lib
          ${CMAKE_INSTALL_PREFIX}/lib64
          /usr/local/lib
          /usr/local/lib64
          /usr/lib
          /usr/lib64
)

INCLUDE(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(FLASK DEFAULT_MSG FLASK_LIBRARIES FLASK_INCLUDE_DIRS)
MARK_AS_ADVANCED(FLASK_LIBRARIES FLASK_INCLUDE_DIRS)

