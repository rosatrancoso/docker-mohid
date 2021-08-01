program test_logical

    implicit none
    integer:: i

    i = 0
    print*, 'i = ', i

    if (i == 1) then 
        print*, 'true'
    else
        print*, 'false'
    endif 

end program test_logical

