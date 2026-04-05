#! @Chapter otherlibraries

#! @Section smallgrp

#! @Returns a pair of integers <C>[x, y]</C> such that <C>SmallGroup(x, y)</C>
#! is isomorphic to <C>SmallClassNrGroup(<A>k</A>, <A>i</A>)</C>.
#! @Arguments k, i
DeclareGlobalFunction( "IdClassNrToIdGroup" );
# @InsertChunk example_smallclassnrgroup

#! @Section perfgrp

#! @Returns a pair of integers <C>[x, y]</C> such that
#! <C>PerfectGroup(x, y)</C> is isomorphic to
#! <C>SmallClassNrGroup(<A>k</A>, <A>i</A>)</C>.
#! @Arguments k, i
DeclareGlobalFunction( "IdClassNrToPerfGrp" );
# @InsertChunk example_smallclassnrgroup

#! @Section primgrp

#! @Returns a pair of integers <C>[x, y]</C> such that
#! <C>PrimitiveGroup(x, y)</C> is isomorphic to
#! <C>SmallClassNrGroup(<A>k</A>, <A>i</A>)</C>.
#! @Arguments k, i
DeclareGlobalFunction( "IdClassNrToPrimGrp" );
# @InsertChunk example_smallclassnrgroup

#! @Section transgrp

#! @Returns a pair of integers <C>[x, y]</C> such that
#! <C>TransitiveGroup(x, y)</C> is isomorphic to
#! <C>SmallClassNrGroup(<A>k</A>, <A>i</A>)</C>.
#! @Arguments k, i
DeclareGlobalFunction( "IdClassNrToTransGrp" );
# @InsertChunk example_smallclassnrgroup

#! @Section atlasrep

#! @Returns a string <C>name</C> such that <C>AtlasGroup(name)</C> is
#! isomorphic to <C>SmallClassNrGroup(<A>k</A>, <A>i</A>)</C>.
#! @Arguments k, i
DeclareGlobalFunction( "IdClassNrToAtlasName" );
# @InsertChunk example_smallclassnrgroup
