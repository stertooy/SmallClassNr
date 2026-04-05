#! @BeginChunk example_smallgrp
#! @BeginExample
IdClassNrToIdGroup( 9, 19 );
#! [ 192, 1025 ]
IdClassNr( SmallGroup( 192, 1025 ) );
#! [ 9, 19 ]
#! @EndExample
#! @EndChunk

#! @BeginChunk example_perfgrp
#! @BeginExample
IdClassNrToPerfGrp( 10, 36 );
#! [ 14520, 1 ]
IdClassNr( PerfectGroup( 14520, 1 ) );
#! [ 10, 36 ]
#! @EndExample
#! @EndChunk

#! @BeginChunk example_primgrp
#! @BeginExample
IdClassNrToPrimGrp( 9, 25 );
#! [ 49, 25 ]
IdClassNr( PrimitiveGroup( 49, 25 ) );
#! [ 9, 25 ]
#! @EndExample
#! @EndChunk

#! @BeginChunk example_transgrp
#! @BeginExample
IdClassNrToTransGrp( 12, 46 );
#! [ 45, 314 ]
IdClassNr( TransitiveGroup( 45, 314 ) );
#! [ 12, 46 ]
#! @EndExample
#! @EndChunk

#! @BeginChunk example_atlasrep
#! @BeginExample
IdClassNrToAtlasName( 11, 34 );
#! "L2(17)"
IdClassNr( AtlasGroup( "L2(17)" ) );
#! [ 11, 34 ]
#! @EndExample
#! @EndChunk
