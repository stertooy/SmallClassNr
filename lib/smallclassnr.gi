###############################################################################
##
## ConditionList@( arg... )
##
ConditionList@ := function( arg... )
    local fnc, vls, i;
    fnc := [];
    vls := [];
    i := 1;
    while i <= Length( arg ) do

        # Add function
        if IsFunction( arg[i] ) then
            Add( fnc, arg[i] );
            i := i+1;
        else
            Add( fnc, NrConjugacyClasses );
        fi;

        # Add matching value
        if not IsBound( arg[i] ) or IsFunction( arg[i] ) then
            Add( vls, [ true ] );
        elif IsList( arg[i] ) then
            Add( vls, arg[i] );
            i := i+1;
        else
            Add( vls, [ arg[i] ] );
            i := i+1;
        fi;

    od;
    
    return [ fnc, vls ];
end;


###############################################################################
##
## ExtractClassNumbers@( fnc, vls )
##
ExtractClassNumbers@ := function( fnc, vls )
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
## NextSmallClassNrGroup@( itr )
##
NextSmallClassNrGroup@ := function( itr )
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
        while j <= NrSmallClassNrGroups( kG ) do
            G := SmallClassNrGroup( kG, j );
            if ForAll(
                [ 1..Length( fnc ) ],
                k -> fnc[k]( G ) in vls[k]
            ) then
                return [ [ i, j+1 ], G ];
            fi;
            j := j + 1;
        od;
        i := i+1;
        j := 1;
    od;
    return [ [ i, j ], fail ];
end;


###############################################################################
##
## NextIterator@( itr )
##
NextIterator@ := function( itr )
    local G;
    if IsBool( itr!.nxt ) then
        itr!.nxt := NextSmallClassNrGroup@( itr );
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
## IsDoneIterator@( itr )
##
IsDoneIterator@ := function( itr )
    local nxt;
    if not IsBool( itr!.nxt ) then
        return IsBool( itr!.nxt[2] );
    fi;
    nxt := NextSmallClassNrGroup@( itr );
    itr!.nxt := nxt;
    if IsBool( nxt[2] ) then
        return true;
    fi;
    return false;
end;


###############################################################################
##
## ShallowCopy@( itr )
##
ShallowCopy@ := function( itr )
    return rec(
        kGs := itr!.kGs,
        fnc := itr!.fnc,
        vls := itr!.vls,
        pos := itr!.pos,
        nxt := itr!.nxt
    );
end;


###############################################################################
##
## SmallClassNrGroupsAvailable( k )
##
InstallGlobalFunction(
    SmallClassNrGroupsAvailable,
    function( k )
        return IsBound( SMALL_CLASS_NR_DATA[k] );
    end
);


###############################################################################
##
## SmallClassNrGroup( k, i )
##
InstallGlobalFunction(
    SmallClassNrGroup,
    function( arg... )
        local k, i, data, G, info, att, val, prop;
        if IsList( arg[1] ) then
            k := arg[1][1];
            i := arg[1][2];
        else
            k := arg[1];
            i := arg[2];
        fi;
        if not SmallClassNrGroupsAvailable( k ) then
            Error(
                "the library of groups of class number ",
                k, " is not available"
            );
        elif not i in [ 1..Length( SMALL_CLASS_NR_DATA[k] ) ] then
            if Length( SMALL_CLASS_NR_DATA[k] ) = 1 then
                Error( "there is just 1 group of class number ", k );
            else
                Error(
                    "there are just ", Length( SMALL_CLASS_NR_DATA[k] ),
                    " groups of class number ", k
                );
            fi;
        fi;
        data := SMALL_CLASS_NR_DATA[k][i];
        if IsInt( data[1] ) then
            G := CallFuncList( PcGroupCode, data );
            SpecialPcgs( G );
        else
            G := Group( data );
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
        local con, kfv, kGs, fnc, vls, itr;
        con := CallFuncList( ConditionList@, arg );
        kfv := CallFuncList( ExtractClassNumbers@, con );
        itr := rec(
            kGs := kfv[1],
            fnc := kfv[2],
            vls := kfv[3],
            pos := [1,1],
            nxt := fail,
            IsDoneIterator := IsDoneIterator@,
            NextIterator := NextIterator@,
            ShallowCopy := ShallowCopy@
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
    function( arg... )
        return List( CallFuncList( IteratorSmallClassNrGroups, arg ) );
    end
);


###############################################################################
##
## OneSmallClassNrGroup( arg... )
##
InstallGlobalFunction(
    OneSmallClassNrGroup,
    function( arg... )
        return NextIterator( CallFuncList( IteratorSmallClassNrGroups, arg ) );
    end
);


###############################################################################
##
## NrSmallClassNrGroups( arg... )
##
InstallGlobalFunction(
    NrSmallClassNrGroups,
    function( arg... )
        local k, n, iter;
        if Length( arg ) = 1 and IsInt( arg[1] ) then
            k := arg[1];
            if not SmallClassNrGroupsAvailable( k ) then
                Error(
                    "the library of groups of class number ",
                    k, " is not available"
                );
            fi;
            n := Length( SMALL_CLASS_NR_DATA[k] );
        else
            n := 0;
            while not IsDoneIterator( iter ) do
                n := n+1;
                NextIterator( iter );
            od;
        fi;
        return n;
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
        return IdClassNr( First( 
            AllSmallClassNrGroups( NrConjugacyClasses( G ), Size, Size( G ) ),
            H -> IsomorphismGroups( G, H ) <> fail )
        );
    end
);
