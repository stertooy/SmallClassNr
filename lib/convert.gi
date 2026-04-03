###############################################################################
##
## IdClassNrToIdGroup( k, i )
##
InstallGlobalFunction(
    IdClassNrToIdGroup,
    function( arg... )
        local k, i;
        if IsList( arg[ 1 ] ) then
            k := arg[ 1 ][ 1 ];
            i := arg[ 1 ][ 2 ];
        else
            k := arg[ 1 ];
            i := arg[ 2 ];
        fi;
        SCN.GroupIdAvailable( k, i );
        if not IsBound( SCN.Data.IdGroup[ k ][ i ] then
            return fail;
        fi;
        return SCN.Data.IdGroup[ k ][ i ];
    end
);

###############################################################################
##
## IdClassNrToPrimGrp( k, i )
##
InstallGlobalFunction(
    IdClassNrToPrimGrp,
    function( arg... )
        local k, i;
        if IsList( arg[ 1 ] ) then
            k := arg[ 1 ][ 1 ];
            i := arg[ 1 ][ 2 ];
        else
            k := arg[ 1 ];
            i := arg[ 2 ];
        fi;
        SCN.GroupIdAvailable( k, i );
        if not IsBound( SCN.Data.PrimGrp[ k ][ i ] then
            return fail;
        fi;
        return SCN.Data.PrimGrp[ k ][ i ];
    end
);

###############################################################################
##
## IdClassNrToTransGrp( k, i )
##
InstallGlobalFunction(
    IdClassNrToTransGrp,
    function( arg... )
        local k, i;
        if IsList( arg[ 1 ] ) then
            k := arg[ 1 ][ 1 ];
            i := arg[ 1 ][ 2 ];
        else
            k := arg[ 1 ];
            i := arg[ 2 ];
        fi;
        SCN.GroupIdAvailable( k, i );
        if not IsBound( SCN.Data.TransGrp[ k ][ i ] then
            return fail;
        fi;
        return SCN.Data.TransGrp[ k ][ i ];
    end
);

###############################################################################
##
## IdClassNrToAtlasName( k, i )
##
InstallGlobalFunction(
    IdClassNrToAtlasName,
    function( arg... )
        local k, i;
        if IsList( arg[ 1 ] ) then
            k := arg[ 1 ][ 1 ];
            i := arg[ 1 ][ 2 ];
        else
            k := arg[ 1 ];
            i := arg[ 2 ];
        fi;
        SCN.GroupIdAvailable( k, i );
        if not IsBound( SCN.Data.AtlasName[ k ][ i ] then
            return fail;
        fi;
        return SCN.Data.AtlasName[ k ][ i ];
    end
);
