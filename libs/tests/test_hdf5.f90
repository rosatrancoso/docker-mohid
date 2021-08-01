! h5fc test_hdf5.f90
program test_hdf5

    use hdf5
    implicit none
    integer :: i
    character(10)   :: aux

    character(60)   :: FileName
    integer(HID_T)  :: FileID
    ! Mohid ModuleHDF5 has this
    ! Error: Type mismatch in argument 'hdferr' at (1); passed INTEGER(8) to INTEGER(4)
    integer(HID_T)  :: STAT_CALL
    !integer         :: STAT_CALL

    CALL h5open_f(i)
    print*, i

    STAT_CALL = i
    i = STAT_CALL

    FileName = 'test_hdf5.hdf5'
    call h5fcreate_f(trim(FileName),                &
                    ACCESS_FLAGS = H5F_ACC_TRUNC_F, &
                    FILE_ID = FileID,               &
                    HDFERR = STAT_CALL)
    print*, STAT_CALL

end program test_hdf5