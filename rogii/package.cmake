if(TARGET ZLib::library)
    return()
endif()

add_library(
    ZLib::library
    SHARED
    IMPORTED
)

set_target_properties(
    ZLib::library
    PROPERTIES
        IMPORTED_LOCATION
            "${CMAKE_CURRENT_LIST_DIR}/bin/zlib.dll"
        IMPORTED_LOCATION_DEBUG
            "${CMAKE_CURRENT_LIST_DIR}/bin/zlibd.dll"
        IMPORTED_IMPLIB
            "${CMAKE_CURRENT_LIST_DIR}/lib/zlib.lib"
        IMPORTED_IMPLIB_DEBUG
            "${CMAKE_CURRENT_LIST_DIR}/lib/zlibd.lib"
        INTERFACE_INCLUDE_DIRECTORIES
            "${CMAKE_CURRENT_LIST_DIR}/include"
)

set(
    COMPONENT_NAMES

    CNPM_RUNTIME_ZLib
    CNPM_RUNTIME
)

foreach(COMPONENT_NAME ${COMPONENT_NAMES})
    install(
        FILES
            $<TARGET_FILE:ZLib::library>
        DESTINATION
            .
        COMPONENT
            ${COMPONENT_NAME}
        EXCLUDE_FROM_ALL
    )
endforeach()
