gap> START_TEST( "Testing SmallClassNr - TransGrp checks" );

#
gap> LoadPackage( "TransGrp", false: OnlyNeeded );
true
gap> max := First( PositiveIntegers, x -> not SmallClassNrGroupsAvailable( x ) ) - 1;;
gap> ForAll( [ 1 .. max ], k -> ForAll( [ 1 .. NrSmallClassNrGroups( k ) ], i -> 
>      IdClassNrToTransGrp( k, i ) = fail or
>      IdClassNr( CallFuncList( TransitiveGroup, IdClassNrToIdGroup( k, i ) ) ) = [ k, i ] ) );
true

#
gap> STOP_TEST( "transgrp.tst" );
