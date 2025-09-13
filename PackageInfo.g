SetPackageInfo( rec(

PackageName := "SmallClassNr",
Subtitle := "Library of finite groups with small class number",
Version := "1.4.1",
Date := "13/09/2025",
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

AbstractHTML := "Library of finite groups with small class number.",

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
    SuggestedOtherPackages := []
),

TestFile := "tst/testall.g",

Keywords := [
    "conjugacy",
    "conjugacy class",
    "class number"
]

));
