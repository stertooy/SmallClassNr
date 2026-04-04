###############################################################################
##
## ConditionList( arg... )
##
SCN.ConditionList := function( arg... )
    local fnc, vls, i;
    fnc := [];
    vls := [];
    i := 1;
    while i <= Length( arg ) do

        # Add function
        if IsFunction( arg[ i ] ) then
            Add( fnc, arg[ i ] );
            i := i + 1;
        else
            Add( fnc, NrConjugacyClasses );
        fi;

        # Add matching value
        if not IsBound( arg[ i ] ) or IsFunction( arg[ i ] ) then
            Add( vls, [ true ] );
        elif IsList( arg[ i ] ) then
            Add( vls, arg[ i ] );
            i := i + 1;
        else
            Add( vls, [ arg[ i ] ] );
            i := i + 1;
        fi;

    od;

    return [ fnc, vls ];
end;

###############################################################################
##
## ExtractClassNrsAndSizes( arg... )
##
SCN.ExtractClassNrsAndSizes := function( arg... )
    local con, fnc, vls, pos, kGs, sZs;
    con := CallFuncList( SCN.ConditionList, arg );
    fnc := con[ 1 ];
    vls := con[ 2 ];
    pos := Position( fnc, NrConjugacyClasses );
    kGs := PositiveIntegers;
    while pos <> fail do
        Remove( fnc, pos );
        kGs := Intersection( kGs, Remove( vls, pos ) );
        pos := Position( fnc, NrConjugacyClasses );
    od;
    pos := Position( fnc, Size );
    sZs := PositiveIntegers;
    while pos <> fail do
        Remove( fnc, pos );
        sZs := Intersection( sZs, Remove( vls, pos ) );
        pos := Position( fnc, Size );
    od;
    return [ kGs, sZs, fnc, vls ];
end;

###############################################################################
##
## NextSmallClassNrGroup( itr )
##
SCN.NextSmallClassNrGroup := function( itr )
    local kGs, sZs, fnc, vls, pos, i, j, kG, G;
    kGs := itr!.kGs;
    sZs := itr!.sZs;
    fnc := itr!.fnc;
    vls := itr!.vls;
    pos := itr!.pos;
    i := pos[ 1 ];
    j := pos[ 2 ];
    while i <= Length( kGs ) do
        kG := kGs[i];
        SCN.ClassNrAvailable( kG );
        while j <= Length( SCN.Data.Size[ kG ] ) do
            j := j + 1;
            if not SCN.Data.Size[ kG ][ j - 1 ] in sZs then
                continue;
            fi;
            G := SmallClassNrGroup( kG, j - 1 );
            if ForAll(
                [ 1 .. Length( fnc ) ],
                k -> fnc[ k ]( G ) in vls[ k ]
            ) then
                return [ [ i, j ], G ];
            fi;
        od;
        i := i + 1;
        j := 1;
    od;
    return [ [ i, j ], fail ];
end;

###############################################################################
##
## NextIterator( itr )
##
SCN.NextIterator := function( itr )
    local G;
    if IsBool( itr!.nxt ) then
        itr!.nxt := SCN.NextSmallClassNrGroup( itr );
    fi;
    itr!.pos := itr!.nxt[ 1 ];
    G := itr!.nxt[ 2 ];
    if not IsBool( G ) then
        itr!.nxt := fail;
    fi;
    return G;
end;

###############################################################################
##
## IsDoneIterator( itr )
##
SCN.IsDoneIterator := function( itr )
    local nxt;
    if not IsBool( itr!.nxt ) then
        return IsBool( itr!.nxt[ 2 ] );
    fi;
    nxt := SCN.NextSmallClassNrGroup( itr );
    itr!.nxt := nxt;
    if IsBool( nxt[ 2 ] ) then
        return true;
    fi;
    return false;
end;

###############################################################################
##
## ShallowCopy( itr )
##
SCN.ShallowCopy := itr -> rec(
    kGs := itr!.kGs,
    sZs := itr!.sZs,
    fnc := itr!.fnc,
    vls := itr!.vls,
    pos := itr!.pos,
    nxt := itr!.nxt
);
