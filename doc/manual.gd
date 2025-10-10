#! @Abstract
#! The &PACKAGENAME; package provides access to finite groups with
#! small class number. Currently, it contains the finite groups of
#! class number at most 14.

#! @Copyright
#! &copyright; 2022&ndash;&RELEASEYEAR; &AUTHOR;
#! <P/>
#! The &PACKAGENAME; package is free software, it may be redistributed
#! and/or modified under the terms and conditions of the
#! <URL Text="GNU Public License Version 2">
#! https://www.gnu.org/licenses/old-licenses/gpl-2.0.en.html</URL> or
#! (at your option) any later version.

#! @Acknowledgements
#! This documentation was created using the &GAPDoc; and &AutoDoc; packages.

#! @Chapter The &PackageName; package

#! This is the manual for the &GAP; 4 package &PACKAGENAME; version
#! &VERSION;, developed by &AUTHOR;.

#! @Section Installation
#! If you are using &GAP; version 4.15.0 or newer, then &PACKAGENAME; should
#! be installed by default.
#! 
#! If this is not the case, but the &PackageManager; package is installed and
#! loaded, you can install &PACKAGENAME; from within a &GAP; session using
#! <Ref Func="InstallPackage" BookName="PackageManager" Style="Number"/>.
#! @BeginLog
InstallPackage( "SmallClassNr" );
#! ...
#! true
#! @EndLog
#!
#! Alternatively, you can download &PACKAGENAME; as a .tar.gz archive
#! <URL Text='here'>&ARCHIVEURL;.tar.gz</URL>. After extracting, you should
#! place it in a suitable <F>pkg</F> folder. For example, on a Debian-based
#! Linux distribution (e.g. Ubuntu, Mint), you can place it in
#! <F>&dollar;HOME/.gap/pkg</F> (recommended) which makes it available for just
#! yourself, or in the &GAP; installation directory (<F>gap-X.Y.Z/pkg</F>)
#! which makes it available for all users.
#!
#! You can use the following command to efficiently install the package for
#! yourself:
#! <Listing Type="Command">wget -qO - https://[...].tar.gz | tar xzf - --one-top-level=&dollar;HOME/.gap/pkg</Listing>

#! @Section Loading
#! Once installed, loading &PACKAGENAME; can be done by using
#! <Ref Func="LoadPackage" BookName="ref" Style="Number"/>.
#! @BeginLog
LoadPackage( "SmallClassNr" );
#! ...
#! true
#! @EndLog

#! @Section Citing
#! If you use the &PACKAGENAME; package in your research, we would love to
#! hear about your work via an email to the address
#! <Email>&SUPPORTEMAIL;</Email>.
#! If you have used the &PACKAGENAME; package in the preparation of a
#! paper and wish to refer to it, please cite it as described below.

#! <P/>

#! In &BibTeX;:
#!<Listing Type="BibTeX">
#!&#64;misc{&ABBREV;&VERSION;,
#!    author =       {&AUTHORREVERSED;},
#!    title =        {{&PackageName;,
#!                    &SUBTITLE;,
#!                    Version &VERSION;}},
#!    note =         {GAP package},
#!    year =         {&RELEASEYEAR;},
#!    howpublished = {\url{&HOMEURL;}}
#!}</Listing><P/>
#! In &BibLaTeX;:
#!<Listing Type="BibLaTeX">
#!&#64;software{&ABBREV;&VERSION;,
#!    author =   {&AUTHORREVERSED;},
#!    title =    {&PackageName;},
#!    subtitle = {&SUBTITLE;},
#!    version =  {&VERSION;},
#!    note =     {GAP package},
#!    year =     {&RELEASEYEAR;},
#!    url =      {&HOMEURL;}
#!}</Listing>

#! @Section Support
#! If you encounter any problems, please submit them to the
#! <URL Text='issue tracker'>&ISSUEURL;</URL>.
#! If you have any questions on the usage or functionality of
#! &PACKAGENAME;, you may contact me via email at
#! <Email>&SUPPORTEMAIL;</Email>.

#! @Chapter Classification
#! The **class number** $k(G)$ of a group $G$ is the number of conjugacy classes of $G$. In 1903, Landau proved in <Cite Key='land03-a' /> that for every $n \in \mathbb{N}$, there are only finitely many finite groups with exactly $n$ conjugacy classes.
#! The &PACKAGENAME; package provides access to the finite groups with class number at most $14$.
#! <P/>
#! These groups were classified in the following papers:
#! <List>
#! <Item> $k(G) \leq 5$, by Miller in <Cite Key='mill11-a' /> and independently by Burnside in <Cite Key='burn11-a' /></Item>
#! <Item> $k(G) = 6,7$, by Poland in <Cite Key='pola68-a' /></Item>
#! <Item> $k(G) = 8$, by Kosvintsev in <Cite Key='kosv74-a' /></Item>
#! <Item> $k(G) = 9$, by Odincov and Starostin in <Cite Key='os76-a' /></Item>
#! <Item> $k(G) = 10,11$, by Vera López and Vera López in <Cite Key='ll85-a' /> (1) </Item>
#! <Item> $k(G) = 12$, by Vera López and Vera López in <Cite Key='ll86-a' /> (2) </Item>
#! <Item> $k(G) = 13, 14$, by Vera López and Sangroniz in <Cite Key='vs07-a' /></Item>
#! </List>
#! <P/>
#! <P/>
#! (1) In <Cite Key='ll85-a' />, three distinct groups of the form $(C_5 \times C_5) \rtimes C_4$ order $100$ with class number $10$ are given.
#! However, only two such groups exist, being the ones with <C>IdClassNr</C> equal to <C>[10,25]</C> and <C>[10,26]</C>.
#! <P/>
#! (2) In <Cite Key='ll86-a' />, only 48 groups with class number 12 are listed. The three missing groups are provided in the appendix of <Cite Key='vs07-a' />.
#! These are the groups with <C>IdClassNr</C> equal to <C>[12,13]</C>, <C>[12,16]</C> and <C>[12,39]</C>.

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
