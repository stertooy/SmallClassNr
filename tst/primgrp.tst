gap> START_TEST( "Testing SmallClassNr - PrimGrp checks" );

#
gap> LoadPackage( "PrimGrp", false: OnlyNeeded );
true
gap> max := First( PositiveIntegers, x -> not SmallClassNrGroupsAvailable( x ) ) - 1;;
gap> ForAll( [ 1 .. max ], k -> ForAll( [ 1 .. NrSmallClassNrGroups( k ) ], i -> 
>      IdClassNrToPrimGrp( k, i ) = fail or
>      IdClassNr( CallFuncList( PrimitiveGroup, IdClassNrToPrimGrp( k, i ) ) ) = [ k, i ] ) );
true

#
gap> STOP_TEST( "primgrp.tst" );
