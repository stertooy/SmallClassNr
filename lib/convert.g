###############################################################################
##
## IdClassNrToOtherId( k, i, arg... )
##
SCN.IdClassNrToIdGroup := function( k, i, arg... )
    local id, name;
    SCN.GroupIdAvailable( k, i );
    id := [];
    for name in arg do
        if not IsBound( SCN.Data.(name)[ k ][ i ] ) then
            return fail;
        fi;
        Add( id, SCN.Data.(name)[ k ][ i ] );
    od;
    if Length( id ) = 1 then
        id := First( id );
    fi;
    return id;
end;
