###############################################################################
##
## SmallClassNrGroupsAvailable( n )
##
InstallGlobalFunction(
    SmallClassNrGroupsAvailable,
    function( n )
        return IsBound( SMALL_CLASS_NR_DATA[n] );
    end
);


###############################################################################
##
## NrSmallClassNrGroups( n )
##
InstallGlobalFunction(
    NrSmallClassNrGroups,
    function( n )
        if not SmallClassNrGroupsAvailable( n ) then
            return fail;
        fi;
        return Length( SMALL_CLASS_NR_DATA[n] );
    end
);


###############################################################################
##
## SmallClassNrGroup( k, n )
##
InstallGlobalFunction(
    SmallClassNrGroup,
    function( k, n )
        local data, G;
        if not ( 
            SmallClassNrGroupsAvailable( k ) and
            n in [ 1..Length( SMALL_CLASS_NR_DATA[k] ) ]
        ) then
            return fail;
        fi;
        data := SMALL_CLASS_NR_DATA[k][n];
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
        local kGs, fnc, vls, grp, i, kG, G;
        
        kGs := [];
        fnc := [];
        vls := [];
        grp := [];
        
        if IsList( L ) then
            Append( kGs, L );
        else
            Add( kGs, L );
        fi;
        if not ForAll( kGs, SmallClassNrGroupsAvailable ) then
            return fail;
        fi;
        
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
