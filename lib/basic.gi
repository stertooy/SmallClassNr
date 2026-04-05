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
InstallMethod(
    IdClassNr,
    "generic method",
    [ IsGroup ],
    function( G )
        local kG, grps, H;
        kG := NrConjugacyClasses( G );
        SCN.ClassNrAvailable( kG );
        grps := AllSmallClassNrGroups(
            NrConjugacyClasses, kG,
            Size, Size( G )
        );
        if Length( grps ) = 1 then
            return IdClassNr( First( grps ) );
        fi;
        if IsSolvableGroup( G ) and not IsPcGroup( G ) then
            H := Range( IsomorphismPcGroup( G ) );
        elif not IsSolvableGroup( G ) and not IsPermGroup( G ) then
            H := Range( IsomorphismPermGroup( G ) );
        else
            H := G;
        fi;
        return IdClassNr( First(
            grps,
            K -> IsomorphismGroups( H, K ) <> fail
        ));
    end
);
