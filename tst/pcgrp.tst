gap> START_TEST( "Testing SmallClassNr - polycyclic SpecialPcgs checks" );

#
gap> PcGrps := AllSmallClassNrGroups( [ 1..14 ], IsPcGroup );;
gap> ForAll( PcGrps, G -> IsSpecialPcgs( Pcgs( G ) ) );
true

#
gap> STOP_TEST( "pcgrp.tst" );
