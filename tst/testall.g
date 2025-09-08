LoadPackage( "SmallClassNr" );

pass := TestDirectory(
    DirectoriesPackageLibrary( "SmallClassNr", "tst" ),
    rec(
        exitGAP := false,
        showProgress := true,
        testOptions := rec( compareFunction := "uptowhitespace" )
    )
);

FORCE_QUIT_GAP( pass );
