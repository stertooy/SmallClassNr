SetPackageInfo( rec(

PackageName := "SmallClassNr",
Subtitle := "Library of finite groups with small class number",
Version := "1.6.1",
Date := "01/10/2026",
License := "GPL-2.0-or-later",

Persons := [
    rec(
        IsAuthor := true,
        IsMaintainer := true,
        FirstNames := "Sam",
        LastName := "Tertooy",
        GitHubUsername := "stertooy",
        WWWHome := "https://stertooy.github.io/",
        Email := "sam.tertooy@kuleuven.be",
        PostalAddress := """
            Wiskunde
            KU Leuven, Kulak Kortrijk Campus
            Etienne Sabbelaan 53
            8500 Kortrijk
            Belgium
        """,
        Place := "Kortrijk, Belgium",
        Institution := "KU Leuven, Kulak Kortrijk Campus"
    ),
],

SourceRepository := rec(
    Type := "git",
    URL := Concatenation(
        "https://github.com/",
        ~.Persons[1].GitHubUsername,
        "/",
        ~.PackageName
    )
),
SupportEmail := ~.Persons[1].Email,

IssueTrackerURL := Concatenation( ~.SourceRepository.URL, "/issues" ),
PackageWWWHome  := Concatenation( ~.Persons[1].WWWHome, ~.PackageName ),
PackageInfoURL  := Concatenation( ~.PackageWWWHome, "/PackageInfo.g" ),
README_URL      := Concatenation( ~.PackageWWWHome, "/README.md" ),
ArchiveURL      := Concatenation(
    ~.SourceRepository.URL,
    "/releases/download/v", ~.Version,
    "/", ~.PackageName, "-", ~.Version
),

ArchiveFormats := ".tar.gz",

AbstractHTML := """
    The SmallClassNr package provides access to finite groups with small class
    number. Currently, the package contains all finite groups of class number
    at most 14, and most finite groups with class numbers 15 to 20.
""",

PackageDoc := rec(
    BookName  := ~.PackageName,
    ArchiveURLSubset := ["doc"],
    HTMLStart := "doc/chap0_mj.html",
    PDFFile   := "doc/manual.pdf",
    SixFile   := "doc/manual.six",
    LongTitle := ~.Subtitle
),

Dependencies := rec(
    GAP := ">= 4.14",
    NeededOtherPackages := [],
    SuggestedOtherPackages := [ [ "smallgrp", "1.5.4" ] ],
    TestPackages := [
        [ "primgrp",  "3.4.4" ],
        [ "transgrp", "3.6.5" ],
        [ "atlasrep", "2.1.9" ],
    ]
),

TestFile := "tst/testall.g",

));
