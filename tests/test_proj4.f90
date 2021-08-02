! gfortran test_proj4.f90 -o test_proj4.exe -I/usr/local/include /usr/local/lib/libfproj.a -lproj

! subroutine GeographicToCartesian(lat,lon, params, x, y)

!     use fproj

!     !Arguments-------------------------------------------------------------
!     real(8)                                     :: lat,lon
!     character(len=20)                           :: params
!     real(8), intent(out)                        :: x,y

!     !Internal--------------------------------------------------------------
!     integer                                     :: status
!     type(fproj_prj)                             :: proj

!     status=fproj_init(proj,params)
!     if (status.ne.FPROJ_NOERR) then
!         write(*,*) fproj_strerrno(status)
!         stop 'GeographicToCartesian - ModuleFunctions - ERR01'
!     endif

!     status = fproj_transform(proj,lon,lat,x,y)
!     if (status.ne.FPROJ_NOERR) then
!         write(*,*) fproj_strerrno(status)
!         stop 'GeographicToCartesian - ModuleFunctions - ERR02'
!     end if

!     status = fproj_free(proj)
!     if (status.ne.FPROJ_NOERR) then
!         write(*,*) fproj_strerrno(status)
!         stop 'GeographicToCartesian - ModuleFunctions - ERR03'
!     end if

! end subroutine GeographicToCartesian

! !--------------------------------------------------------------------------

! subroutine CartesianToGeographic (x, y, params, lat,lon)

!     use fproj

!     !Arguments-------------------------------------------------------------
!     real(8)                                     :: x,y
!     character(len=20)             :: params
!     real(8), intent(out)                        :: lat,lon

!     !Internal--------------------------------------------------------------
!     integer                                     :: status
!     type(fproj_prj)                      :: proj

!     status=fproj_init(proj,params)
!     if (status.ne.FPROJ_NOERR) then
!         write(*,*) fproj_strerrno(status)
!         stop 'CartesianToGeographic - ModuleFunctions - ERR01'
!     endif

!     status = fproj_inv(proj,x,y,lon,lat)
!     if (status.ne.FPROJ_NOERR) then
!         write(*,*) fproj_strerrno(status)
!         stop 'CartesianToGeographic - ModuleFunctions - ERR02'
!     end if

!     status = fproj_free(proj)
!     if (status.ne.FPROJ_NOERR) then
!         write(*,*) fproj_strerrno(status)
!         stop 'CartesianToGeographic - ModuleFunctions - ERR03'
!     end if

! end subroutine CartesianToGeographic

program test_proj4

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

end program test_proj4
