###############################################################################
##
## LoadUnverifiedSmallClassNrGroups()
##
InstallGlobalFunction(
    LoadUnverifiedSmallClassNrGroups,
    function()
        ReadPackage( "SmallClassNr", "data/unverified/read.g" );
    end
);
