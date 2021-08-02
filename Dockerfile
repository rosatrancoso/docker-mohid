FROM ubuntu:20.10
LABEL maintainer="rosatrancoso@gmail.com"

#ARG DEBIAN_FRONTEND="noninteractive"
RUN apt-get update && apt-get install -y \
    g++ gfortran git \
    make \
    m4 \
    vim \
    wget \
    zlib1g-dev


#######################
### Installing libs ###
#######################


ENV FCFLAGS="-w -fallow-argument-mismatch -O2" FFLAGS="-w -fallow-argument-mismatch -O2"
ADD libs /tmp/libs

# # --with-szlib=DIR        Use szlib library for external szlib I/O filter
# #                           [default=no]

RUN echo "Installing hdf5..." &&\
    cd /tmp/libs &&\
    tar -zxf hdf5-1.8.22.tar.gz &&\
    cd hdf5-1.8.22 &&\
    ./configure --prefix=/usr/local --enable-fortran --enable-fortran2003 --enable-cxx --enable-hl --disable-shared &&\
    make &&\
    make install &&\
    h5fc -show

RUN echo "Installing curl..." &&\
    cd /tmp/libs &&\
    tar -zxvf curl-7.78.0.tar.gz  &&\
    cd curl-7.78.0 &&\
    ./configure --disable-shared --without-ssl &&\
    make &&\
    make install


RUN echo "Installing netcdf-c..." &&\
    cd /tmp/libs &&\
    tar -zxf netcdf-c-4.8.0.tar.gz &&\
    cd netcdf-c-4.8.0 &&\
    ./configure --disable-shared --disable-dap &&\
    make &&\
    make install


ENV LDFLAGS="-L/usr/local/lib"  CPPFLAGS="-I/usr/local/include"
# static version of nc-config --libs
#-L/usr/local/lib -lnetcdf -lhdf5_hl -lhdf5 -lm -ldl -lz -lcurl

RUN echo "Installing netcdf-fortran..." &&\
    export LIBS="$(nc-config --libs)" &&\
    echo "$LIBS" &&\
    cd /tmp/libs &&\
    tar -zxf netcdf-fortran-4.5.3.tar.gz &&\
    cd netcdf-fortran-4.5.3 &&\
    ./configure --disable-shared --disable-dap &&\
    make &&\
    make install &&\
    nc-config --all

RUN apt-get install -y libproj-dev cmake
RUN echo "Installing fortran-proj..." &&\
    cd /tmp/libs &&\
    tar -zxf fortran-proj-v1.0.1.tar.gz &&\
    cd fortran-proj-v1.0.1 &&\
    sed -i 's/SHARED/STATIC/g' CMakeLists.txt &&\
    sed -i 's/shared/static/g' CMakeLists.txt &&\
    mkdir build && cd build &&\
    cmake .. &&\
    make  &&\
    make install


ARG GIT_TOKEN=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
ARG GIT_LFS_SKIP_SMUDGE=1

RUN echo '----- Compiling Mohid ----- ' &&\
    mkdir /source && cd /source/ &&\
    git clone https://$GIT_TOKEN@github.com/rosatrancoso/Mohid.git &&\
    cd /source/Mohid

