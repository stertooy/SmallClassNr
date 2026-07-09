###############################################################################
##
## SmallClassNrGroupsAvailable( k )
##
InstallGlobalFunction(
    SmallClassNrGroupsAvailable,
    k -> IsBound( SCN.Data.Size[ k ] )
);

###############################################################################
##
## LoadIncompleteSmallClassNrGroups()
##
InstallGlobalFunction(
    LoadIncompleteSmallClassNrGroups,
    function()
        ReadPackage( "SmallClassNr", "data/incomplete/read.g" );
    end
);

###############################################################################
##
## SmallClassNrGroup( k, i )
##
InstallGlobalFunction(
    SmallClassNrGroup,
    function( arg... )
        local k, i, size, code, gens, G;
        k := Flat( arg )[ 1 ];
        i := Flat( arg )[ 2 ];
        SCN.GroupIdAvailable( k, i );
        size := SCN.Data.Size[ k ][ i ];
        if (
            ValueOption( "AsPermGroup" ) <> true and
            IsBound( SCN.Data.Code[ k ][ i ] )
        ) then
            code := SCN.Data.Code[ k ][ i ];
            G := PcGroupCode( code, size );
            SpecialPcgs( G );
        else
            gens := SCN.Data.Gens[ k ][ i ];
            G := Group( gens, () );
            SetSize( G, size );
            SetSmallGeneratingSet( G, gens );
            SetMinimalGeneratingSet( G, gens );
            SetNrMovedPoints( G, LargestMovedPoint( G ) );
        fi;
        SetNrConjugacyClasses( G, k );
        SetIdClassNr( G, [ k, i ] );
        return G;
    end
);

###############################################################################
##
## IdClassNr( G )
##
SCN.IsMaybeIsom := function( G, H )
    if AbelianInvariants( G ) <> AbelianInvariants( H ) then
        return false;
    fi;
    if AbelianInvariants( Center( G ) ) <>
        AbelianInvariants( Center( H ) ) then
        return false;
    fi;
    if Collected( List( ConjugacyClasses( G ),
        C -> [ Order( Representative( C ) ), Size( C ) ] ) ) <>
       Collected( List( ConjugacyClasses( H ),
        C -> [ Order( Representative( C ) ), Size( C ) ] ) ) then
        return false;
    fi;
    return true;
end;


InstallMethod(
    IdClassNr,
    "generic method",
    [ IsGroup ],
    function( G )
        local kG, size, filt, H, K, i, j, L, grps;
        kG := NrConjugacyClasses( G );
        SCN.ClassNrAvailable( kG );
        size := Size( G );
        filt := Filtered(
            [ 1 .. NrSmallClassNrGroups( kG ) ],
            i -> SCN.Data.Size[ kG ][ i ] = size
        );
        if Length( filt ) = 1 then
            return [ kG, filt[ 1 ] ];
        fi;
        if ID_AVAILABLE( size ) <> fail then
            return [ kG, First( filt,
            i -> SCN.Data.IdGroup[ kG ][ i ] = IdGroup( G )[ 2 ] ) ];
        fi;
        
        grps := List( filt, i -> SmallClassNrGroup( kG, i ) );
        grps := Filtered( grps, H -> SCN.IsMaybeIsom( G, H ) );
        if Length( grps ) = 1 then
            return IdClassNr( grps[1] );
        fi;
        L := Remove( grps );
        for K in grps do
            if IsomorphismGroups( H, K ) <> fail then
                return IdClassNr( K );
            fi;
        od;
        return IdClassNr( L );
    end
);
