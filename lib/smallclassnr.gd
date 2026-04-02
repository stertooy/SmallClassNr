#! @Chapter library
#! @Section functions

#! @BeginGroup smallclassnrgroup
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
#! @EndGroup smallclassnrgroup

#! @Group smallclassnrgroupsavailable
#! @Returns <K>true</K> if the finite groups of class number <A>k</A> are
#! available in the library, and <K>false</K> otherwise.
#! @Arguments k
DeclareGlobalFunction( "SmallClassNrGroupsAvailable" );

#! @Group allsmallclassnrgroups
#! @Returns all finite groups with certain properties as specified by
#! <A>arg</A>.
#! @Description

#! The arguments must come in pairs consisting of a function and a value (or
#! list of possible values). At least one of the functions must be
#! <K>NrConjugacyClasses</K>.
#! Missing functions will be interpreted as <K>NrConjugacyClasses</K>, missing
#! values as <K>true</K>.
#! @Arguments arg
DeclareGlobalFunction( "AllSmallClassNrGroups" );

#! @Group onesmallclassnrgroup
#! @Returns one finite group with certain properties as specified by
#! <A>arg</A>.
#! @Description
#! The arguments must come in pairs consisting of a function and a value (or
#! list of possible values). At least one of the functions must be
#! <C>NrConjugacyClasses</C>.
#! Missing functions will be interpreted as <C>NrConjugacyClasses</C>, missing
#! values as <K>true</K>.
#! @Arguments arg
DeclareGlobalFunction( "OneSmallClassNrGroup" );

#! @Group nrsmallclassnrgroups
#! @Returns the number of finite groups with certain properties as specified by
#! <A>arg</A>.
#! @Description
#! The arguments must come in pairs consisting of a function and a value (or
#! list of possible values). At least one of the functions must be
#! <C>NrConjugacyClasses</C>.
#! Missing functions will be interpreted as <C>NrConjugacyClasses</C>, missing
#! values as <K>true</K>.
#! @Arguments arg
DeclareGlobalFunction( "NrSmallClassNrGroups" );

#! @Group iteratorsmallclassnrgroups
#! @Returns an iterator that iterates over the finite groups with properties as
#! specified by <A>arg</A>.
#! The arguments must come in pairs consisting of a function and a value (or
#! list of possible values). At least one of the functions must be
#! <C>NrConjugacyClasses</C>.
#! Missing functions will be interpreted as <C>NrConjugacyClasses</C>, missing
#! values as <K>true</K>.
#! @Arguments arg
DeclareGlobalFunction( "IteratorSmallClassNrGroups" );

#! @Group idclassnr
#! @Returns the &PACKAGENAME; ID of <A>G</A>, i.e. a pair
#! <C>[ <A>k</A>, <A>i</A> ]</C> such that <A>G</A>#! is isomorphic to 
#! <C>SmallClassNrGroup( <A>k</A>, <A>i</A> )</C>.
#! @Arguments G
DeclareAttribute( "IdClassNr", IsGroup );
