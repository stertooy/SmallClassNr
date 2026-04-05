###############################################################################
##
## IdClassNrToIdGroup( k, i )
##
InstallGlobalFunction(
    IdClassNrToIdGroup,
    { arg... } -> SCN.IdClassNrToOtherId( arg, "Size", "IdGroup" )
);

###############################################################################
##
## IdClassNrToPerfGrp( k, i )
##
InstallGlobalFunction(
    IdClassNrToPerfGrp,
    { arg... } -> SCN.IdClassNrToOtherId( arg, "Size", "PerfGrp" )
);

###############################################################################
##
## IdClassNrToPrimGrp( k, i )
##
InstallGlobalFunction(
    IdClassNrToPrimGrp,
    { arg... } -> SCN.IdClassNrToOtherId( arg, "PrimGrp" )
);

###############################################################################
##
## IdClassNrToTransGrp( k, i )
##
InstallGlobalFunction(
    IdClassNrToTransGrp,
    { arg... } -> SCN.IdClassNrToOtherId( arg, "TransGrp" )
);

###############################################################################
##
## IdClassNrToAtlasName( k, i )
##
InstallGlobalFunction(
    IdClassNrToAtlasName,
    { arg... } -> SCN.IdClassNrToOtherId( arg, "AtlasName" )
);
