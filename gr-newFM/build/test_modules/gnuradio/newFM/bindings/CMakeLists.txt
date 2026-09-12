# Copyright 2020 Free Software Foundation, Inc.
#
# This file is part of GNU Radio
#
# SPDX-License-Identifier: GPL-3.0-or-later
#

########################################################################
# Check if there is C++ code at all
########################################################################
if(NOT newFM_sources)
    message(STATUS "No C++ sources... skipping python bindings")
    return()
endif(NOT newFM_sources)

########################################################################
# Check for pygccxml
########################################################################
gr_python_check_module_raw("pygccxml" "import pygccxml" PYGCCXML_FOUND)

include(GrPybind)

########################################################################
# Python Bindings
########################################################################

list(APPEND newFM_python_files
    papGerch_python.cc python_bindings.cc)

gr_pybind_make_oot(newFM ../../.. gr::newFM "${newFM_python_files}")

# copy bindings extension for use in QA test module
add_custom_command(
    TARGET newFM_python
    POST_BUILD
    COMMAND ${CMAKE_COMMAND} -E copy $<TARGET_FILE:newFM_python>
            ${PROJECT_BINARY_DIR}/test_modules/gnuradio/newFM/)

install(
    TARGETS newFM_python
    DESTINATION ${GR_PYTHON_DIR}/gnuradio/newFM
    COMPONENT pythonapi)
