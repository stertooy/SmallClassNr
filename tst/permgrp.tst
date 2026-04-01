gap> START_TEST( "Testing SmallClassNr - permutation group checks" );

#
gap> PermGrps := AllSmallClassNrGroups( [ 1..14 ], IsPermGroup );;

#
gap> ForAll( PermGrps, G -> Size( MinimalGeneratingSet( Group( GeneratorsOfGroup( G ) ) ) ) = Size( GeneratorsOfGroup( G ) ) );
true

#
gap> LoadPackage( "SmallGrp", false: OnlyNeeded );
true
gap> LoadPackage( "TransGrp", false: OnlyNeeded );
true
gap> LoadPackage( "PrimGrp", false: OnlyNeeded );
true
gap> ForAll( PermGrps, G -> NrMovedPoints( G ) = MinimalFaithfulPermutationDegree( G ) );
true

#
gap> STOP_TEST( "pcgrp.tst" );
