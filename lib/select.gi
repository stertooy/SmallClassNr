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
