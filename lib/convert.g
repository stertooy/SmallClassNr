###############################################################################
##
## IdClassNrToOtherId( old_id, arg... )
##
SCN.IdClassNrToOtherId := function( old_id, arg... )
    local k, i, new_id, name;
    k := old_id[ 1 ];
    i := old_id[ 2 ];
    SCN.GroupIdAvailable( k, i );
    new_id := [];
    for name in arg do
        if not IsBound( SCN.Data.(name)[ k ][ i ] ) then
            return fail;
        fi;
        Add( new_id, SCN.Data.(name)[ k ][ i ] );
    od;
    if Length( new_id ) = 1 then
        new_id := First( new_id );
    fi;
    return new_id;
end;
