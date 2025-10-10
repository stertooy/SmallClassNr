###############################################################################
##
## SmallClassNrGroupsAvailable( k )
##
BindGlobal(
    "SmallClassNrGroupsAvailable",
    k -> IsBound( SCN.DATA[k] )
);

###############################################################################
##
## SmallClassNrGroup( k, i )
##
BindGlobal(
    "SmallClassNrGroup",
    function( arg... )
        local k, i, data, G;
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
        elif not i in [ 1 .. Length( SCN.DATA[k] ) ] then
            if Length( SCN.DATA[k] ) = 1 then
                Error( "there is just 1 group of class number ", k );
            else
                Error(
                    "there are just ", Length( SCN.DATA[k] ),
                    " groups of class number ", k
                );
            fi;
        fi;
        data := SCN.DATA[k][i];
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
BindGlobal(
    "IteratorSmallClassNrGroups",
    function( arg... )
        local con, kfv, itr;
        con := CallFuncList( SCN.ConditionList, arg );
        kfv := CallFuncList( SCN.ExtractClassNumbers, con );
        itr := rec(
            kGs := kfv[1],
            fnc := kfv[2],
            vls := kfv[3],
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
BindGlobal(
    "AllSmallClassNrGroups",
    function( arg... )
        return List( CallFuncList( IteratorSmallClassNrGroups, arg ) );
    end
);

###############################################################################
##
## OneSmallClassNrGroup( arg... )
##
BindGlobal(
    "OneSmallClassNrGroup",
    function( arg... )
        return NextIterator( CallFuncList( IteratorSmallClassNrGroups, arg ) );
    end
);

###############################################################################
##
## NrSmallClassNrGroups( arg... )
##
BindGlobal(
    "NrSmallClassNrGroups",
    function( arg... )
        local con, kfv, n, k, iter;
        con := CallFuncList( SCN.ConditionList, arg );
        kfv := CallFuncList( SCN.ExtractClassNumbers, con );
        n := 0;
        if IsEmpty( kfv[2] ) then
            for k in kfv[1] do
                if not SmallClassNrGroupsAvailable( k ) then
                    Error(
                        "the library of groups of class number ",
                        k, " is not available"
                    );
                fi;
                n := n + Length( SCN.DATA[k] );
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
        return IdClassNr( First(
            AllSmallClassNrGroups( NrConjugacyClasses( G ), Size, Size( G ) ),
            H -> IsomorphismGroups( G, H ) <> fail
        ));
    end
);
