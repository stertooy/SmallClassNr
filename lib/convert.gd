#! @Chapter otherlibraries

#! @Section otherlibraries

#! @Returns [ x, y ] such that SmallGroup( x, y ) is isomorphic to SmallClassNrGroup( k, i )
#! @Arguments k, i
DeclareGlobalFunction( "IdClassNrToIdGroup" );
# @InsertChunk example_smallclassnrgroup

#! @Returns [ x, y ] such that PrimitiveGroup( x, y ) is isomorphic to SmallClassNrGroup( k, i )
#! @Arguments k, i
DeclareGlobalFunction( "IdClassNrToPrimGrp" );
# @InsertChunk example_smallclassnrgroup

#! @Returns [ x, y ] such that TransitiveGroup( x, y ) is isomorphic to SmallClassNrGroup( k, i )
#! @Arguments k, i
DeclareGlobalFunction( "IdClassNrToTransGrp" );
# @InsertChunk example_smallclassnrgroup

#! @Returns name such that AtlasGroup( name ) is isomorphic to SmallClassNrGroup( k, i )
#! @Arguments k, i
DeclareGlobalFunction( "IdClassNrToAtlasName" );
# @InsertChunk example_smallclassnrgroup
