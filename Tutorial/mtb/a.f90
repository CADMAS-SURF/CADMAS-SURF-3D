program output_mtb
implicit none
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!変数定義
!孤立波
 integer NF         !周波数分割個数
 real(8) DT         !造波信号サンプリング間隔
 integer TNUM       !造波信号個数
 real(8) DZ         !鉛直方向分割幅
 integer DZNUM      !鉛直方向分割数
 real(8) WL
! real(8) DT
! real(8),ALLOCATABLE::t(:)
 real(8),ALLOCATABLE::h(:)
 real(8),ALLOCATABLE::u(:)
 real(8),ALLOCATABLE::z(:)
 real(8),ALLOCATABLE::Tn(:)
 real(8),ALLOCATABLE::Time(:)

!その他変数
! real(8) h          !水位
! real(8) u          !x方向流速
 integer, parameter :: n = 401
 integer i,j,k
 integer ka

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!入力データ読み込み
 open(unit=100,file='input.dat')
 read(100,*)NF
 read(100,*)DT
 read(100,*)TNUM
 read(100,*)DZ
 read(100,*)DZNUM
 read(100,*)WL
 
 ALLOCATE(h(TNUM))
 ALLOCATE(u(TNUM))
 ALLOCATE(Tn(TNUM))
 ALLOCATE(Time(TNUM))
 ALLOCATE(z(DZNUM))
 
 close(unit=100)

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!zdir
do i=1,DZNUM-1
   z(i)=(i-1)*DZ-WL
end do


!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!孤立波時系列ファイル読み込み
 open(unit=110,file='a.dat')
 do i = 1, TNUM
    read(110,*)h(i),u(i)
 end do
 close(110)
 
! do i = 1, TNUM
!    write(*,'(2f10.5)')h(i),u(i)
! end do

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!一旦書き出し
! open(unit=120,file='output.dat', status='replace')
! open(unit=120,file='output.dat')
    do i = 1, TNUM
    write(120,*)h(i),u(i)
    end do
! close(120)

!!!!!!!!!!!!!!!!!!!!!!!!!!
 do i=1,TNUM
  Time(i)=DT*(i-1)
  Tn(i)=1-(Time(i)/((TNUM-1)*DT))
 enddo

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!MTB
 open(unit=130,file='data.mtb')
 write(130,*)"LEVEL-ON",DZNUM,TNUM,"   1.0"
 write(130,1000)(z(k),k=1,DZNUM)
 
 do i=1,TNUM
 write(130,1001)"T",Tn(TNUM+1-i),h(TNUM+1-i)
    do k=1,DZNUM
    write(130,1002)u(TNUM+1-i),0.0
    enddo
 end do
 

1000 format(10(F10.5,2x))
1001 format(a1,2x,F10.5,2x,F10.5)
1002 format(3x,F10.5,2x,F10.5)
end program

