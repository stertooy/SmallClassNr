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
