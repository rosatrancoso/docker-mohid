# -w -fallow-argument-mismatch -O2
#-w suppresses all warnings.  It is the only way (intentionally!) to
#suppress the argument mismatch warning.
#-fallow-argument-mismatch degrades the error to a warning.


system_hdf5:
	rm -f test_hdf5.exe test_hdf5.hfd5 test_hdf5.o
	gfortran \
    test_hdf5.f90 -o test_hdf5.exe \
    -I/usr/include/hdf5/serial \
    -L/usr/lib/x86_64-linux-gnu/hdf5/serial \
    /usr/lib/x86_64-linux-gnu/hdf5/serial/libhdf5hl_fortran.a \
    /usr/lib/x86_64-linux-gnu/hdf5/serial/libhdf5_hl.a \
    /usr/lib/x86_64-linux-gnu/hdf5/serial/libhdf5_fortran.a \
    /usr/lib/x86_64-linux-gnu/hdf5/serial/libhdf5.a \
    -lpthread -lsz -lz -ldl -lm -Wl,-rpath -Wl,/usr/lib/x86_64-linux-gnu/hdf5/serial


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

fproj: test_fproj.f90
	rm -rf test_fproj.exe test_fproj.o
	gfortran \
    test_fproj.f90 -o test_fproj.exe \
    -I/usr/local/include \
    /usr/local/lib/libfproj.a -lproj

fproj2: test_fproj2.f90
	rm -rf test_fproj2.exe test_fproj2.o
	gfortran \
    test_fproj2.f90 -o test_fproj2.exe \
    -I/usr/local/include \
    /usr/local/lib/libfproj.a -lproj


clean:
	rm -rf *.exe *.o *.hdf5
