! gfortran test_fproj2.f90 -o test_fproj2.exe -I/usr/local/include /usr/local/lib/libfproj.a -lproj

subroutine GeographicToCartesian(lat,lon, params, x, y)

    use fproj

    !Arguments-------------------------------------------------------------
    real(8)                                     :: lat,lon
    character(256)                              :: params
    real(8), intent(out)                        :: x,y

    !Internal--------------------------------------------------------------
    integer                                     :: status
    type(fproj_prj)                             :: proj

    status = fproj_init(proj,params)
    if (status.ne.FPROJ_NOERR) then
        write(*,*) fproj_strerrno(status)
        stop 'GeographicToCartesian - ModuleFunctions - ERR01'
    endif

    status = fproj_fwd(proj,lon,lat,x,y)
    if (status.ne.FPROJ_NOERR) then
        write(*,*) fproj_strerrno(status)
        stop 'GeographicToCartesian - ModuleFunctions - ERR02'
    end if

    status = fproj_free(proj)
    if (status.ne.FPROJ_NOERR) then
        write(*,*) fproj_strerrno(status)
        stop 'GeographicToCartesian - ModuleFunctions - ERR03'
    end if

end subroutine GeographicToCartesian

!--------------------------------------------------------------------------

subroutine CartesianToGeographic (x, y, params, lat,lon)

    use fproj

    !Arguments-------------------------------------------------------------
    real(8)                                     :: x,y
    character(256)                              :: params
    real(8), intent(out)                        :: lat,lon

    !Internal--------------------------------------------------------------
    integer                                     :: status
    type(fproj_prj)                             :: proj

    status=fproj_init(proj,params)
    if (status.ne.FPROJ_NOERR) then
        write(*,*) fproj_strerrno(status)
        stop 'CartesianToGeographic - ModuleFunctions - ERR01'
    endif

    status = fproj_inv(proj,x,y,lon,lat)
    if (status.ne.FPROJ_NOERR) then
        write(*,*) fproj_strerrno(status)
        stop 'CartesianToGeographic - ModuleFunctions - ERR02'
    end if

    status = fproj_free(proj)
    if (status.ne.FPROJ_NOERR) then
        write(*,*) fproj_strerrno(status)
        stop 'CartesianToGeographic - ModuleFunctions - ERR03'
    end if

end subroutine CartesianToGeographic

program test_fproj2

    use fproj
    implicit none
    real(8)             :: lat,lon,x,y
    character(len=256)  :: params, a1,a2,a3,a4,a5
    integer             :: status

    a1 = '+proj=lcc +ellps=sphere'
    write(a2,'(a7,f8.3)') '+lat_1=', 30.0
    write(a3,'(a7,f8.3)') '+lat_2=', 60.0
    write(a4,'(a7,f8.3)') '+lon_0=', 180.0003
    write(a5,'(a7,f8.3)') '+lat_0=', 37.12369
    write(params, '(5(a,1x))') trim(a1), trim(a2), trim(a3), trim(a4), trim(a5)
    print*, params

    ! params = '+proj=lcc '//&
    !          '+ellps=WGS84 '//&
    !          '+lat_1=30 '//&
    !          '+lat_2=60 '//&
    !          '+lon_0=-10'//&
    !          '+lat_0=f8.3 '//&
    !          '+x_0=0 '//&
    !          '+y_0=0'

    lon = -10
    lat = 37

    call GeographicToCartesian(lat,lon, params, x, y)
    print*, x,y

    call CartesianToGeographic (x, y, params, lat,lon)
    print*, lat,lon


end program test_fproj2
