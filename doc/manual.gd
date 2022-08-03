#####
#
# CHAPTER 1
#
#####

#! @Chapter Preface
#! @ChapterLabel preface
#! @ChapterTitle Preface

#! The **class number** $k(G)$ of a group $G$ is the number of conjugacy classes of $G$. In 1903, Landau proved in <Cite key='land03-a' /> that for every $n \in \mathbb{N}$, there are only finitely many groups with exactly $n$ conjugacy classes.
#! The <B>SmallClassNr</B> package provides access to the groups with class number at most $14$.
#! <P/>
#! These groups were classified in the following papers:
#! <ListBullet/> $k(G) \leq 5$, Miller (<Cite key='mill11-a' />), Burnside (<Cite key='burn11-a' />, Note A)
#! <ListBullet/> $k(G) = 6,7$ Poland (<Cite key='pola68-a' />)
#! <ListBullet/> $k(G) = 8$ Kosvintsev (<Cite key='kosv74-a' />)
#! <ListBullet/> $k(G) = 9$ Odincov and Starostin (<Cite key='os76-a' />)
#! <ListBullet/> $k(G) = 10,11$ Vera López and Vera López (<Cite key='ll85-a' />
#! <ListBullet/ >$k(G) = 12$ Vera López and Vera López (<Cite key='ll86-a' />
#! <ListBullet/> $k(G) = 13, 14$ Vera Lopez, Sangroniz (<Cite key='vs07-a' />)



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
#! Returns all groups with certain properties as specified by <A>arg</A>. The first argument must be a number <A>k</A> or a range <A>L</A>. If only this argument is given, then this function returns all groups with the specified class number(s).
#! One can also give additional arguments which must come in pairs: a function and a value (or list of possible values). This function returns those groups with the specified class number(s) having those properties specified by the remaining functions and their values.
#! @Arguments k, arg
DeclareGlobalFunction( "AllSmallClassNrGroups" );
#! @EndGroup
