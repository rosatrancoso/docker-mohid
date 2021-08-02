program test_array

    implicit none
    character(256)   :: a1,a2,a3,a4,a5, total
    character(256)  :: params

    a1 = "red"
    a2 = "green"
    a3 = "yellow"

    !total = (/ a1, a2, a3 /)
    write(total, '(a)') trim(a1)//trim(a2)
    print*, total

    a1 = '+proj=lcc +ellps=sphere'
    write(a2,'(a7,f8.3)') '+lat_1=', 30.0
    write(a3,'(a7,f8.3)') '+lat_2=', 60.0
    write(a4,'(a7,f8.3)') '+lon_0=', 180.0003
    write(a5,'(a7,f8.3)') '+lat_0=', 37.12369
    write(params, '(5(a,1x))') trim(a1), trim(a2), trim(a3), trim(a4), trim(a5)
    print*, params

end