###############################################################################
##
## LoadIncompleteSmallClassNrGroups()
##
InstallGlobalFunction(
    LoadIncompleteSmallClassNrGroups,
    function()
        ReadPackage( "SmallClassNr", "data/incomplete/read.g" );
    end
);
