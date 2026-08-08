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
        local kG, cand, i, test, grps, n, val, next, H, K;
        kG := NrConjugacyClasses( G );
        SCN.ClassNrAvailable( kG );

        cand := [ 1 .. NrSmallClassNrGroups( kG ) ];
        for test in SCN.FingerPrints1 do
            cand := Filtered( cand, test );
            if Length( cand ) = 1 then
                return [ kG, cand[ 1 ] ];
            fi;
        od;

        if IsBound( SCN.ReduceViaIdGroup ) then
            cand := SCN.ReduceViaIdGroup( G, kG, cand );
        fi;

        if not IsSolvableGroup( G ) and not IsPermGroup( G ) then
            K := Image( IsomorphismPermGroup( G ) );
        elif IsSolvableGroup( G ) and not IsPcGroup( G ) then
            K := Image( IsomorphismPcGroup( G ) );
        else
            K := G;
        fi;

        if IsPermGroup( K ) then
            grps := List( cand, i -> SmallClassNrGroup( kG, i : AsPermGroup) );
        else
            grps := List( cand, i -> SmallClassNrGroup( kG, i ) );
        fi;

        for test in SCN.FingerPrints2 do
            val := test( K );
            n := Length( grps );
            next := [];
            for i in [ 1 .. n ] do
                H := grps[ i ];
                if i = n and IsEmpty( next ) then
                    return IdClassNr( H );
                elif val = test( H ) then
                    Add( next, H );
                fi;
            od;
            grps := next;
        od;

        n := Length( grps );
        for i in [ 1 .. n ] do
            H := grps[ i ];
            if i = n or IsomorphismGroups( K, H ) <> fail then
                return IdClassNr( H );
            fi;
        od;
    end
);
