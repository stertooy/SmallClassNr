#! @Chapter library

#! @Section groupsbyids

#! @Returns the <A>i</A>-th finite group of class number <A>k</A> in the
#! library.
#! @Description
#! Alternatively, the pair <C>[ <A>k</A>, <A>i</A> ]</C> can be given as a
#! single argument <A>id</A>.
#! If the group is solvable, it is given as a PcGroup whose Pcgs is a
#! SpecialPcgs.
#! If the group is not solvable, it will be given as a permutation group of
#! minimal permutation degree and with a minimal generating set.
#! @Arguments k, i
DeclareGlobalFunction( "SmallClassNrGroup" );
#! @InsertChunk example_smallclassnrgroup

#! @Returns the &PACKAGENAME; ID of <A>G</A>, i.e. a pair
#! <C>[ <A>k</A>, <A>i</A> ]</C> such that <A>G</A> is isomorphic to 
#! <C>SmallClassNrGroup( <A>k</A>, <A>i</A> )</C>.
#! @Label
#! @Arguments G
DeclareAttribute( "IdClassNr", IsGroup );
#! @InsertChunk example_idclassnr

#! @Section availability

#! @Returns <K>true</K> if the finite groups of class number <A>k</A> are
#! available in the library, and <K>false</K> otherwise.
#! @Arguments k
DeclareGlobalFunction( "SmallClassNrGroupsAvailable" );
#! @InsertChunk example_smallclassnrgroupsavailable
