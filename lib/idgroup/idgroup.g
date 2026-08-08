Add( SCN.FingerPrints2, function( G )
    local F;
    F := FittingSubgroup( G );
    if IdGroupsAvailable( Size( F ) ) then
        return IdGroup( F );
    fi;
    return fail;
end );

Add( SCN.FingersPrints1, function( G, kG, i )
    if IdGroupsAvailable( Size( G ) ) then
        return SCN.Data.IdGroup[ kG ][ i ] = IdGroup( G )[ 2 ];
    fi;
    return true;
end );
