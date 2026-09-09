gap> START_TEST( "Testing SmallClassNr - PcGroup checks" );

#
gap> max := First( PositiveIntegers, x -> not SmallClassNrGroupsAvailable( x ) ) - 1;;
gap> grps := AllSmallClassNrGroups( [ 1 .. max ], IsSolvableGroup );;
gap> copy := List( grps, G -> PcGroupCode( CodePcGroup( G ), Size( G ) ) );;
gap> n := Length( copy );;
gap> check := func -> ForAll( [ 1 .. n ], i -> func( grps[ i ] ) = func( copy[ i ] ) );;

#
gap> check( IdClassNr );
true

#
gap> ForAll( grps, IsPcGroup );
true
gap> ForAll( grps, G -> IsSpecialPcgs( Pcgs( G ) ) );
true

#
gap> STOP_TEST( "pcgrp.tst" );
