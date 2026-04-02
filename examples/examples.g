#! @BeginChunk example_smallclassnrgroup
#! @BeginExample
G := SmallClassNrGroup( 5, 8 );
#! Group([ (1,2,3), (1,4,5) ])
NrConjugacyClasses( G );
#! 5
IsAlternatingGroup( G );
#! true
#! @EndExample
#! @EndChunk

#! @BeginChunk example_idclassnr
#! @BeginExample
IdClassNr( AlternatingGroup( 5 ) );
#! [ 5, 8 ]
#! @EndExample
#! @EndChunk

#! @BeginChunk example_allsmallclassnrgroups
#! @BeginExample
AllSmallClassNrGroups( IsSolvable, true, NrConjugacyClasses, 6 );
#! [ <pc group of size 6 with 2 generators>,
#!   <pc group of size 12 with 3 generators>,
#!   <pc group of size 12 with 3 generators>,
#!   <pc group of size 18 with 3 generators>,
#!   <pc group of size 18 with 3 generators>,
#!   <pc group of size 36 with 4 generators>,
#!   <pc group of size 72 with 5 generators> ]
AllSmallClassNrGroups( [ 3 .. 5 ], IsNilpotent );
#! [ <pc group of size 3 with 1 generator>,
#!   <pc group of size 4 with 2 generators>,
#!   <pc group of size 4 with 2 generators>,
#!   <pc group of size 5 with 1 generator>,
#!   <pc group of size 8 with 3 generators>,
#!   <pc group of size 8 with 3 generators> ]
#! @EndExample
#! @EndChunk

#! @BeginChunk example_onesmallclassnrgroup
#! @BeginExample
OneSmallClassNrGroup( 6, IsSolvable, false );
#! Group([ (1,2,3)(4,5,6), (1,4)(2,7) ])
OneSmallClassNrGroup( 10, IsSolvable, true, IsNilpotent, false );
#! <pc group of size 28 with 3 generators>
#! @EndExample
#! @EndChunk

#! @BeginChunk example_nrsmallclassnrgroups
#! @BeginExample
NrSmallClassNrGroups( 14 );
#! 93
NrSmallClassNrGroups( IsSolvable, true, NrConjugacyClasses, 6 );
#! 7
NrSmallClassNrGroups( [ 3 .. 5 ], IsNilpotentGroup );
#! 6
#! @EndExample
#! @EndChunk

#! @BeginChunk example_iteratorsmallclassnrgroups
#! @BeginExample
iter := IteratorSmallClassNrGroups( 12, IsSimpleGroup );
#! <iterator>
for G in iter do Print( Size( G ), "\n" ); od;
#! 3420
#! 5616
#! 443520
#! @EndExample
#! @EndChunk

#! @BeginChunk example_smallclassnrgroupsavailable
#! @BeginExample
SmallClassNrGroupsAvailable( 14 );
#! true
SmallClassNrGroupsAvailable( 15 );
#! false
#! @EndExample
#! @EndChunk
