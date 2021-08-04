# docker-mohid

## Experimenting with lib compilation

### Dockefile.system

Using system libraries

gfortran10 is less flexible:

```
Error: Type mismatch in argument 'hdferr' at (1); passed INTEGER(8) to INTEGER(4)
```

Need to compile hdf5 and netcdf with:

```
ENV FCFLAGS="-w -fallow-argument-mismatch -O2" FFLAGS="-w -fallow-argument-mismatch -O2"
```

### Dockerfile.static - WORKED!

Statically compile only the specific libraries :
    - hdf5, netcdf-c and netcdf-fortran with `-w -fallow-argument-mismatch -O2`
    - fproj that is not build anywhere


### Dockerfile.dynamic - WORKED!

All libraries compiled shared.


## Linking Mohid code to the right place

    cd /tmp/docker-mohid/ConvertToHDF5
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
