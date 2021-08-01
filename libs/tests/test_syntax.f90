program test_syntax

    implicit none
    integer:: i,j,k

    i = 1
    j=  2
    k = i + j
    print*, k

    k = i + &
        ( j + 1)
    print*, k


end program test_syntax