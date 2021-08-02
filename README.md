# docker-mohid

How to compile the model and save the executable outside of docker?

1. Compile libs statically in image mohid-build

    docker build -t mohid-build .

2. Test if libs are ok

    docker run -ti --rm -u $UID:$GID:$USER \
    -v $MYREPOS/docker-mohid/tests:/tmp/tests \
    mohid-build bash


    cd /tmp/tests
    make hdf5
    ./test_hdf5.exe
    make netcdf
    ./test_netcdf.exe
    make fproj
    ./test_fproj.exe
    make fproj2
    ./test_fproj2.exe


3. Run image mohid-build with Mohid code mounted on /source/Mohid

    docker run -ti -d --name mohid-build_1 \
    -u $UID:$GID:$USER \
    -v $MYREPOS/Mohid:/tmp/Mohid \
    -v $MYREPOS/docker-mohid:/tmp/docker-mohid \
    mohid-build

    docker exec -ti mohid-build_1 bash

    cd /tmp/docker-mohid/
    cd ConvertToHDF5
    ln -s Makefile.inc.gfortran Makefile.inc
    mkdir build include src
    cd src
    ln -s ../../../Mohid/Software/MOHIDBase1/*F90 .
    ln -s ../../../Mohid/Software/MOHIDBase1/*F .
    ln -s ../../../Mohid/Software/MOHIDBase2/*F90 .
    ln -s ../../../Mohid/Software/ConvertToHDF5/*F90 .
    cd ../
    make






## To do

- szlib?