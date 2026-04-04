###############################################################################
##
## SmallClassNrGroupsAvailable( k )
##
InstallGlobalFunction(
    SmallClassNrGroupsAvailable,
    k -> IsBound( SCN.Data.Gens[ k ] )
);

###############################################################################
##
## SmallClassNrGroup( k, i )
##
InstallGlobalFunction(
    SmallClassNrGroup,
    function( arg... )
        local k, i, gens, size, G;
        k := Flat( arg )[ 1 ];
        i := Flat( arg )[ 2 ];
        SCN.GroupIdAvailable( k, i );
        gens := SCN.Data.Gens[ k ][ i ];
        size := SCN.Data.Size[ k ][ i ];
        if IsInt( gens ) then
            G := PcGroupCode( gens, size );
            SpecialPcgs( G );
        else
            G := Group( gens );
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
## IteratorSmallClassNrGroups( arg... )
##
InstallGlobalFunction(
    IteratorSmallClassNrGroups,
    function( arg... )
        local ksfv, iter;
        ksfv := CallFuncList( SCN.ExtractClassNrsAndSizes, arg );
        iter := rec(
            kGs := ksfv[ 1 ],
            sZs := ksfv[ 2 ],
            fnc := ksfv[ 3 ],
            vls := ksfv[ 4 ],
            pos := [ 1, 1 ],
            nxt := fail,
            IsDoneIterator := SCN.IsDoneIterator,
            NextIterator := SCN.NextIterator,
            ShallowCopy := SCN.ShallowCopy
        );
        return IteratorByFunctions( iter );
    end
);

###############################################################################
##
## AllSmallClassNrGroups( arg... )
##
InstallGlobalFunction(
    AllSmallClassNrGroups,
    { arg... } -> List( CallFuncList( IteratorSmallClassNrGroups, arg ) )
);

###############################################################################
##
## OneSmallClassNrGroup( arg... )
##
InstallGlobalFunction(
    OneSmallClassNrGroup,
    { arg... } -> NextIterator(
        CallFuncList( IteratorSmallClassNrGroups, arg )
    )
);

###############################################################################
##
## NrSmallClassNrGroups( arg... )
##
InstallGlobalFunction(
    NrSmallClassNrGroups,
    function( arg... )
        local ksfv, n, k, size, iter;
        ksfv := CallFuncList( SCN.ExtractClassNrsAndSizes, arg );
        n := 0;
        if IsEmpty( ksfv[ 3 ] ) then
            for k in ksfv[ 1 ] do
                SCN.ClassNrAvailable( k );
                size := SCN.Data.Size[ k ];
                if IsList( ksfv[ 2 ] ) then
                    n := n + Number( size, x -> x in ksfv[2] );
                else
                    n := n + Length( size );
                fi;
            od;
        else
            iter := CallFuncList( IteratorSmallClassNrGroups, arg );
            while not IsDoneIterator( iter ) do
                n := n + 1;
                NextIterator( iter );
            od;
        fi;
        return n;
    end
);

###############################################################################
##
## IdClassNr( G )
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
            Size,               Size( G )
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
