#! @Chapter library

#! @Section groupsbyids

#! @Returns the &PACKAGENAME; ID of <A>G</A>, i.e. a pair
#! <C>[<A>k</A>, <A>i</A>]</C> such that <A>G</A> is isomorphic to
#! <C>SmallClassNrGroup(<A>k</A>, <A>i</A>)</C>.
#! @Label
#! @Arguments G
DeclareAttribute( "IdClassNr", IsGroup );
#! @InsertChunk example_idclassnr
