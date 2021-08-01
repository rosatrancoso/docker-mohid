

hdf5_gfortran7: test_hdf5.f90
	gfortran -g -Wno-argument-mismatch \
        test_hdf5.f90 -o test_hdf5_gfortran7.exe \
        -I/usr/include/hdf5/serial \
        -L/usr/lib/x86_64-linux-gnu/hdf5/serial \
        -lhdf5hl_fortran -lhdf5_hl -lhdf5_fortran -lhdf5 \
        -Wl,-Bsymbolic-functions \
        -Wl,-z,relro \
        -lpthread -lsz -lz -ldl -lm \
        -Wl,-rpath \
        -Wl,/usr/lib/x86_64-linux-gnu/hdf5/serial

hdf5_gfortran9: test_hdf5.f90
	gfortran-9 -g  \
        test_hdf5.f90 -o test_hdf5_gfortran9.exe \
        -I/usr/include/hdf5/serial \
        -L/usr/lib/x86_64-linux-gnu/hdf5/serial \
        -lhdf5hl_fortran -lhdf5_hl -lhdf5_fortran -lhdf5 \
        -lpthread -lsz -lz -ldl -lm \
         -Wl,-rpath \
         -Wl,/usr/lib/x86_64-linux-gnu/hdf5/serial

# -w -fallow-argument-mismatch -O2
#-w suppresses all warnings.  It is the only way (intentionally!) to
#suppress the argument mismatch warning.
#-fallow-argument-mismatch degrades the error to a warning.

hdf5_gfortran10: test_hdf5.f90
	gfortran test_hdf5.f90 -g  \
        -ffree-form -std=legacy \
         -o test_hdf5_gfortran10.exe \
        -I/usr/include/hdf5/serial \
        -L/usr/lib/x86_64-linux-gnu/hdf5/serial \
        -lhdf5hl_fortran -lhdf5_hl -lhdf5_fortran -lhdf5 \
        -lpthread -lsz -lz -ldl -lm \
         -Wl,-rpath \
         -Wl,/usr/lib/x86_64-linux-gnu/hdf5/serial

hdf5_gfortran10_manual_libs:
	rm -f hdf5_gfortran10_manual_libs.exe test_hdf5.hdf5
	gfortran \
    test_hdf5.f90 -o hdf5_gfortran10_manual_libs.exe \
    -w -fallow-argument-mismatch -O2 \
    -I/usr/local/include -L/usr/local/lib \
    /usr/local/lib/libhdf5hl_fortran.a \
    /usr/local/lib/libhdf5_hl.a \
    /usr/local/lib/libhdf5_fortran.a \
    /usr/local/lib/libhdf5.a \
    -lz -ldl -lm -Wl,-rpath -Wl,/usr/local/lib

netcdf_gfortran10_manual_libs:
	rm -f netcdf_gfortran10_manual_libs.exe test_netcdf.hdf5
	gfortran \
    test_netcdf.f90 -o netcdf_gfortran10_manual_libs.exe \
    -w -fallow-argument-mismatch -O2 \
    -I/usr/local/include -L/usr/local/lib \
    /usr/local/lib/libnetcdff.a \
    /usr/local/lib/libnetcdf.a \
    /usr/local/lib/libhdf5_hl.a \
    /usr/local/lib/libhdf5.a \
    -lm -ldl -lz -lcurl

netcdf_gfortran10_manual_libs2:
	rm -f netcdf_gfortran10_manual_libs2.exe
	gfortran \
    test_netcdf.f90 -o netcdf_gfortran10_manual_libs2.exe \
    -w -fallow-argument-mismatch -O2 \
    -I/usr/local/include -L/usr/local/lib \
    -lnetcdf -lnetcdff

