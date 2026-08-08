###############################################################################
##
## ClassNrAvailable( k )
##
SCN.ClassNrAvailable := function( k )
    if not SmallClassNrGroupsAvailable( k ) then
        Error(
            "the library of groups of class number ",
            k, " is not available"
        );
    fi;
end;

###############################################################################
##
## GroupIdAvailable( k, i )
##
SCN.GroupIdAvailable := function( k, i )
    local len;
    SCN.ClassNrAvailable( k );
    len := Length( SCN.Data.Size[ k ] );
    if not i in [ 1 .. len ] then
        if len = 1 then
            Error( "there is just 1 group of class number ", k );
        else
            Error( "there are just ", len, " groups of class number ", k );
        fi;
    fi;
end;

###############################################################################
##
## FingerPrints1( G, kG, i )
##
SCN.FingerPrints1 := [];

Add( SCN.FingerPrints1, { G, kG, i } ->
    Size( G ) = SCN.Data.Size[ kG ][ i ]
);

Add( SCN.FingerPrints1, { G, kG, i } ->
    Length( GeneratorsOfGroup( G ) ) >= Length( SCN.Data.Gens[ kG ][ i ] );
);

Add( SCN.FingerPrints1, function( G, kG, i )
    if IsPermGroup( G ) then
        return NrMovedPoints( G ) >= NrMovedPoints( SCN.Data.Gens[ kG ][ i ] );
    fi;
    return true;
end );

###############################################################################
##
## FingerPrints2( G )
##
SCN.FingerPrints2 := [];

Add( SCN.FingerPrints2, G -> List(
    DerivedSeries( G ),
    AbelianInvariants
) );

Add( SCN.FingerPrints2, G -> Collected( List(
    ConjugacyClasses( G ),
    C -> [ Order( Representative( C ) ), Size( C ) ]
) ) );
