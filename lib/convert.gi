###############################################################################
##
## IdClassNrToIdGroup( k, i )
##
InstallGlobalFunction(
    IdClassNrToIdGroup,
    function( arg... )
        local k, i;
        k := Flat( arg )[ 1 ];
        i := Flat( arg )[ 2 ];
        SCN.GroupIdAvailable( k, i );
        if not IsBound( SCN.Data.IdGroup[ k ][ i ] ) then
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
        k := Flat( arg )[ 1 ];
        i := Flat( arg )[ 2 ];
        SCN.GroupIdAvailable( k, i );
        if not IsBound( SCN.Data.PrimGrp[ k ][ i ] ) then
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
        k := Flat( arg )[ 1 ];
        i := Flat( arg )[ 2 ];
        SCN.GroupIdAvailable( k, i );
        if not IsBound( SCN.Data.TransGrp[ k ][ i ] ) then
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
        k := Flat( arg )[ 1 ];
        i := Flat( arg )[ 2 ];
        SCN.GroupIdAvailable( k, i );
        if not IsBound( SCN.Data.AtlasName[ k ][ i ] ) then
            return fail;
        fi;
        return SCN.Data.AtlasName[ k ][ i ];
    end
);
