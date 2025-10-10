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
        if IsFunction( arg[i] ) then
            Add( fnc, arg[i] );
            i := i + 1;
        else
            Add( fnc, NrConjugacyClasses );
        fi;

        # Add matching value
        if not IsBound( arg[i] ) or IsFunction( arg[i] ) then
            Add( vls, [ true ] );
        elif IsList( arg[i] ) then
            Add( vls, arg[i] );
            i := i + 1;
        else
            Add( vls, [ arg[i] ] );
            i := i + 1;
        fi;

    od;

    return [ fnc, vls ];
end;

###############################################################################
##
## ExtractClassNumbers( fnc, vls )
##
SCN.ExtractClassNumbers := function( fnc, vls )
    local pos, kGs;
    pos := Position( fnc, NrConjugacyClasses );
    kGs := PositiveIntegers;
    while pos <> fail do
        Remove( fnc, pos );
        kGs := Intersection( kGs, Remove( vls, pos ) );
        pos := Position( fnc, NrConjugacyClasses );
    od;
    return [ kGs, fnc, vls ];
end;

###############################################################################
##
## NextSmallClassNrGroup( itr )
##
SCN.NextSmallClassNrGroup := function( itr )
    local kGs, fnc, vls, pos, i, j, kG, G;
    kGs := itr!.kGs;
    fnc := itr!.fnc;
    vls := itr!.vls;
    pos := itr!.pos;
    i := pos[1];
    j := pos[2];
    while i <= Length( kGs ) do
        kG := kGs[i];
        if not SmallClassNrGroupsAvailable( kG ) then
            Error(
                "the library of groups of class number ",
                kG, " is not available"
            );
        fi;
        while j <= Length( SCN.DATA[kG] ) do
            G := SmallClassNrGroup( kG, j );
            j := j + 1;
            if ForAll(
                [ 1 .. Length( fnc ) ],
                k -> fnc[k]( G ) in vls[k]
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
    itr!.pos := itr!.nxt[1];
    G := itr!.nxt[2];
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
        return IsBool( itr!.nxt[2] );
    fi;
    nxt := SCN.NextSmallClassNrGroup( itr );
    itr!.nxt := nxt;
    if IsBool( nxt[2] ) then
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
    fnc := itr!.fnc,
    vls := itr!.vls,
    pos := itr!.pos,
    nxt := itr!.nxt
);
