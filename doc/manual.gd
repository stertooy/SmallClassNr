#####
#
# CHAPTER 1
#
#####

#! @Chapter Preface
#! @ChapterLabel preface
#! @ChapterTitle Preface

#! The **class number** $k(G)$ of a group $G$ is the number of conjugacy classes of $G$. In 1903, Landau proved in <Cite Key='land03-a' /> that for every $n \in \mathbb{N}$, there are only finitely many finite groups with exactly $n$ conjugacy classes.
#! The <B>SmallClassNr</B> package provides access to the finite groups with class number at most $14$.
#! <P/>
#! These groups were classified in the following papers:
#! <List>
#! <Item> $k(G) \leq 5$, by Miller in <Cite Key='mill11-a' /> and independently by Burnside in <Cite Key='burn11-a' /></Item>
#! <Item> $k(G) = 6,7$, by Poland in <Cite Key='pola68-a' /></Item>
#! <Item> $k(G) = 8$, by Kosvintsev in <Cite Key='kosv74-a' /></Item>
#! <Item> $k(G) = 9$, by Odincov and Starostin in <Cite Key='os76-a' /></Item>
#! <Item> $k(G) = 10,11$, by Vera López and Vera López in <Cite Key='ll85-a' /></Item>
#! <Item> $k(G) = 12$, by Vera López and Vera López in <Cite Key='ll86-a' /></Item>
#! <Item> $k(G) = 13, 14$, by Vera López and Sangroniz in <Cite Key='vs07-a' /></Item>
#! </List>


#####
#
# CHAPTER 2
#
#####

#! @Chapter The Small Class Number Library
#! @ChapterLabel smallclassnrlib
#! @ChapterTitle The Small Class Number Library


###
# SECTION 1
###

#! @Section Functions

#! @BeginGroup SmallClassNrGroupGroup
#! @Description
#! Returns the <A>i</A>-th finite group of class number <A>k</A> in the library. If the group is solvable, it is given as a PcGroup, otherwise it will be given as a permutation group.
#! @Arguments k, i
DeclareGlobalFunction( "SmallClassNrGroup" );
#! @EndGroup

#! @BeginExample
G := SmallClassNrGroup( 6, 4 );
#! <pc group of size 18 with 3 generators>
NrConjugacyClasses( G );
#! 6
IsDihedralGroup( G );
#! true
#! @EndExample

#! @BeginGroup SmallClassNrGroupsAvailableGroup
#! @Description
#! Returns <K>true</K> if the finite groups of class number <A>k</A> are available in the library, and <K>false</K> otherwise.
#! @Arguments k
DeclareGlobalFunction( "SmallClassNrGroupsAvailable" );
#! @EndGroup

#! @BeginExample
SmallClassNrGroupsAvailable( 14 );
#! true
SmallClassNrGroupsAvailable( 15 );
#! false
#! @EndExample

#! @BeginGroup AllSmallClassNrGroupsGroup
#! @Description
#! Returns all finite groups with certain properties as specified by <A>arg</A>. The arguments must come in pairs consisting of a function and a value (or list of possible values). At least one of the functions must be <K>NrConjugacyClasses</K>. Missing functions will be interpreted as <K>NrConjugacyClasses</K>, missing values as <K>true</K>.
#! @Arguments arg
DeclareGlobalFunction( "AllSmallClassNrGroups" );
#! @EndGroup

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

#! @BeginGroup OneSmallClassNrGroupGroup
#! @Description
#! Returns one finite group with certain properties as specified by <A>arg</A>. The arguments must come in pairs consisting of a function and a value (or list of possible values). At least one of the functions must be <K>NrConjugacyClasses</K>. Missing functions will be interpreted as <K>NrConjugacyClasses</K>, missing values as <K>true</K>.
#! @Arguments arg
DeclareGlobalFunction( "OneSmallClassNrGroup" );
#! @EndGroup

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

#! @BeginGroup IteratorSmallClassNrGroupsGroup
#! @Description
#! Returns an iterator that iterates over the finite groups with properties as specified by <A>arg</A>. The arguments must come in pairs consisting of a function and a value (or list of possible values). At least one of the functions must be <K>NrConjugacyClasses</K>. Missing functions will be interpreted as <K>NrConjugacyClasses</K>, missing values as <K>true</K>.
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

#! @BeginGroup NrSmallClassNrGroupsGroup
#! @Description
#! Returns the number of finite groups with class number <A>k</A>.
#! @Arguments k
DeclareGlobalFunction( "NrSmallClassNrGroups" );
#! @EndGroup

#! @BeginExample
NrSmallClassNrGroups( 14 );
#! 92
#! @EndExample
