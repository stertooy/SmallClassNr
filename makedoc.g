Read( "PackageInfo.g" );
info := GAPInfo.PackageInfoCurrent;
pkgName := info.PackageName;

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
    autodoc := rec( scan_dirs := [ "doc" ] ),
    gapdoc := rec(
        LaTeXOptions := rec( LateExtraPreamble := "\\usepackage{amsmath}" )
    ),
    extract_examples := rec( units := "File" )
));

if not ForAll(
    [ "doc/manual.six", "doc/manual.pdf", "doc/chap0.html" ],
    IsReadableFile
) then
    Info( InfoGAPDoc, 1, "#I One or more files could not be created.\n" );
    ForceQuitGap( 1 );
else
    Info( InfoGAPDoc, 1, "#I Manual files sucessfully created.\n" );
fi;

tstFile := Concatenation(
    "tst/",
    ReplacedString( LowercaseString( pkgName ), " ", "_" ),
    "01.tst"
);

if IsReadableFile( tstFile ) then
    Info( InfoGAPDoc, 1, "#I Testing examples found in manual.\n" );
    correct := Test( tstFile, rec( compareFunction := "uptowhitespace" ) );
    RemoveFile( tstFile );
    if correct then
        Info( InfoGAPDoc, 1, "#I All examples are correct.\n" );
    else
        Info( InfoGAPDoc, 1, "#I One or more examples are incorrect.\n" );
        ForceQuitGap( 1 );
    fi;
else
    Info( InfoGAPDoc, 1, "#I No examples found in manual.\n" );
fi;

Info( InfoGAPDoc, 1, "#I Documentation successfully created.\n" );
QuitGap( 0 );
