#####
#
# CHAPTER 1
#
#####

#! @Chapter Preface
#! @ChapterLabel preface
#! @ChapterTitle Preface

#! The **class number** $k(G)$ of a group $G$ is the number of conjugacy classes of $G$. In 1903, Landau proved in <Cite key='land03-a' /> that for every $n \in \mathbb{N}$, there are only finitely many groups with exactly $n$ conjugacy classes.
#! At the present time, all groups with $k(G) \leq 14$ have been classified, in the following papers:
#! <ListBullet/> $k(G) \leq 5$, Miller (<Cite key='mill11-a' />), Burnside (<Cite key='burn11-a' />, Note A)
#! <ListBullet/> $k(G) = 6,7$ J. Poland (<Cite key='pola68-a' />)
#! <ListBullet/> $k(G) = 8$ Kosvintsev ( Over the theory of groups with properties given over the centralizers of involutions)
#! <ListBullet/> $k(G) = 9$ Odincov Starostin (Finite groups with 9 classes of conjugate elements Ural. Gos. Univ. Mat. Zap, 1976)
#! <ListBullet/> $k(G) = 10,11$ Vera Lopez, Vera Lopez
#! <ListBullet/ >$k(G) = 12$ Vera Lopez, Vera Lopez
#! <ListBullet/> $k(G) = 13, 14$ Vera Lopez, Sangroniz
#! <P/>
#! This package provides access to this classification.

#! The methods in this package are based on algorithms and theorems from <Cite Key='fels00-1' />, <Cite Key='eick04-1' />, <Cite Key='roma16-1' />, <Cite Key='dt20-1' />, <Cite Key='tert21-2' /> and <Cite Key='tert21-1' />.


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

#! @Section Twisted Conjugation Action
#! Let $G, H$ be groups and $\varphi,\psi: H \to G$ group homomorphisms. Then the pair $(\varphi,\psi)$ induces a (right) group action on $G$ given by
#! $$G \times H \to G: (g,h) \mapsto g \cdot h := \psi(h)^{-1} g\varphi(h).$$
#! This group action is called **$(\varphi,\psi)$-twisted conjugation**, and induces an equivalence relation on the group $G$. We say that $g_1, g_2 \in G$ are $(\varphi,\psi)$-twisted conjugate, denoted by $g_1 \sim_{\varphi,\psi} g_2$, if and only if there exists some element $h \in H$ such that $g_1 \cdot h = g_2$, or equivalently $g_1 = \psi(h) g_2 \varphi(h)^{-1}$.
#! <P/>If $\varphi: G \to G$ is an endomorphism of a group $G$, then by **$\varphi$-twisted conjugacy** we mean $(\varphi,\mathrm{id}_G)$-twisted conjugacy. Most functions in this package will allow you to input a single endomorphism instead of a pair of homomorphisms. The "missing" endomorphism will automatically be assumed to be the identity mapping.

#! @BeginGroup TwistedConjugationGroup
#! @Description
#! Implements the twisted conjugation (right) group action induced by the pair of homomorphisms ( <A>hom1</A>, <A>hom2</A> ) as a function.
#! @Arguments hom1[, hom2]
DeclareGlobalFunction( "TwistedConjugation" );
#! @EndGroup

#! @BeginGroup IsTwistedConjugateGroup
#! @Description
#! Tests whether the elements <A>g1</A> and <A>g2</A> are twisted conjugate under the twisted conjugacy action of the pair of homomorphisms ( <A>hom1</A>, <A>hom2</A> ).
#! @Arguments hom1[, hom2], g1, g2
DeclareGlobalFunction( "IsTwistedConjugate" );
#! @EndGroup

#! @BeginGroup RepresentativeTwistedConjugationGroup
#! @Description
#! Computes an element that maps <A>g1</A> to <A>g2</A> under the twisted conjugacy action of the pair of homomorphisms ( <A>hom1</A>, <A>hom2</A> ) or returns <K>fail</K> if no such element exists.
#! @Arguments hom1[, hom2], g1, g2
DeclareGlobalFunction( "RepresentativeTwistedConjugation" );
#! @EndGroup

#! @BeginExample
G := AlternatingGroup( 6 );;
H := SymmetricGroup( 5 );;
phi := GroupHomomorphismByImages( H, G, [ (1,2)(3,5,4), (2,3)(4,5) ],
 [ (1,2)(3,4), () ] );;
psi := GroupHomomorphismByImages( H, G, [ (1,2)(3,5,4), (2,3)(4,5) ],
 [ (1,4)(3,6), () ] );; 
tc := TwistedConjugation( phi, psi );;
g1 := (4,6,5);;
g2 := (1,6,4,2)(3,5);;
IsTwistedConjugate( psi, phi, g1, g2 );
#! false
h := RepresentativeTwistedConjugation( phi, psi, g1, g2 );
#! (1,2)
tc( g1, h ) = g2;
#! true
#! @EndExample


###
# SECTION 2
###

#! @Section Reidemeister Classes
#! The equivalence classes of the equivalence relation $\sim_{\varphi,\psi}$ are called the **Reidemeister classes of $(\varphi,\psi)$** or the **$(\varphi,\psi)$-twisted conjugacy classes**. We denote the Reidemeister class of $g \in G$ by $[g]_{\varphi,\psi}$. The number of Reidemeister classes is called the Reidemeisternumber $R(\varphi,\psi)$ and is always a positive integer or infinity.

#! @BeginGroup ReidemeisterClassGroup
#! @Description
#! If <A>hom1</A> and <A>hom2</A> are group homomorphisms from  a group H to a group G, this method creates the Reidemeister class of the pair (<A>hom1</A>, <A>hom2</A>) with representative <A>g</A>. The following attributes and operations are available:
#! * <C>Representative</C>, which returns <A>g</A>,
#! * <C>GroupHomomorphismsOfReidemeisterClass</C>, which returns the list [ <A>hom1</A>, <A>hom2</A> ],
#! * <C>ActingDomain</C>, which returns the group H,
#! * <C>FunctionAction</C>, which returns the twisted conjugacy action on G,
#! * <C>Random</C>, which returns a random element belonging to the Reidemeister class,
#! * <C>\in</C>, which can be used to test if an element belongs to the Reidemeister class,
#! * <C>List</C>, which lists all elements in the Reidemeister class if there are finitely many, otherwise returns <K>fail</K>,
#! * <C>Size</C>, which gives the number of elements in the Reidemeister class,
#! * <C>StabiliserOfExternalSet</C>, which gives the stabiliser of the Reidemeister class under the twisted conjugacy action.
#!
#! @Arguments hom1[, hom2], g
DeclareGlobalFunction( "ReidemeisterClass" );
#! @Arguments hom1[, hom2], g
DeclareGlobalFunction( "TwistedConjugacyClass" );
#! @EndGroup

#! @BeginGroup ReidemeisterClassesGroup
#! @Description
#! Returns a list containing the Reidemeister classes of ( <A>hom1</A>, <A>hom2</A> ) if the Reidemeister number R( <A>hom1</A>, <A>hom2</A> ) is finite, or returns <K>fail</K> otherwise. It is guaranteed that the Reidemeister class of the identity is in the first position.
#! @Arguments hom1[, hom2]
DeclareGlobalFunction( "ReidemeisterClasses" );
#! @Arguments hom1[, hom2]
DeclareGlobalFunction( "TwistedConjugacyClasses" );
#! @EndGroup

#! @BeginGroup ReidemeisterNumberGroup
#! @Description
#! Returns the Reidemeister number of ( <A>hom1</A>, <A>hom2</A> ), i.e. the number of Reidemeister classes.
#! @Arguments hom1[, hom2]
DeclareGlobalFunction( "ReidemeisterNumber" );
#! @Arguments hom1[, hom2]
DeclareGlobalFunction( "NrTwistedConjugacyClasses" );
#! @EndGroup

#! @BeginExample
tcc := ReidemeisterClass( phi, psi, g1 );
#! (4,6,5)^G
Representative( tcc );
#! (4,6,5)
GroupHomomorphismsOfReidemeisterClass( tcc );
#! [ [ (1,2)(3,5,4), (2,3)(4,5) ] -> [ (1,2)(3,4), () ],
#! [ (1,2)(3,5,4), (2,3)(4,5) ] -> [ (1,4)(3,6), () ] ]
ActingDomain( tcc ) = H;
#! true
FunctionAction( tcc )( g1, h );
#! (1,6,4,2)(3,5)
Random( tcc ) in tcc;
#! true
List( tcc );
#! [ (4,6,5), (1,6,4,2)(3,5) ]
Size( tcc );
#! 2
StabiliserOfExternalSet( tcc );
#! Group([ (1,2,3,4,5), (1,3,4,5,2) ])
ReidemeisterClasses( phi, psi ){[1..3]};
#! [ ()^G, (4,5,6)^G, (4,6,5)^G ]
NrTwistedConjugacyClasses( phi, psi );
#! 184
#! @EndExample


###
# SECTION 3
###

#! @Section Reidemeister Spectra
#! The set of all Reidemeister numbers of automorphisms is called the **Reidemeister spectrum** and is denoted by $\mathrm{Spec}_R(G)$, i.e. 
#! $$\mathrm{Spec}_R(G) := \{ R(\varphi) \mid \varphi \in \mathrm{Aut}(G)\}.$$
#! The set of all Reidemeister numbers of endomorphisms is called the **extended Reidemeister spectrum** and is denoted by $\mathrm{ESpec}_R(G)$, i.e. 
#! $$\mathrm{ESpec}_R(G) := \{ R(\varphi) \mid \varphi \in \mathrm{End}(G)\}.$$
#! The set of all Reidemeister numbers of pairs of homomorphisms from a group $H$ to a group $G$ is called the **coincidence Reidemeister spectrum** of $H$ and $G$ and is denoted by $\mathrm{CSpec}_R(H,G)$, i.e. 
#! $$\mathrm{CSpec}_R(H,G) := \{ R(\varphi, \psi) \mid \varphi,\psi \in \mathrm{Hom}(H,G)\}.$$
#! If <A>H</A> = <A>G</A> this is also denoted by $\mathrm{CSpec}_R(G)$.

#! @Description
#! Returns the Reidemeister spectrum of <A>G</A>.
#! @Arguments G
DeclareGlobalFunction( "ReidemeisterSpectrum" );

#! @Description
#! Returns the extended Reidemeister spectrum of <A>G</A>.
#! @Arguments G
DeclareGlobalFunction( "ExtendedReidemeisterSpectrum" );

#! @Description
#! Returns the coincidence Reidemeister spectrum of <A>H</A> and <A>G</A>.
#! @Arguments [H, ]G
DeclareGlobalFunction( "CoincidenceReidemeisterSpectrum" );

#! @BeginExample
ReidemeisterSpectrum( G );
#! [ 3, 5, 7 ]
ExtendedReidemeisterSpectrum( G );
#! [ 1, 3, 5, 7 ]
CoincidenceReidemeisterSpectrum( G );
#! [ 1, 3, 5, 7, 360 ]
CoincidenceReidemeisterSpectrum( H );
#! [ 1, 2, 7, 60, 64, 66, 120 ]
CoincidenceReidemeisterSpectrum( H, G );
#! [ 180, 184, 360 ]
CoincidenceReidemeisterSpectrum( G, H );
#! [ 120 ]
#! @EndExample


###
# SECTION 4
###

#! @Section Reidemeister Zeta Functions
#! Let $\varphi,\psi: G \to G$ be endomorphisms such that $R(\varphi^n,\psi^n) &lt; \infty$ for all $n \in \mathbb{N}$. Then the **Reidemeister zeta function** $Z_{\varphi,\psi}(s)$ of the pair $(\varphi,\psi)$ is defined as
#! $$Z_{\varphi,\psi}(s) := \exp \sum_{n=1}^\infty \frac{R(\varphi^n,\psi^n)}{n} s^n.$$
#! Please note that the functions below are only implemented for endomorphisms of finite groups.

#! @BeginGroup ReidemeisterZetaCoefficientsGroup
#! @Description
#! For a finite group, the sequence of Reidemeister numbers of the iterates of <A>endo1</A> and <A>endo2</A>, i.e. the sequence R(<A>endo1</A>,<A>endo2</A>), R(<A>endo1</A>^2,<A>endo2</A>^2), ..., is eventually periodic, i.e. there exist a periodic sequence $(P_n)_{n \in \mathbb{N}}$ and an eventually zero sequence $(Q_n)_{n \in \mathbb{N}}$ such that
#! $$\forall n \in \mathbb{N}: R(\varphi^n,\psi^n) = P_n + Q_n.$$
#! This function returns a list containing two sublists: the first sublist contains one period of the sequence $(P_n)_{n \in \mathbb{N}}$, the second sublist contains $(Q_n)_{n \in \mathbb{N}}$ up to the part where it becomes the constant zero sequence.
#! @Arguments endo1[, endo2]
DeclareGlobalFunction( "ReidemeisterZetaCoefficients" );
#! @EndGroup

#! @BeginGroup IsRationalReidemeisterZetaGroup
#! @Description
#! Returns <K>true</K> if the Reidemeister zeta function of <A>endo1</A> and <A>endo2</A> is rational, and <K>false</K> otherwise.
#! @Arguments endo1[, endo2]
DeclareGlobalFunction( "IsRationalReidemeisterZeta" );
#! @EndGroup

#! @BeginGroup ReidemeisterZetaGroup
#! @Description
#! Returns the Reidemeister zeta function of <A>endo1</A> and <A>endo2</A> if it is rational, and <K>fail</K> otherwise.
#! @Arguments endo1[, endo2]
DeclareGlobalFunction( "ReidemeisterZeta" );
#! @EndGroup

#! @BeginGroup PrintReidemeisterZetaGroup
#! @Description
#! Returns a string describing the Reidemeister zeta function of <A>endo1</A> and <A>endo2</A>. This is often more readable than evaluating <C>ReidemeisterZeta</C> in an indeterminate, and does not require rationality.
#! @Arguments endo1[, endo2] 
DeclareGlobalFunction( "PrintReidemeisterZeta" );
#! @EndGroup

#! @BeginExample
khi := GroupHomomorphismByImages( G, G, [ (1,2,3,4,5), (4,5,6) ],
 [ (1,2,6,3,5), (1,4,5) ] );;
ReidemeisterZetaCoefficients( khi );
#! [ [ 7 ], [  ] ]
IsRationalReidemeisterZeta( khi );
#! true
ReidemeisterZeta( khi );
#! function( s ) ... end
s := Indeterminate( Rationals, "s" );;
ReidemeisterZeta( khi )(s);
#! (1)/(-s^7+7*s^6-21*s^5+35*s^4-35*s^3+21*s^2-7*s+1)
PrintReidemeisterZeta( khi );
#! "(1-s)^(-7)"
#! @EndExample



#####
#
# CHAPTER 4
#
#####

#! @Chapter Multiple Twisted Conjugacy Problem
#! @ChapterLabel mult
#! @ChapterTitle Multiple Twisted Conjugacy Problem


###
# SECTION 1
###

#! @Section The Multiple Twisted Conjugacy Problem
#! Let $H$ and $G_1, \ldots, G_n$ be groups. For each $i \in \{1,\ldots,n\}$, let $g_i,g_i' \in G_i$ and let $\varphi_i,\psi_i: H \to G_i$ be group homomorphisms. The multiple twisted conjugacy problem is the problem of finding some $h \in H$ such that $g_i = \psi_i(h)g_i'\varphi_i(h)^{-1}$ for all $i \in \{1,\ldots,n\}$.
#! 

#! @Description
#! Verifies whether the multiple twisted conjugacy problem for the given homomorphisms and elements has a solution.
#! @Arguments hom1List[, hom2List], g1List, g2List
#! @Label IsTwistedConjugate for the multiple twisted conjugacy problem
DeclareGlobalFunction( "IsTwistedConjugate" );

#! @Description
#! Computes a solution to the multiple twisted conjugacy problem for the given homomorphisms and elements, or returns <K>fail</K> if no solution exists.
#! @Arguments hom1List[, hom2List], g1List, g2List
#! @Label RepresentativeTwistedConjugation for the multiple twisted conjugacy problem
DeclareGlobalFunction( "RepresentativeTwistedConjugation" );

#! @BeginExample
H := SymmetricGroup( 5 );;
G := AlternatingGroup( 6 );;
tau := GroupHomomorphismByImages( H, G, [ (1,2)(3,5,4), (2,3)(4,5) ],
 [ (1,3)(4,6), () ] );; 
phi := GroupHomomorphismByImages( H, G, [ (1,2)(3,5,4), (2,3)(4,5) ],
 [ (1,2)(3,6), () ] );; 
psi := GroupHomomorphismByImages( H, G, [ (1,2)(3,5,4), (2,3)(4,5) ],
 [ (1,4)(3,6), () ] );; 
khi := GroupHomomorphismByImages( H, G, [ (1,2)(3,5,4), (2,3)(4,5) ],
 [ (1,2)(3,4), () ] );;
IsTwistedConjugate( [ tau, phi ], [ psi, khi ], [ (1,5)(4,6), (1,4)(3,5) ],
 [ (1,4,5,3,6), (2,4,5,6,3) ] );
#! true
RepresentativeTwistedConjugation( [ tau, phi ], [ psi, khi ], [ (1,5)(4,6), (1,4)(3,5) ],
 [ (1,4,5,3,6), (2,4,5,6,3) ] );
#! (1,2)
#! @EndExample



#####
#
# CHAPTER 4
#
#####

#! @Chapter Homomorphisms
#! @ChapterLabel homs
#! @ChapterTitle Homomorphisms


###
# SECTION 1
###

#! @Section Representatives of homomorphisms between groups


#! @Description
#! Let <A>G</A> be a group. This command returns a list of the automorphisms of <A>G</A> up to composition with inner automorphisms. 
#! @Arguments G
DeclareGlobalFunction( "RepresentativesAutomorphismClasses" );

#! @Description
#! Let <A>G</A> be a group. This command returns a list of the endomorphisms of <A>G</A> up to composition with inner automorphisms. This is essentially the same as calling <C>AllHomomorphismClasses(<A>G</A>,<A>G</A>)</C>, but should be much faster for large groups.
#! @Arguments G
DeclareGlobalFunction( "RepresentativesEndomorphismClasses" );

#! @Description
#! Let <A>G</A> and <A>H</A> be groups. This command returns a list of the homomorphisms from <A>H</A> to <A>G</A>, up to composition with inner automorphisms of <A>G</A>. This is essentially the same as calling <C>AllHomomorphismClasses(<A>H</A>,<A>G</A>)</C>, but should be much faster for large groups.
#! @Arguments H, G
DeclareGlobalFunction( "RepresentativesHomomorphismClasses" );

#! @BeginExample
G := AlternatingGroup( 6 );;
Auts := RepresentativesAutomorphismClasses( G );;
Size( Auts );
#! 4
ForAll( Auts, IsGroupHomomorphism and IsEndoMapping and IsBijective );
#! true
Ends := RepresentativesEndomorphismClasses( G );;
Size( Ends );
#! 5
ForAll( Ends, IsGroupHomomorphism and IsEndoMapping );
#! true
H := SymmetricGroup( 5 );;
Homs := RepresentativesHomomorphismClasses( H, G );;
Size( Homs );
#! 2
ForAll( Homs, IsGroupHomomorphism );
#! true
#! @EndExample


###
# SECTION 2
###

#! @Section Coincidence and Fixed Point Groups

#! @Description
#! Let <A>endo</A> be an endomorphism of a group G. This command returns the subgroup of G consisting of the elements fixed under the endomorphism <A>endo</A>.
#! @Arguments endo
DeclareGlobalFunction( "FixedPointGroup" );

#! @Description
#! Let <A>hom1</A>, <A>hom2</A>, ... be group homomorphisms from a group H to a group G. This command returns the subgroup of H consisting of the elements h for which h^<A>hom1</A> = h^<A>hom2</A> = ...
#! @Arguments hom1, hom2[, ...]
DeclareGlobalFunction( "CoincidenceGroup" );

#! @BeginExample
phi := GroupHomomorphismByImages( G, G, [ (1,2,3,4,5), (4,5,6) ],
 [ (1,2,6,3,5), (1,4,5) ] );;
FixedPointGroup( phi );
#! Group([ (1,2,6,4,3) ])
psi := GroupHomomorphismByImages( H, G, [ (1,2)(3,5,4), (2,3)(4,5) ],
 [ (1,4)(3,6), () ] );; 
khi := GroupHomomorphismByImages( H, G, [ (1,2)(3,5,4), (2,3)(4,5) ],
 [ (1,2)(3,4), () ] );;
CoincidenceGroup( psi, khi );
#! Group([ (1,2,3,4,5), (1,3,4,5,2) ])
#! @EndExample


###
# SECTION 3
###

#! @Section Induced and restricted group homomorphisms

#! @Description
#! Let <A>hom</A> be a group homomorphism from a group H to a group G, let <A>epi1</A> be an epimorphism from H to a group Q and let <A>epi2</A> be an epimorphism from G to a group P such that the kernel of <A>epi1</A> is mapped into the kernel of <A>epi2</A> by <A>hom</A>. This command returns the homomorphism from Q to P induced by <A>hom</A> via <A>epi1</A> and <A>epi2</A>, that is, the homomorphism from Q to P which maps h<C>^<A>epi1</A></C> to <C>(</C>h<C>^<A>hom</A>)^<A>epi2</A></C>, for any element h of H. This generalises <C>InducedAutomorphism</C> to homomorphisms.
#! @Arguments epi1, epi2, hom
DeclareGlobalFunction( "InducedHomomorphism" );

#! @Description
#! Let <A>hom</A> be a group homomorphism from a group H to a group G, and let <A>N</A> be subgroup of H such that its image under <A>hom</A> is a subgroup of <A>M</A>. This command returns the homomorphism from N to M induced by <A>hom</A>. This is similar to <C>RestrictedMapping</C>, but the range is explicitly set to <A>M</A>.
#! @Arguments hom, N, M
DeclareGlobalFunction( "RestrictedHomomorphism" ); 

#! @BeginExample
G := ExamplesOfSomePcpGroups( 5 );;
phi := GroupHomomorphismByImages( G, G, [ G.1, G.2, G.3, G.4 ],
 [ G.1*G.4^-1, G.3, G.2*(G.3*G.4)^2, G.4^-1  ] );;
N := DerivedSubgroup( G );;
p := NaturalHomomorphismByNormalSubgroup( G, N );
#! [ g1, g2, g3, g4, g2^2, g3^2, g4^2 ] -> [ g1, g2, g3, g4, id, id, id ]
ind := InducedHomomorphism( p, p, phi );
#! [ g1, g2, g3 ] -> [ g1*g4, g3, g2 ]
Source( ind ) = Range( p ) and Range( ind ) = Range( p );
#! true
res := RestrictedHomomorphism( phi, N, N );
#! [ g2^2, g3^2, g4^2 ] -> [ g3^2, g2^2*g3^4*g4^8, g4^-2 ]
Source( res ) = N and Range( res ) = N;
#! true
#! @EndExample
