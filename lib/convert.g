###############################################################################
##
## IdClassNrToOtherId( idname, id )
##
SCN.IdClassNrToIdGroup := function( idname, id )
    local k, i;
    k := Flat( id )[ 1 ];
    i := Flat( id )[ 2 ];
    SCN.GroupIdAvailable( k, i );
    if not IsBound( SCN.Data.(idname)[ k ][ i ] ) then
        return fail;
    fi;
    return SCN.Data.(idname)[ k ][ i ];
end;
