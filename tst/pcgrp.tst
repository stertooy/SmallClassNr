gap> START_TEST( "Testing SmallClassNr - polycyclic SpecialPcgs checks" );

#
gap> max := First( PositiveIntegers, x -> not SmallClassNrGroupsAvailable( x ) ) - 1;;
gap> PcGrps := AllSmallClassNrGroups( [ 1 .. max ], IsSolvable );;
gap> ForAll( PcGrps, IsPcGroup );
true
gap> ForAll( PcGrps, G -> IsSpecialPcgs( Pcgs( G ) ) );
true

#
gap> STOP_TEST( "pcgrp.tst" );
