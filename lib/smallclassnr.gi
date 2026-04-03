###############################################################################
##
## SmallClassNrGroupsAvailable( k )
##
InstallGlobalFunction(
    SmallClassNrGroupsAvailable,
    k -> IsBound( SCN.Data.Gens[k] )
);

###############################################################################
##
## SmallClassNrGroup( k, i )
##
InstallGlobalFunction(
    SmallClassNrGroup,
    function( arg... )
        local k, i, data, size, G;
        if IsList( arg[1] ) then
            k := arg[1][1];
            i := arg[1][2];
        else
            k := arg[1];
            i := arg[2];
        fi;
        SCN.GroupIdAvailable( k, i );
        data := SCN.Data.Gens[k][i];
        size := SCN.Data.Size[k][i];
        if IsInt( data ) then
            G := PcGroupCode( data, size );
            SpecialPcgs( G );
        else
            G := Group( data );
            SetSize( G, size );
            SetNrMovedPoints( G, LargestMovedPoint( G ) );
            SetSmallGeneratingSet( G, GeneratorsOfGroup( G ) );
            SetMinimalGeneratingSet( G, GeneratorsOfGroup( G ) );
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
        local con, kfv, itr;
        con := CallFuncList( SCN.ConditionList, arg );
        kfv := CallFuncList( SCN.ExtractClassNrsAndSizes, con );
        itr := rec(
            kGs := kfv[1],
            sZs := kfv[2],
            fnc := kfv[3],
            vls := kfv[4],
            pos := [ 1, 1 ],
            nxt := fail,
            IsDoneIterator := SCN.IsDoneIterator,
            NextIterator := SCN.NextIterator,
            ShallowCopy := SCN.ShallowCopy
        );
        return IteratorByFunctions( itr );
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
        local con, kfv, n, k, iter;
        con := CallFuncList( SCN.ConditionList, arg );
        kfv := CallFuncList( SCN.ExtractClassNrsAndSizes, con );
        n := 0;
        if IsEmpty( kfv[2] ) and IsEmpty( kfv[3] ) then
            for k in kfv[1] do
                SCN.ClassNrAvailable( k );
                n := n + Length( SCN.Data.Gens[k] );
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
            H := ImagesSource( IsomorphismPcGroup( G ) );
        elif not IsSolvableGroup( G ) and not IsPermGroup( G ) then
            H := ImagesSource( IsomorphismPermGroup( G ) );
        else
            H := G;
        fi;
        return IdClassNr( First(
            grps,
            K -> IsomorphismGroups( H, K ) <> fail
        ));
    end
);
