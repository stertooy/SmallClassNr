###############################################################################
##
## IdClassNrToOtherId( idname, arg... )
##
SCN.IdClassNrToIdGroup := function( idname, arg... )
    local k, i;
    k := Flat( arg )[ 1 ];
    i := Flat( arg )[ 2 ];
    SCN.GroupIdAvailable( k, i );
    if not IsBound( SCN.Data.(idname)[ k ][ i ] ) then
        return fail;
    fi;
    return SCN.Data.(idname)[ k ][ i ];
end;
