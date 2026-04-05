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

#! @BeginChunk example_smallclassnrgroupsavailable
#! @BeginExample
SmallClassNrGroupsAvailable( 14 );
#! true
SmallClassNrGroupsAvailable( 15 );
#! false
#! @EndExample
#! @EndChunk
