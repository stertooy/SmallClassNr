gap> START_TEST( "Testing SmallClassNr" );

#
gap> grps := AllSmallClassNrGroups( [ 1..14 ] );;
gap> Collected( List( grps, NrConjugacyClasses ) );
[ [ 1, 1 ], [ 2, 1 ], [ 3, 2 ], [ 4, 4 ], [ 5, 8 ], [ 6, 8 ], [ 7, 12 ], [ 8, 21 ], [ 9, 26 ], [ 10, 37 ], [ 11, 35 ], [ 12, 51 ], [ 13, 53 ], [ 14, 92 ] ]

#
gap> STOP_TEST( "smallclassnr.tst" );
