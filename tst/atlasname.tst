gap> START_TEST( "Testing SmallClassNr - AtlasName checks" );

#
gap> LoadPackage( "AtlasRep", false: OnlyNeeded );
true
gap> max := First( PositiveIntegers, x -> not SmallClassNrGroupsAvailable( x ) ) - 1;;
gap> ForAll( [ 1 .. max ], k -> ForAll( [ 1 .. NrSmallClassNrGroups( k ) ], i -> 
>      IdClassNrToAtlasName( k, i ) = fail or
>      IdClassNr( AtlasGroup( IdClassNrToAtlasName( k, i ) ) ) = [ k, i ] ) );
true

#
gap> STOP_TEST( "atlasname.tst" );
