#! @Chapter library
#! @Section functions

#! @BeginExample
G := SmallClassNrGroup( 6, 4 );
#! <pc group of size 18 with 3 generators>
NrConjugacyClasses( G );
#! 6
IsDihedralGroup( G );
#! true
#! @EndExample

#! @Group smallclassnrgroup
#! @BeginExample
G := SmallClassNrGroup( 6, 4 );
#! <pc group of size 18 with 3 generators>
NrConjugacyClasses( G );
#! 6
IsDihedralGroup( G );
#! true
#! @EndExample

#! @Group smallclassnrgroupsavailable
#! @BeginExample
SmallClassNrGroupsAvailable( 14 );
#! true
SmallClassNrGroupsAvailable( 15 );
#! false
#! @EndExample

#! @Group allsmallclassnrgroups
#! @BeginExample
L1 := AllSmallClassNrGroups( [3..5], IsNilpotent );
#! [ <pc group of size 3 with 1 generator>,
#!   <pc group of size 4 with 2 generators>,
#!   <pc group of size 4 with 2 generators>,
#!   <pc group of size 5 with 1 generator>,
#!   <pc group of size 8 with 3 generators>,
#!   <pc group of size 8 with 3 generators> ]
L2 := AllSmallClassNrGroups( IsSolvable, true, NrConjugacyClasses, 6 );
#! [ <pc group of size 6 with 2 generators>,
#!   <pc group of size 12 with 3 generators>,
#!   <pc group of size 12 with 3 generators>,
#!   <pc group of size 18 with 3 generators>,
#!   <pc group of size 18 with 3 generators>,
#!   <pc group of size 36 with 4 generators>,
#!   <pc group of size 72 with 5 generators> ]
#! @EndExample

#! @Group onesmallclassnrgroup
#! @BeginExample
H := OneSmallClassNrGroup( 6, IsAbelian );
#! <pc group of size 6 with 2 generators>
IsCyclic( H );
#! true
K := OneSmallClassNrGroup( 10, IsSolvable, true, IsNilpotent, false );
#! <pc group of size 28 with 3 generators>
#! @EndExample

#! @Group nrsmallclassnrgroups
#! @BeginExample
NrSmallClassNrGroups( 14 );
#! 93
NrSmallClassNrGroups( [3..5], IsNilpotentGroup );
#! 6
NrSmallClassNrGroups( IsSolvable, true, NrConjugacyClasses, 6 );
#! 7
#! @EndExample

#! @Group iteratorsmallclassnrgroups
#! @BeginExample
iter := IteratorSmallClassNrGroups( IsSolvable, false, 11 );
#! <iterator>
for G in iter do Print( Size( G ), "\n" ); od;
#! 336
#! 720
#! 720
#! 1344
#! 1344
#! 1512
#! 2448
#! 29120
#! @EndExample

#! @Group idclassnr
#! @BeginExample
IdClassNr( AlternatingGroup( 5 ) );
#! [ 5, 8 ]
A := SmallClassNrGroup( 5, 8 );
#! Group([ (1,2,3), (1,4,5) ])
#! @EndExample
