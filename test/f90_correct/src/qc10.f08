! Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
! See https://llvm.org/LICENSE.txt for license information.
! SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
!
! test for division operation of quad complex.

program test
  integer, parameter :: n = 10
  integer :: i
  complex(16) :: c1, c2, rst1, rst2, rst5
  complex(16) :: rst3 = (15.213513214321532163123412431412417090_16, 9.1214985738130981578153850981181281123_16) /&
                        (7.1231253324643254512433153216416124311_16, 12.241902481095124109198598327978737125_16)
  complex(16), parameter :: rst4 = (1.2135132143215321631234124311241709083_16, 2.1298419028097583091849810928910931241_16) /&
                                   (27.123125334246432545124335326416124311_16, 13.541305991830598109284908129842814809_16)
  real(16) :: result(n), expect(n)

  c1 = (42.58879788522658767867845243213578_16, -7.3387123548975562114863159753156_16)
  c2 = (-13.78966233687994235485669841336698_16, 71.233687476876737257454577868787_16)
  c3 = (13.78966233687994235485669841336698_16, -7.233687476876737257454577868787_16)

  rst1 = c1 / c2
  rst2 = (42.58879788522658767867845243213578_16, -7.3387123548975562114863159753156_16) /&
         (-1.378966233687994235485669841336698_16, 7.1233687476876737257454577868787_16)
  rst5 = c1 / c3

  expect(1) = -0.210859766843625667111979922331353958_16
  expect(2) = -0.557055436908284384480787815428915061_16
  expect(3) = -2.10859766843625667111979922331353930_16
  expect(4) = -5.57055436908284384480787815428915022_16
  expect(5) = 1.09685377455044378727015536686555721_16
  expect(6) = -0.604520932774995160585869887455639918_16
  expect(7) = 6.71959040822876426460309270686977187E-0002_16
  expect(8) = 4.49771768260604781304744272119601871E-0002_16
  expect(9) = 3.08845835161479925782804498669209346_16
  expect(10) = -0.532189415715918147844126329609984013_16

  result(1) = rst1%re
  result(2) = rst1%im
  result(3) = rst2%re
  result(4) = rst2%im
  result(5) = rst3%re
  result(6) = rst3%im
  result(7) = rst4%re
  result(8) = rst4%im
  result(9) = rst5%re
  result(10) = rst5%im

  do i = 1, n
    if (abs((result(i) - expect(i)) / expect(i)) .gt. 1E-33) STOP i
  enddo

  print *, 'PASS'
end
