gap> START_TEST( "Testing SmallClassNr" );

#
gap> grps := AllSmallClassNrGroups( [ 1..14 ] );;
gap> Collected( List( grps, NrConjugacyClasses ) );
[ [ 1, 1 ], [ 2, 1 ], [ 3, 2 ], [ 4, 4 ], [ 5, 8 ], [ 6, 8 ], [ 7, 12 ], [ 8, 21 ], [ 9, 26 ], [ 10, 37 ], [ 11, 35 ], [ 12, 51 ], [ 13, 53 ], [ 14, 93 ] ]

#
gap> NrSmallClassNrGroups( 10 );
37
gap> NrSmallClassNrGroups( [1..7] );
36
gap> NrSmallClassNrGroups( [13..14], IsNilpotentGroup, false );
115
gap> NrSmallClassNrGroups( 15 );
Error, the library of groups of class number 15 is not available

#
gap> IsAlternatingGroup( SmallClassNrGroup( [ 5, 8 ] ) );
true
gap> IsSimpleGroup( SmallClassNrGroup( 10, 35 ) );
true
gap> SmallClassNrGroup( 2, 2 );
Error, there is just 1 group of class number 2
gap> SmallClassNrGroup( 10, 38 );
Error, there are just 37 groups of class number 10
gap> SmallClassNrGroup( 15, 15 );
Error, the library of groups of class number 15 is not available
gap> IdClassNr( AlternatingGroup( 5 ) );
[ 5, 8 ]
gap> IdClassNr( MathieuGroup( 11 ) );
[ 10, 35 ]
gap> IdClassNr( PcGroupCode( 8322, 24 ) );
Error, the library of groups of class number 15 is not available

#
gap> G := OneSmallClassNrGroup( [ 4..11 ], IsSolvableGroup, IsNilpotentGroup, false, DerivedLength, [ 3, 4 ], IsSupersolvableGroup );;
gap> Size( G );
54
gap> NrConjugacyClasses( G );
10
gap> H := OneSmallClassNrGroup( [ 4..11 ], IsSolvableGroup, IsNilpotentGroup, false, DerivedLength, [ 4 ], IsSupersolvableGroup );
fail
gap> SL42 := OneSmallClassNrGroup( 14, IsSolvableGroup, false, IsSL  );;
gap> IsomorphismGroups( SL42, SL(4,2) ) <> fail;
true
gap> OneSmallClassNrGroup( 15, IsSolvableGroup, false, IsSL  );
Error, the library of groups of class number 15 is not available
gap> AlternatingDegree( OneSmallClassNrGroup( 14, IsSolvableGroup, false, IsAlternatingGroup ) );
8

#
gap> itr := IteratorSmallClassNrGroups( [ 4..11 ], IsSolvableGroup, IsNilpotentGroup, false, DerivedLength, [ 3, 4 ], IsSupersolvableGroup );;
gap> Size( NextIterator( itr ) );
54
gap> IsDoneIterator( itr );
false
gap> IsDoneIterator( itr );
false
gap> Size( NextIterator( itr ) );
108
gap> NextIterator( itr );
fail
gap> IsDoneIterator( itr );
true

#
gap> STOP_TEST( "smallclassnr.tst" );
