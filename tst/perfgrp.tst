gap> START_TEST( "Testing SmallClassNr - PerfGrp checks" );

#
gap> max := First( PositiveIntegers, x -> not SmallClassNrGroupsAvailable( x ) ) - 1;;
gap> ForAll( [ 1 .. max ], k -> ForAll( [ 1 .. NrSmallClassNrGroups( k ) ], i -> 
>      IdClassNrToPerfGrp( k, i ) = fail or
>      IdClassNr( CallFuncList( PerfectGroup, IdClassNrToPerfGrp( k, i ) ) ) = [ k, i ] ) );
true

#
gap> STOP_TEST( "perfgrp.tst" );
