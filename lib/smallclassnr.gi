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
## NrSmallClassNrGroups( k )
##
InstallGlobalFunction(
    NrSmallClassNrGroups,
    function( k )
        if not SmallClassNrGroupsAvailable( k ) then
            Error(
                "the library of groups of class number ",
                k, " is not available"
            );
        fi;
        return Length( SMALL_CLASS_NR_DATA[k] );
    end
);


###############################################################################
##
## SmallClassNrGroup( k, i )
##
InstallGlobalFunction(
    SmallClassNrGroup,
    function( k, i )
        local data, G;
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
        if IsInt( data[2] ) then
            G := PcGroupCode( data[2], data[1] );
        else
            G := Group( data[2] );
            SetSize( G, data[1] );
        fi;
        return G;
    end
);


###############################################################################
##
## SelectSmallClassNrGroups( L, onlyOne, arg... )
##
InstallGlobalFunction(
    SelectSmallClassNrGroups,
    function( L, onlyOne, arg... )
        local kGs, fnc, vls, grp, kG, i, G;
        
        kGs := [];
        fnc := [];
        vls := [];
        grp := [];
        
        if IsList( L ) then
            Append( kGs, L );
        else
            Add( kGs, L );
        fi;
        for kG in kGs do
            if not SmallClassNrGroupsAvailable( kG ) then
                Error(
                    "the library of groups of class number ",
                    kG, " is not available"
                );
            fi;
        od;
        
        for i in [ 1..Length( arg ) ] do
            if IsFunction( arg[i] ) then
                if Length( fnc ) > Length( vls ) then
                    Add( vls, [ true ] );
                fi;
                Add( fnc, arg[i] );
            elif Length( fnc ) > Length( vls ) and IsList( arg[i] ) then
                Add( vls, arg[i] );
            elif Length( fnc ) > Length( vls ) then
                Add( vls, [ arg[i] ] );
            fi;
        od;
        if Length( fnc ) > Length( vls ) then
            Add( vls, [ true ] );
        fi;
        
        for kG in kGs do
            for i in [ 1..NrSmallClassNrGroups( kG ) ] do
                G := SmallClassNrGroup( kG, i );
                if ForAll(
                    [ 1..Length( fnc ) ],
                    j -> fnc[j]( G ) in vls[j]
                ) then
                    if onlyOne then
                        return G;
                    fi;
                    Add( grp, G );
                fi;
            od;
        od;
        if onlyOne then
            return fail;
        fi;
        return grp;
    end
);


###############################################################################
##
## AllSmallClassNrGroups( L, arg1... )
##
InstallGlobalFunction(
    AllSmallClassNrGroups,
    function( L, arg1... )
        local arg2;
        arg2 := [ L, false ];
        Append( arg2, arg1 );
        return CallFuncList( SelectSmallClassNrGroups, arg2 );
    end
);


###############################################################################
##
## AllSmallClassNrGroups( L, arg1... )
##
InstallGlobalFunction(
    OneSmallClassNrGroup,
    function( L, arg1... )
        local arg2;
        arg2 := [ L, true ];
        Append( arg2, arg1 );
        return CallFuncList( SelectSmallClassNrGroups, arg2 );
    end
);
