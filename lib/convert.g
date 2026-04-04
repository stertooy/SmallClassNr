###############################################################################
##
## IdClassNrToOtherId( old_id, arg... )
##
SCN.IdClassNrToIdGroup := function( old_id, arg... )
    local new_id, name;
    SCN.GroupIdAvailable( k, i );
    new_id := [];
    for name in arg do
        if not IsBound( SCN.Data.(name)[ k ][ i ] ) then
            return fail;
        fi;
        Add( id, SCN.Data.(name)[ k ][ i ] );
    od;
    if Length( new_id ) = 1 then
        new_id := First( new_id );
    fi;
    return new_id;
end;
