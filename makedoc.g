pkgName := "SmallClassNr";

tst := DirectoriesPackageLibrary( pkgName, "tst" )[1];
info := PackageInfo( pkgName )[1];

if (
    LoadPackage( pkgName, false ) = fail or
    LoadPackage( "AutoDoc", false ) = fail
) then
    Info( InfoGAPDoc, 1, "#I Could not load required package(s).\n" );
    ForceQuitGap( 1 );
fi;

if IsBound( info.Extensions ) then
    for ext in info.Extensions do
        for pkgver in ext.needed do
            LoadPackage( pkgver[1], pkgver[2], false );
        od;
    od;
fi;

AutoDoc( rec(
    autodoc := rec(
        files := [ "doc/manual.gd" ]
    ),
    scaffold := rec(
        bib := "manual.bib"
    ),
    gapdoc := rec(
        main := "manual.xml",
        LaTeXOptions := rec(
            LateExtraPreamble := "\\usepackage{amsmath}"
        )
    ),
    extract_examples := rec(
        units := "Chapter"
    )
));

if not ValidatePackageInfo( "PackageInfo.g" ) then
    Info( InfoGAPDoc, 1, "#I One or more files could not be created.\n" );
    ForceQuitGap( 1 );
else
    Info( InfoGAPDoc, 1, "#I Manual files sucessfully created.\n" );
fi;

correct := true;
Info( InfoGAPDoc, 1, "#I Testing examples found in manual.\n" );

lpkgName := LowercaseString( pkgName );
lpkgName := ReplacedString( lpkgName, " ", "_" );

for file in AsSortedList( DirectoryContents( tst ) ) do
    if (
        StartsWith( file, lpkgName ) and
        EndsWith( file, ".tst" ) and
        Length( file ) - Length( lpkgName ) >= 6 and
        ForAll( file{[1 + Length( lpkgName ) .. Length( file ) - 4]}, IsDigitChar )
    ) then
        Info( InfoGAPDoc, 1, Concatenation( "#I  Now testing file ", file, "\n" ) );
        correct := correct and Test(
            Filename( tst, file ),
            rec( compareFunction := "uptowhitespace" )
        );
        RemoveFile( Filename( tst, file ) );
    fi;
od;

if not correct then
    Info( InfoGAPDoc, 1, "#I One or more examples are incorrect.\n" );
    ForceQuitGap( 1 );
else
    Info( InfoGAPDoc, 1, "#I All tests passed - manual should be correct.\n" );
fi;

Info( InfoGAPDoc, 1, "#I Documentation successfully created.\n" );
QuitGap( 0 );
