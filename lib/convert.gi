###############################################################################
##
## IdClassNrToIdGroup( k, i )
##
InstallGlobalFunction(
    IdClassNrToIdGroup,
    { arg... } -> SCN.IdClassNrToOtherId( Flat( arg ), "Size", "IdGroup" )
);

###############################################################################
##
## IdClassNrToPerfGrp( k, i )
##
InstallGlobalFunction(
    IdClassNrToPerfGroup,
    { arg... } -> SCN.IdClassNrToOtherId( Flat( arg ), "Size", "PerfGrp" )
);

###############################################################################
##
## IdClassNrToPrimGrp( k, i )
##
InstallGlobalFunction(
    IdClassNrToPrimGrp,
    { arg... } -> SCN.IdClassNrToOtherId( Flat( arg ), "PrimGrp" )
);

###############################################################################
##
## IdClassNrToTransGrp( k, i )
##
InstallGlobalFunction(
    IdClassNrToTransGrp,
    { arg... } -> SCN.IdClassNrToOtherId( Flat( arg ), "TransGrp" )
);

###############################################################################
##
## IdClassNrToAtlasName( k, i )
##
InstallGlobalFunction(
    IdClassNrToAtlasName,
    { arg... } -> SCN.IdClassNrToOtherId( Flat( arg ), "AtlasName" )
);
