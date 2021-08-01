
include ./Makefile.inc

AR = ar rcs

FPP_DEFINES     = -D_LAGRANGIAN_GLOBAL_ -D_USE_NIX -D_STACK_LIMITS_ -D_USE_PROJ4

CCFLAGS         = ${WARNINGS_FLAGS} ${DEBUG_FLAGS} ${LANG_FLAGS} ${OPT_FLAGS} ${OTH_FLAGS} ${FPP_DEFINES}
OBJ_CCFLAGS     = $(CCFLAGS) -I$(INC_HDF5) -I$(INC_NETCDF) -I$(INC_PROJ4) -I$(INC_PROJ4F) -Iinclude

OBJ             =   build/ModuleGlobalData.o \
                    build/ModuleTime.o \
                    build/ModuleEnterData.o \
                    build/ModuleStopWatch.o \
                    build/proj4.o \
                    build/ModuleFunctions.o \
                    build/ModuleHorizontalGrid.o \
                    build/ModuleGridData.o  \
                    build/ModuleHorizontalMap.o \
                    build/ModuleGeometry.o \
                    build/ModuleMap.o \
                    build/ModuleNETCDF.o \
                    build/ModuleInterpolation.o \
                    build/ModuleBoxDif.o \
                    build/ModuleTwoWay.o \
                    build/ModuleField4D.o \
                    build/ModuleFillMatrix.o \
                    build/ModuleMM5Format.o \
                    build/ModuleEUCenterFormat.o \
                    build/ModuleERA40Format.o \
                    build/ModuleARPSFormat.o \
                    build/ModuleMERCATORFormat.o \
                    build/ModuleARPSToWW3.o \
                    build/ModuleHYCOMFormat.o \
                    build/ModuleNetCDFCF_2_HDF5MOHID.o \
                    build/ModuleLevitusFormat.o \
                    build/ModuleHellermanRosensteinAscii.o \
                    build/ModuleTecnoceanAscii.o \
                    build/ModuleCOWAMAAsciiWind.o \
                    build/ModuleSWAN.o \
                    build/ModuleReadSWANNonStationary.o \
                    build/ModuleHDF5ToASCIIandBIN.o \
                    build/ModuleGFSasciiWind.o \
                    build/ModuleWRFFormat.o \
                    build/ModuleCALMETFormat.o \
                    build/ModuleWOAFormat.o \
                    build/ModuleInterpolateGrids.o \
                    build/ModuleInterpolateTime.o \

.PHONY: clean all

all: bin/ConvertToHDF5.exe

bin/ConvertToHDF5.exe: ${OBJ}
	${FC} ${OBJ_CCFLAGS} $? src/ConvertToHDF5.F90 ${LIBS} -o bin/ConvertToHDF5.exe

build/ModuleGlobalData.o: src/ModuleGlobalData.F90
	${FC} -c $? ${OBJ_CCFLAGS} ${LIBS} -o $@ ${MODOUT}include

build/ModuleTime.o: src/ModuleTime.F90
	${FC} -c $? ${OBJ_CCFLAGS} ${LIBS} -o $@ ${MODOUT}include

build/ModuleEnterData.o: src/ModuleEnterData.F90
	${FC} -c $? ${OBJ_CCFLAGS} ${LIBS} -o $@ ${MODOUT}include

build/ModuleStopWatch.o: src/ModuleStopWatch.F90
	${FC} -c $? ${OBJ_CCFLAGS} ${LIBS} -o $@ ${MODOUT}include

build/proj4.o: src/proj4.F90
	${FC} -c $? ${OBJ_CCFLAGS} -o $@ ${MODOUT}include

build/ModuleFunctions.o: src/ModuleFunctions.F90
	${FC} -c $? ${OBJ_CCFLAGS} ${LIBS} -o $@ ${MODOUT}include


build/ModuleHorizontalGrid.o: src/ModuleHorizontalGrid.F90
	${FC} -c $? ${OBJ_CCFLAGS} ${LIBS} -o $@ ${MODOUT}include

build/ModuleGridData.o: src/ModuleGridData.F90
	${FC} -c $? ${OBJ_CCFLAGS} ${LIBS} -o $@ ${MODOUT}include

build/ModuleHorizontalMap.o: src/ModuleHorizontalMap.F90
	${FC} -c $? ${OBJ_CCFLAGS} ${LIBS} -o $@ ${MODOUT}include

build/ModuleGeometry.o: src/ModuleGeometry.F90
	${FC} -c $? ${OBJ_CCFLAGS} ${LIBS} -o $@ ${MODOUT}include

build/ModuleMap.o: src/ModuleMap.F90
	${FC} -c $? ${OBJ_CCFLAGS} ${LIBS} -o $@ ${MODOUT}include

build/ModuleNETCDF.o: src/ModuleNETCDF.F90
	${FC} -c $? ${OBJ_CCFLAGS} ${LIBS} -o $@ ${MODOUT}include

build/ModuleInterpolation.o: src/ModuleInterpolation.F90
	${FC} -c $? ${OBJ_CCFLAGS} ${LIBS} -o $@ ${MODOUT}include

build/ModuleBoxDif.o: src/ModuleBoxDif.F90
	${FC} -c $? ${OBJ_CCFLAGS} ${LIBS} -o $@ ${MODOUT}include

build/ModuleField4D.o: src/ModuleField4D.F90
	${FC} -c $? ${OBJ_CCFLAGS} ${LIBS} -o $@ ${MODOUT}include

build/ModuleTwoWay.o: src/ModuleTwoWay.F90
	${FC} -c $? ${OBJ_CCFLAGS} ${LIBS} -o $@ ${MODOUT}include

build/ModuleFillMatrix.o: src/ModuleFillMatrix.F90
	${FC} -c $? ${OBJ_CCFLAGS} ${LIBS} -o $@ ${MODOUT}include


# ------ ConvertToHDF5 ----- #

build/ModuleMM5Format.o: src/ModuleMM5Format.F90
	${FC} -c $? ${OBJ_CCFLAGS} ${LIBS} -o $@ ${MODOUT}include

build/ModuleEUCenterFormat.o: src/ModuleEUCenterFormat.F90
	${FC} -c $? ${OBJ_CCFLAGS} ${LIBS} -o $@ ${MODOUT}include

build/ModuleERA40Format.o: src/ModuleERA40Format.F90
	${FC} -c $? ${OBJ_CCFLAGS} ${LIBS} -o $@ ${MODOUT}include

build/ModuleARPSFormat.o: src/ModuleARPSFormat.F90
	${FC} -c $? ${OBJ_CCFLAGS} ${LIBS} -o $@ ${MODOUT}include

build/ModuleMERCATORFormat.o: src/ModuleMERCATORFormat.F90
	${FC} -c $? ${OBJ_CCFLAGS} ${LIBS} -o $@ ${MODOUT}include

build/ModuleARPSToWW3.o: src/ModuleARPSToWW3.F90
	${FC} -c $? ${OBJ_CCFLAGS} ${LIBS} -o $@ ${MODOUT}include

build/ModuleHYCOMFormat.o: src/ModuleHYCOMFormat.F90
	${FC} -c $? ${OBJ_CCFLAGS} ${LIBS} -o $@ ${MODOUT}include

build/ModuleNetCDFCF_2_HDF5MOHID.o: src/ModuleNetCDFCF_2_HDF5MOHID.F90
	${FC} -c $? ${OBJ_CCFLAGS} ${LIBS} -o $@ ${MODOUT}include

build/ModuleLevitusFormat.o: src/ModuleLevitusFormat.F90
	${FC} -c $? ${OBJ_CCFLAGS} ${LIBS} -o $@ ${MODOUT}include

build/ModuleHellermanRosensteinAscii.o: src/ModuleHellermanRosensteinAscii.F90
	${FC} -c $? ${OBJ_CCFLAGS} ${LIBS} -o $@ ${MODOUT}include

build/ModuleTecnoceanAscii.o: src/ModuleTecnoceanAscii.F90
	${FC} -c $? ${OBJ_CCFLAGS} ${LIBS} -o $@ ${MODOUT}include

build/ModuleCOWAMAAsciiWind.o: src/ModuleCOWAMAAsciiWind.F90
	${FC} -c $? ${OBJ_CCFLAGS} ${LIBS} -o $@ ${MODOUT}include

build/ModuleSWAN.o: src/ModuleSWAN.F90
	${FC} -c $? ${OBJ_CCFLAGS} ${LIBS} -o $@ ${MODOUT}include

build/ModuleReadSWANNonStationary.o: src/ModuleReadSWANNonStationary.F90
	${FC} -c $? ${OBJ_CCFLAGS} ${LIBS} -o $@ ${MODOUT}include

build/ModuleHDF5ToASCIIandBIN.o: src/ModuleHDF5ToASCIIandBIN.F90
	${FC} -c $? ${OBJ_CCFLAGS} ${LIBS} -o $@ ${MODOUT}include

build/ModuleGFSasciiWind.o: src/ModuleGFSasciiWind.F90
	${FC} -c $? ${OBJ_CCFLAGS} ${LIBS} -o $@ ${MODOUT}include

build/ModuleWRFFormat.o: src/ModuleWRFFormat.F90
	${FC} -c $? ${OBJ_CCFLAGS} ${LIBS} -o $@ ${MODOUT}include

build/ModuleCALMETFormat.o: src/ModuleCALMETFormat.F90
	${FC} -c $? ${OBJ_CCFLAGS} ${LIBS} -o $@ ${MODOUT}include

build/ModuleWOAFormat.o: src/ModuleWOAFormat.F90
	${FC} -c $? ${OBJ_CCFLAGS} ${LIBS} -o $@ ${MODOUT}include

build/ModuleInterpolateGrids.o: src/ModuleInterpolateGrids.F90
	${FC} -c $? ${OBJ_CCFLAGS} ${LIBS} -o $@ ${MODOUT}include

build/ModuleInterpolateTime.o: src/ModuleInterpolateTime.F90
	${FC} -c $? ${OBJ_CCFLAGS} ${LIBS} -o $@ ${MODOUT}include

install:
	ln -sf ../src/ConvertToHDF5/bin/ConvertToHDF5.exe ../../bin/ConvertToHDF5.exe

clean:
	-rm -f build/*.o
	-rm -f include/*.mod
	-rm -f bin/*.exe
