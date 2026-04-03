gap> START_TEST( "Testing SmallClassNr - IdGroup checks" );

#
gap> LoadPackage( "SmallGrp", false: OnlyNeeded );
true
gap> max := First( PositiveIntegers, x -> not SmallClassNrGroupsAvailable( x ) ) - 1;;
gap> ForAll( [ 1 .. max ], k -> ForAll( [ 1 .. NrSmallClassNrGroups( k ) ], i -> 
>      IdClassNrToIdGroup( k, i ) = fail or
>      IdClassNr( SmallGroup( IdClassNrToIdGroup( k, i ) ) ) = [ k, i ] ) );
true

#
gap> STOP_TEST( "idgroup.tst" );
