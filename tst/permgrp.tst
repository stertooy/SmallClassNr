gap> START_TEST( "Testing SmallClassNr - permutation group checks" );

#
gap> max := First( PositiveIntegers, x -> not SmallClassNrGroupsAvailable( x ) ) - 1;;
gap> grps := AllSmallClassNrGroups( [ 1 .. max ] : AsPermGroup );;
gap> copy := List( grps, G -> Group( GeneratorsOfGroup( G ) ) );;
gap> n := Length( copy );;
gap> check := func -> ForAll( [ 1 .. n ], i -> func( grps[ i ] ) = func( copy[ i ] ) );;

#
gap> check( Size );
true
gap> check( NrMovedPoints );
true
gap> check( G -> Size( MinimalGeneratingSet( G ) ) );
true

#
gap> LoadPackage( "SmallGrp", false: OnlyNeeded );
true
gap> LoadPackage( "TransGrp", false: OnlyNeeded );
true
gap> LoadPackage( "PrimGrp", false: OnlyNeeded );
true
gap> ForAll( grps, G -> NrMovedPoints( G ) = MinimalFaithfulPermutationDegree( G ) );
true

#
gap> STOP_TEST( "permgrp.tst" );
