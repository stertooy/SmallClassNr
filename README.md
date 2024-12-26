[![Build Status](https://github.com/sTertooy/SmallClassNr/actions/workflows/CI.yml/badge.svg)](https://github.com/stertooy/SmallClassNr/actions/workflows/CI.yml?query=branch%3Amain)
[![Code Coverage](https://codecov.io/gh/stertooy/SmallClassNr/branch/main/graph/badge.svg)](https://codecov.io/gh/stertooy/SmallClassNr)
[![License](https://img.shields.io/badge/license-GPLv2%2B-blue.svg)](https://www.gnu.org/licenses/old-licenses/gpl-2.0.en.html)
[![Manual](https://img.shields.io/badge/docs-html-blue)](https://stertooy.github.io/SmallClassNr/doc/chap0_mj.html)
[![Release](https://img.shields.io/github/release/stertooy/smallclassnr.svg)](https://github.com/stertooy/smallclassnr/releases)
[![DOI](https://img.shields.io/badge/DOI-10/nvzr-blue)](https://doi.org/10/nvzr)

The GAP 4 package SmallClassNr
====================================

by Sam Tertooy <sam.tertooy@kuleuven.be>



About
------------

The SmallClassNr package provides access to finite groups with small class
number. Currently, the package contains the finite groups of class number at
most 14.

This package requires GAP version 4.11 or later.



Installation
------------

Either place the folder in the pkg subdirectory of your gap folder, or in any
other folder where you have write permission. You can verify if GAP recognizes
the SmallClassNr package using the following command:

    gap> LoadPackage("SmallClassNr");
    ─────────────────────────────────────────────────────────────────────────────
    Loading  SmallClassNr 1.3.0 (Library of groups with small class number)
    by Sam Tertooy (https://stertooy.github.io/).
    Homepage: https://stertooy.github.io/SmallClassNr/
    Report issues at https://github.com/stertooy/SmallClassNr/issues
    ─────────────────────────────────────────────────────────────────────────────
    true

The manual may be compiled by running the 'makedoc.g' script, located in the
package's main directory.  It is also available on the webpages of this
package, at <https://stertooy.github.io/SmallClassNr/doc/chap0_mj.html>



Support
-------

Please report any problems you may encounter using SmallClassNr at
<https://github.com/stertooy/SmallClassNr>



License
-------

The SmallClassNr package is licensed under the GNU General Public License
v2.0 or later. A copy of this license is included.
