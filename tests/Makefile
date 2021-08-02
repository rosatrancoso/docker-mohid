

# -w -fallow-argument-mismatch -O2
#-w suppresses all warnings.  It is the only way (intentionally!) to
#suppress the argument mismatch warning.
#-fallow-argument-mismatch degrades the error to a warning.

hdf5: test_hdf5.f90
	rm -f test_hdf5.exe test_hdf5.hfd5 test_hdf5.o
	gfortran -w -fallow-argument-mismatch -O2 -static \
    test_hdf5.f90 -o test_hdf5.exe \
    -I/usr/local/include -L/usr/local/lib \
    /usr/local/lib/libhdf5hl_fortran.a \
    /usr/local/lib/libhdf5_hl.a \
    /usr/local/lib/libhdf5_fortran.a \
    /usr/local/lib/libhdf5.a \
    -lz -ldl -lm -Wl,-rpath -Wl,/usr/local/lib


netcdf: test_netcdf.f90
	rm -f test_netcdf.exe test_netcdf.o
	gfortran -w -fallow-argument-mismatch -O2 -static \
    test_netcdf.f90 -o test_netcdf.exe \
    -I/usr/local/include -L/usr/local/lib \
    -lnetcdff -lnetcdf \
    -lcurl -lhdf5_hl -lhdf5 -lm -ldl -lz

fproj: test_proj4.f90
    rm -rf test_proj4.exe test_proj4.o
    gfortran \
    test_proj4.f90 -o test_proj4.exe \
    -I/usr/local/include \
    /usr/local/lib/libfproj.a -lproj



# #     /usr/local/lib/libnetcdff.a \
# #     /usr/local/lib/libnetcdf.a \
# #     /usr/local/lib/libhdf5_hl.a \
# #     /usr/local/lib/libhdf5.a \
# #     /usr/lib/x86_64-linux-gnu/libcurl.a \
# #     -lm -ldl -lz -lpthread

# libtool: link: gfortran -I../../fortran -I../../fortran -w -fallow-argument-mismatch -O2
#     -fallow-argument-mismatch -o simple_xy_nc4_rd simple_xy_nc4_rd.o

#     -L/usr/local/lib ../../fortran/.libs/libnetcdff.a /usr/local/lib/libnetcdf.a
#     /usr/local/lib/libhdf5_hl.a /usr/local/lib/libhdf5.a -lm -ldl -lz
