#####
#
# CHAPTER 1
#
#####

#! @Chapter Preface
#! @ChapterLabel preface
#! @ChapterTitle Preface

#! The **class number** $k(G)$ of a group $G$ is the number of conjugacy classes of $G$. In 1903, Landau proved in <Cite Key='land03-a' /> that for every $n \in \mathbb{N}$, there are only finitely many groups with exactly $n$ conjugacy classes.
#! The <B>SmallClassNr</B> package provides access to the groups with class number at most $14$.
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
#! Returns the <A>i</A>-th group of of class number <A>k</A> in the library. If the group is solvable, it is given as a PcGroup, otherwise it will be given as a permutation group.
#! @Arguments k, i
DeclareGlobalFunction( "SmallClassNrGroup" );
#! @EndGroup

#! @BeginExample
G := SmallClassNrGroup( 6, 4 );
#! <pc group of size 18 with 3 generators>
IsDihedralGroup( G );
#! true
#! @EndExample

#! @BeginGroup SmallClassNrGroupsAvailableGroup
#! @Description
#! Returns <K>true</K> if the groups of class number <A>k</A> are available in the library, and <K>false</K> otherwise.
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
#! Returns all groups with certain properties as specified by <A>arg</A>. The first argument must be a number (or range of numbers) <A>k</A>. If only this argument is given, then this function returns all groups with the specified class number(s).
#! One can also give additional arguments which must come in pairs: a function and a value (or list of possible values). This function returns those groups with the specified class number(s) having those properties specified by the remaining functions and their values.
#! @Arguments k, arg
DeclareGlobalFunction( "AllSmallClassNrGroups" );
#! @EndGroup

#! @BeginExample
AllSmallClassNrGroups( [3..4] );
#! [ <pc group of size 3 with 1 generator>, <pc group of size 6 with 2 generators>,
#!   <pc group of size 4 with 2 generators>, <pc group of size 4 with 2 generators>,
#!   <pc group of size 10 with 2 generators>, <pc group of size 12 with 3 generators> ]
AllSmallClassNrGroups( 6, IsSolvable, true, IsNilpotent, false );
#! [ <pc group of size 12 with 3 generators>, <pc group of size 12 with 3 generators>,
#!   <pc group of size 18 with 3 generators>, <pc group of size 18 with 3 generators>,
#!   <pc group of size 36 with 4 generators>, <pc group of size 72 with 5 generators> ]
#! @EndExample

#! @BeginGroup OneSmallClassNrGroupGroup
#! @Description
#! Returns one group with class number (in the range) <A>k</A> and certain properties as specified by <A>arg</A>.
#! @Arguments k, arg
DeclareGlobalFunction( "OneSmallClassNrGroup" );
#! @EndGroup

#! @BeginExample
H := OneSmallClassNrGroup( 6, IsAbelian );
#! <pc group of size 6 with 2 generators>
IsCyclic( H );
#! true
OneSmallClassNrGroup( 10, IsSolvable, true, IsNilpotent, false );
#! <pc group of size 28 with 3 generators>
#! @EndExample

#! @BeginGroup NrSmallClassNrGroupsGroup
#! @Description
#! Returns the number of groups with class number <A>k</A>.
#! @Arguments k
DeclareGlobalFunction( "NrSmallClassNrGroups" );
#! @EndGroup

#! @BeginExample
NrSmallClassNrGroups( 14 );
#! 92
#! @EndExample
