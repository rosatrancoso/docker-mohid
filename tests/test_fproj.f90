! gfortran test_fproj.f90 -o test_fproj.exe -I/usr/local/include /usr/local/lib/libfproj.a -lproj

program test_fproj

    use fproj
    implicit none
    real(8):: lat,lon,x,y

    type(fproj_prj)     :: geo_proj, xy_proj
    character(len=256)  :: proj_str
    integer             :: status

    proj_str = '+proj=geos '//&
             '+lon_0=0 '//&
             '+h=35785863.0 '//&
             '+x_0=0 '//&
             '+y_0=0 '//&
             '+a=6378137.0 '//&
             '+b=6356752.3'//&
             '+units=m '//&
             '+sweep=y '//&
             '+no_defs'

    status = fproj_init(geo_proj, proj_str)
    if (status .ne. FPROJ_NOERR) then
        print*, fproj_strerrno(status)
        stop
    end if

    proj_str = '+proj=lcc '//&
             '+ellps=WGS84 '//&
             '+lat_1=30 '//&
             '+lat_2=60 '//&
             '+lon_0=-10'//&
             '+lat_0=37 '//&
             '+x_0=0 '//&
             '+y_0=0'


    status = fproj_init(xy_proj,proj_str)
    if (status.ne.FPROJ_NOERR) then
        write(*,*) fproj_strerrno(status)
        stop 'GeographicToCartesian - ModuleFunctions - ERR01'
    endif

    lon = -10
    lat = 37

    ! Method 1
    status = fproj_transfer(geo_proj, xy_proj, lon, lat, x, y)
    if ((status .ne. FPROJ_NOERR) .and.&
        (status .ne. FPROJ_TOLERANCE_CONDITION_ERR)) then
        print*, fproj_strerrno(status)
        stop
    end if

    print*, x, y

    status = fproj_transfer(xy_proj, geo_proj, x, y, lon, lat)
    if ((status .ne. FPROJ_NOERR) .and.&
        (status .ne. FPROJ_TOLERANCE_CONDITION_ERR)) then
        print*, fproj_strerrno(status)
        stop
    end if

    print*, lon,lat

    !-------------------------------------------
    ! Method 2
    status = fproj_fwd(xy_proj, lon, lat, x, y)
    if ((status .ne. FPROJ_NOERR) .and.&
       (status .ne. FPROJ_TOLERANCE_CONDITION_ERR)) then
        print*, fproj_strerrno(status)
        stop
    end if

    print*, x, y

    status = fproj_inv(xy_proj, x, y, lat, lon)
    if ((status .ne. FPROJ_NOERR) .and.&
       (status .ne. FPROJ_TOLERANCE_CONDITION_ERR)) then
        print*, fproj_strerrno(status)
        stop
    end if

    print*, lat,lon

   !---------------------------------------------
   ! Deallocate

    status = fproj_free(geo_proj)
    if (status .ne. FPROJ_NOERR) then
        print*, fproj_strerrno(status)
        stop
    end if

    status = fproj_free(xy_proj)
    if (status .ne. FPROJ_NOERR) then
        print*, fproj_strerrno(status)
        stop
    end if

end program test_fproj
