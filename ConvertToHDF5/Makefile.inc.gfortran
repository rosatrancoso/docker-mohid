FC = gfortran

DEBUG_FLAGS     = -g -fallow-argument-mismatch
LANG_FLAGS      = #-cpp -real_size 64
WARNINGS_FLAGS  = -w
OPT_FLAGS       = -fconvert=little-endian -ffree-line-length-none
OTH_FLAGS       =

MODOUT          = -J

LIB_DIR = /usr/local

HDF5            = ${LIB_DIR}
INC_HDF5        = $(HDF5)/include
LIB_HDF5        = $(HDF5)/lib

NETCDF          = ${LIB_DIR}
INC_NETCDF      = $(NETCDF)/include
LIB_NETCDF      = $(NETCDF)/lib

PROJ4           = ${LIB_DIR}
INC_PROJ4       = $(PROJ4)/include
LIB_PROJ4       = $(PROJ4)/lib

PROJ4F          = ${LIB_DIR}
INC_PROJ4F      = $(PROJ4F)/include
LIB_PROJ4F      = $(PROJ4F)/lib


LIBS            = \
                -L$(LIB_HDF5) -lhdf5hl_fortran -lhdf5_hl -lhdf5_fortran -lhdf5 \
                -L$(LIB_NETCDF) -lnetcdf -lnetcdff \
                -L$(LIB_PROJ4F) -lfproj4 \
                -L$(LIB_PROJ4) -lproj \
                -lpthread -lsz -lz -ldl -lm
