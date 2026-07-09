LoadPackage( "SmallClassNr" );

pass := TestDirectory(
    DirectoriesPackageLibrary( "SmallClassNr", "tst" ),
    rec(
        exitGAP := false,
        showProgress := true,
        testOptions := rec( compareFunction := "uptowhitespace" )
    )
);

ForceQuitGap( pass );
