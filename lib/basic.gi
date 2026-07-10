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
InstallMethod(
    IdClassNr,
    "generic method",
    [ IsGroup ],
    function( G )
        local kG, cand, tests, i, test, grps, n, val, next, H;
        kG := NrConjugacyClasses( G );
        SCN.ClassNrAvailable( kG );

        cand := [ 1 .. NrSmallClassNrGroups( kG ) ];
        tests := [
            i -> Size( G ) = SCN.Data.Size[ kG ][ i ],
            i -> Length( GeneratorsOfGroup( G ) ) >=
                 Length( SCN.Data.Gens[ kG ][ i ] ),
            i -> not IsPermGroup( G ) or NrMovedPoints( G ) >=
                 NrMovedPoints( SCN.Data.Gens[ kG ][ i ] )
        ];
        for test in tests do
            cand := Filtered( cand, test );
            if Length( cand ) = 1 then
                return [ kG, cand[ 1 ] ];
            fi;
        od;

        if ID_AVAILABLE( Size( G ) ) <> fail then
            return [ kG, First( cand,
                i -> SCN.Data.IdGroup[ kG ][ i ] = IdGroup( G )[ 2 ]
            ) ];
        fi;

        grps := List( cand, i -> SmallClassNrGroup( kG, i ) );
        tests := [
            AbelianInvariants,
            SCN.ConjFingerPrint
        ];
        for test in tests do
            val := test( G );
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
            if i = n or IsomorphismGroups( G, H ) <> fail then
                return IdClassNr( H );
            fi;
        od;
    end
);
