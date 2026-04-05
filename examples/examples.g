#! @BeginChunk example_smallclassnrgroup
#! @BeginExample
SmallClassNrGroup( 4, 4 );
#! <pc group of size 12 with 3 generators>
G := SmallClassNrGroup( 4, 4 : AsPermGroup );
#! Group([ (1,2,3), (1,4,2) ])
NrConjugacyClasses( G );
#! 4
IsAlternatingGroup( G );
#! true
#! @EndExample
#! @EndChunk

#! @BeginChunk example_idclassnr
#! @BeginExample
IdClassNr( AlternatingGroup( 4 ) );
#! [ 4, 4 ]
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
AllSmallClassNrGroups( [ 3 .. 5 ], IsNilpotent : AsPermGroup );
#! [ Group([ (1,2,3) ]),
#!   Group([ (1,2,3,4) ]),
#!   Group([ (1,2), (3,4) ]),
#!   Group([ (1,2,3,4,5) ]),
#!   Group([ (1,2), (1,3)(2,4) ]),
#!   Group([ (1,2,3,4)(5,6,7,8), (1,5,3,7)(2,8,4,6) ]) ]
#! @EndExample
#! @EndChunk

#! @BeginChunk example_onesmallclassnrgroup
#! @BeginExample
OneSmallClassNrGroup( 6, IsSolvable, false );
#! Group([ (1,2,3)(4,5,6), (1,4)(2,7) ])
OneSmallClassNrGroup( 10, IsSolvable, true, IsNilpotent, false );
#! <pc group of size 28 with 3 generators>
OneSmallClassNrGroup( 10, IsSolvable, true, IsNilpotent, false : AsPermGroup );
#! Group([ (1,2,3,4,5,6,7), (2,7)(3,6)(4,5)(8,9,10,11) ])
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
