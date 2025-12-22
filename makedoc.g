Read( "PackageInfo.g" );
info := GAPInfo.PackageInfoCurrent;
pkgName := info.PackageName;
pkgsToLoad := [
    [ pkgName, info.Version ],
    [ "GAPDoc", "1.6.7" ],
    [ "Autodoc", "2025.12.19" ]
];
if IsBound( info.Dependencies ) then
    deps := info.Dependencies;
    if IsBound( deps.NeededOtherPackages ) then
        need := deps.NeededOtherPackages;
        for pkg in need do
            Append( pkgsToLoad, pkg );
        od;
    fi;
    if IsBound( deps.SuggestedOtherPackages ) then
        sugg := deps.SuggestedOtherPackages;
        for pkg in sugg do
            Append( pkgsToLoad, pkg );
        od;
    fi;
fi;
if IsBound( info.Extensions ) then
    for ext in info.Extensions do
        Append( pkgsToLoad, ext.needed );
    od;
fi;
err := false;
for pkgToLoad in pkgsToLoad do
    pkg := pkgToLoad[1];
    ver := pkgToLoad[2];
    if LoadPackage( pkg:OnlyNeeded, ver, false ) = fail then
        err := true;
        Info( InfoGAPDoc, 1, 
            "#I Could not load '", pkg,"' with version >= ", ver, ".\n"
        );
    else
        Info( InfoGAPDoc, 1,
            "#I Loaded '", pkg, "' with version >= ", ver, ".\n"
        );
    fi;
od;
if err then ForceQuitGap( 1 ); fi;

AutoDoc( rec(
    scaffold := rec(
        bib := "manual.bib",
        entities := rec(
            AutoDoc := "<Package>AutoDoc</Package>",
            PackageManager := "<Package>PackageManager</Package>",
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
    autodoc := rec( files := [ "doc/manual.gd" ] ),
    gapdoc := rec(
        LaTeXOptions := rec( LateExtraPreamble := "\\usepackage{amsmath}" )
    ),
    extract_examples := rec( units := "File" )
));

if not IsReadableFile( "doc/manual.six" ) then
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
