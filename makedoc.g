Read( "PackageInfo.g" );
info := GAPInfo.PackageInfoCurrent;
pkgName := info.PackageName;
pkgsToLoad := [
    [ "GAPDoc", "1.6.7" ],
    [ "Autodoc", "2026.03.17" ],
    [ pkgName, info.Version ],
    [ "SmallGrp", "1.5.4" ],
    [ "PrimGrp", "3.4.4" ],
    [ "TransGrp", "3.6.5" ],
    [ "AtlasRep", "2.1.9" ],
];
if IsBound( info.Extensions ) then
    for ext in info.Extensions do
        Append( pkgsToLoad, ext.needed );
    od;
fi;
err := false;
Print( "#I Loading packages\n" );
for pkgToLoad in pkgsToLoad do
    pkg := pkgToLoad[1];
    ver := pkgToLoad[2];
    if LoadPackage( pkg, ver, false: OnlyNeeded ) = fail then
        Print( "#W  Could not load '", pkg, "' with version >= ", ver, ".\n" );
        err := true;
    else
        Print( "#I  Loaded '", pkg, "' with version >= ", ver, ".\n" );
    fi;
od;
if err then QuitGap( 1 ); fi;

tstDir := DirectoryTemporary();

Print( "#I Creating documentation with AutoDoc\n" );
AutoDoc( rec(
    scaffold := rec(
        bib := "bibliography.bib",
        bibstyle := "alphaurl",
        entities := rec(
            AutoDoc := "<Package>AutoDoc</Package>",
            PackageManager := "<Package>PackageManager</Package>",
            SmallGrp := "<Package>SmallGrp</Package>",
            PrimGrp := "<Package>PrimGrp</Package>",
            TransGrp := "<Package>TransGrp</Package>",
            AtlasRep := "<Package>AtlasRep</Package>",
            BibLaTeX := "Bib&LaTeX;",
            PackageName := pkgName,
            PACKAGENAME := Concatenation(
                "<Package>",
                pkgName,
                "</Package>"
            ),
            ABBREV := "SCN",
            AUTHOR := Concatenation(
                info.Persons[1].FirstNames, " ", info.Persons[1].LastName
            ),
            AUTHORREVERSED := Concatenation(
                info.Persons[1].LastName, ", ", info.Persons[1].FirstNames
            ),
            ARCHIVEURL := info.ArchiveURL,
            ISSUEURL := info.IssueTrackerURL,
            HOMEURL := info.PackageWWWHome,
            SUPPORTEMAIL := info.SupportEmail,
            SUBTITLE := info.Subtitle
        )
    ),
    autodoc := rec( scan_dirs := [ "doc", "lib", "examples" ] ),
    gapdoc := rec(
        LaTeXOptions := rec( LateExtraPreamble := "\\usepackage{amsmath}" )
    ),
    extract_examples := rec( units := "Chapter", subdir := tstDir )
));

if not IsReadableFile( "doc/manual.six" ) then
    Print( "#W One or more files could not be created.\n" );
    QuitGap( 1 );
else
    Print( "#I Manual files sucessfully created.\n" );
fi;

Print( "#I Testing extracted examples.\n" );
testOpts := rec(
    exitGAP := false,
    showProgress := true,
    testOptions := rec( compareFunction := "uptowhitespace" )
);
correct := TestDirectory( tstDir, testOpts );

if correct then
    Print( "#I All examples are correct.\n" );
else
    Print( "#W One or more examples are incorrect.\n" );
    QuitGap( 1 );
fi;

Print( "#I Documentation successfully created.\n" );
QuitGap( 0 );
