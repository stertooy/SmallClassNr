###############################################################################
##
## IdClassNrToIdGroup( k, i )
##
InstallGlobalFunction(
    IdClassNrToIdGroup,
    { arg... } -> SCN.IdClassNrToIdGroup( "IdGroup", arg )
);

###############################################################################
##
## IdClassNrToPrimGrp( k, i )
##
InstallGlobalFunction(
    IdClassNrToPrimGrp,
    { arg... } -> SCN.IdClassNrToIdGroup( "PrimGrp", arg )
);

###############################################################################
##
## IdClassNrToTransGrp( k, i )
##
InstallGlobalFunction(
    IdClassNrToTransGrp,
    { arg... } -> SCN.IdClassNrToIdGroup( "TransGrp", arg )
);

###############################################################################
##
## IdClassNrToAtlasName( k, i )
##
InstallGlobalFunction(
    IdClassNrToAtlasName,
    { arg... } -> SCN.IdClassNrToIdGroup( "AtlasName", arg )
);
