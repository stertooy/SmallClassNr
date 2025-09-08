SetPackageInfo( rec(

PackageName := "SmallClassNr",
Subtitle := "Library of groups with small class number",
Version := "1.3.1",
Date := "09/09/2025",
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
],

AutoDoc := rec(
    TitlePage := rec(
        Abstract := """
            The <B>SmallClassNr</B> package provides access to finite groups
            with small class number. Currently, the package contains the finite
            groups of class number at most 14.
        """,
        Acknowledgements := """
            This documentation was created using the <B>GAPDoc</B> and
            <B>AutoDoc</B> packages.
        """,
        Copyright := """
            &copyright; 2022-2025 Sam Tertooy <P/>
            The <B>SmallClassNr</B> package is free software, it may be
            redistributed and/or modified under the terms and conditions of the
            <URL Text="GNU Public License Version 2">
            https://www.gnu.org/licenses/old-licenses/gpl-2.0.en.html</URL> or
            (at your option) any later version.
        """
    )
)

));
