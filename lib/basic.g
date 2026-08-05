###############################################################################
##
## ClassAvailable( k )
##
SCN.ClassNrAvailable := function( k )
    if not SmallClassNrGroupsAvailable( k ) then
        Error(
            "the library of groups of class number ",
            k, " is not available"
        );
    fi;
end;

###############################################################################
##
## GroupIdAvailable( k, i )
##
SCN.GroupIdAvailable := function( k, i )
    local len;
    SCN.ClassNrAvailable( k );
    len := Length( SCN.Data.Size[ k ] );
    if not i in [ 1 .. len ] then
        if len = 1 then
            Error( "there is just 1 group of class number ", k );
        else
            Error( "there are just ", len, " groups of class number ", k );
        fi;
    fi;
end;

###############################################################################
##
## FingerPrint( G )
##
SCN.FingerPrint := rec();

###############################################################################
##
## FingerPrint.DerInvs( G )
##
SCN.FingerPrint.DerInvs := G -> List(
    DerivedSeries( G ),
    AbelianInvariants
);

###############################################################################
##
## FingerPrint.ConjCls( G )
##
SCN.FingerPrint.ConjCls := G -> Collected( List(
    ConjugacyClasses( G ),
    C -> [ Order( Representative( C ) ), Size( C ) ]
) );

###############################################################################
##
## FingerPrint.Fitting( G )
##
SCN.FingerPrint.Fitting := function( G )
    local F;
    F := FittingSubgroup( G );
    if ID_AVAILABLE( Size( F ) ) <> fail then
        return IdGroup( F );
    fi;
    return fail;
end;
