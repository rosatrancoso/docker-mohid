program test_netcdf

    use netcdf
    implicit none
    integer :: a


    a = 100
    print*, 'ola', a
    print*, nf90_inq_libvers()


end program test_netcdf