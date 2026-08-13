###############################################################################
##
## IdClassNr( G )
##
InstallMethod(
    IdClassNr,
    "generic method",
    [ IsGroup ],
    function( G )
        local kG, size, ids, id;
        kG := NrConjugacyClasses( G );
        SCN.ClassNrAvailable( kG );

        size := Size( G );
        ids := Positions( SCN.Data.Size[ kG ], size );
        if Length( ids ) = 1 then
            return [ kG, ids[ 1 ] ];
        fi;

        id := LookupDictionary( SCN.IdClassNr.Select, [ kG, size ] );
        return [ kG, id( G ) ];
    end
);
