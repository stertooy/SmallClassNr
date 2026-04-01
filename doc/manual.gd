#! @Chapter The Small Class Number Library

#! @Section Functions

#! @Returns the <A>i</A>-th finite group of class number <A>k</A> in the library.
#! @Description
#! Alternatively, the pair <C>[ <A>k</A>, <A>i</A> ]</C> can be given as a single argument <A>id</A>.
#! If the group is solvable, it is given as a PcGroup whose Pcgs is a SpecialPcgs.
#! If the group is not solvable, it will be given as a permutation group of minimal permutation degree and with a minimal generating set.
#! @Arguments k, i
DeclareGlobalFunction( "SmallClassNrGroup" );

#! @BeginExample
G := SmallClassNrGroup( 6, 4 );
#! <pc group of size 18 with 3 generators>
NrConjugacyClasses( G );
#! 6
IsDihedralGroup( G );
#! true
#! @EndExample

#! @Returns <K>true</K> if the finite groups of class number <A>k</A> are available in the library, and <K>false</K> otherwise.
#! @Arguments k
DeclareGlobalFunction( "SmallClassNrGroupsAvailable" );

#! @BeginExample
SmallClassNrGroupsAvailable( 14 );
#! true
SmallClassNrGroupsAvailable( 15 );
#! false
#! @EndExample

#! @Returns all finite groups with certain properties as specified by <A>arg</A>.
#! @Description
#! The arguments must come in pairs consisting of a function and a value (or list of possible values).
#! At least one of the functions must be <K>NrConjugacyClasses</K>.
#! Missing functions will be interpreted as <K>NrConjugacyClasses</K>, missing values as <K>true</K>.
#! @Arguments arg
DeclareGlobalFunction( "AllSmallClassNrGroups" );

#! @BeginExample
L1 := AllSmallClassNrGroups( [3..5], IsNilpotent );
#! [ <pc group of size 3 with 1 generator>,
#!   <pc group of size 4 with 2 generators>,
#!   <pc group of size 4 with 2 generators>,
#!   <pc group of size 5 with 1 generator>,
#!   <pc group of size 8 with 3 generators>,
#!   <pc group of size 8 with 3 generators> ]
List( L1, NrConjugacyClasses );
#! [ 3, 4, 4, 5, 5, 5 ]
L2 := AllSmallClassNrGroups( IsSolvable, true, NrConjugacyClasses, 6 );
#! [ <pc group of size 6 with 2 generators>,
#!   <pc group of size 12 with 3 generators>,
#!   <pc group of size 12 with 3 generators>,
#!   <pc group of size 18 with 3 generators>,
#!   <pc group of size 18 with 3 generators>,
#!   <pc group of size 36 with 4 generators>,
#!   <pc group of size 72 with 5 generators> ]
ForAll( L2, G -> IsSolvable( G ) and NrConjugacyClasses( G ) = 6 );
#! true
#! @EndExample

#! @Returns one finite group with certain properties as specified by <A>arg</A>.
#! @Description
#! The arguments must come in pairs consisting of a function and a value (or list of possible values).
#! At least one of the functions must be <C>NrConjugacyClasses</C>.
#! Missing functions will be interpreted as <C>NrConjugacyClasses</C>, missing values as <K>true</K>.
#! @Arguments arg
DeclareGlobalFunction( "OneSmallClassNrGroup" );

#! @BeginExample
H := OneSmallClassNrGroup( 6, IsAbelian );
#! <pc group of size 6 with 2 generators>
IsCyclic( H );
#! true
K := OneSmallClassNrGroup( 10, IsSolvable, true, IsNilpotent, false );
#! <pc group of size 28 with 3 generators>
NrConjugacyClasses( K ) = 10 and IsSolvable( K ) and not IsNilpotent( K );
#! true
#! @EndExample

#! @Returns the number of finite groups with certain properties as specified by <A>arg</A>.
#! @Description
#! The arguments must come in pairs consisting of a function and a value (or list of possible values).
#! At least one of the functions must be <C>NrConjugacyClasses</C>.
#! Missing functions will be interpreted as <C>NrConjugacyClasses</C>, missing values as <K>true</K>.
#! @Arguments arg
DeclareGlobalFunction( "NrSmallClassNrGroups" );

#! @BeginExample
NrSmallClassNrGroups( 14 );
#! 93
NrSmallClassNrGroups( [3..5], IsNilpotentGroup );
#! 6
NrSmallClassNrGroups( IsSolvable, true, NrConjugacyClasses, 6 );
#! 7
#! @EndExample

#! @Returns an iterator that iterates over the finite groups with properties as specified by <A>arg</A>.
#! The arguments must come in pairs consisting of a function and a value (or list of possible values).
#! At least one of the functions must be <C>NrConjugacyClasses</C>.
#! Missing functions will be interpreted as <C>NrConjugacyClasses</C>, missing values as <K>true</K>.
#! @Arguments arg
DeclareGlobalFunction( "IteratorSmallClassNrGroups" );
#! @EndGroup

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

#! @Returns the &PACKAGENAME; ID of <A>G</A>, i.e. a pair <C>[ <A>k</A>, <A>i</A> ]</C> such that <A>G</A> is isomorphic to <C>SmallClassNrGroup( <A>k</A>, <A>i</A> )</C>.
#! @Label
#! @Arguments G
DeclareAttribute( "IdClassNr", IsGroup );

#! @BeginExample
IdClassNr( AlternatingGroup( 5 ) );
#! [ 5, 8 ]
A := SmallClassNrGroup( 5, 8 );
#! Group([ (1,2,3), (1,4,5) ])
IsAlternatingGroup( A );
#! true
#! @EndExample
