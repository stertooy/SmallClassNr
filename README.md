[![Build Status](https://github.com/sTertooy/SmallClassNr/workflows/CI/badge.svg?branch=master)](https://github.com/sTertooy/SmallClassNr/actions?query=workflow%3ACI+branch%3Amaster)
[![Code Coverage](https://codecov.io/gh/sTertooy/SmallClassNr/branch/master/graph/badge.svg)](https://codecov.io/gh/sTertooy/SmallClassNr)

The GAP 4 package SmallClassNr
====================================

by Sam Tertooy <sam.tertooy@kuleuven.be>



About
------------

The SmallClassNr package provides access to all groups with small class number.
Currently, the package contains the groups of class number <= 14. The groups of
class number <= 12 were classified by A. Vera López and J. Vera López, while
the groups of class number 13 and 14 were classified by A. Vera López and J.
Sangroniz.

This package requires GAP version 4.9 or later, with the following packages
(and their dependencies) installed:
- GAPDoc ( version >= 1.6.1 )



Installation
------------

Either place the folder in the pkg subdirectory of your gap folder, or in any
other folder where you have write permission. You can verify if GAP recognizes
the SmallClassNr package using the following command:

    gap> LoadPackage("SmallClassNr");
	─────────────────────────────────────────────────────────────────────────────
	Loading  SmallClassNr 1.0.0 (Library of groups with small class number)
	by Sam Tertooy (https://stertooy.github.io/).
	Homepage: https://sTertooy.github.io/SmallClassNr/
	Report issues at https://github.com/sTertooy/SmallClassNr/issues
	─────────────────────────────────────────────────────────────────────────────
	true

The manual may be compiled by running the 'makedoc.g' script, located in the
package's main directory.  It is also available on the webpages of this
package, at <https://stertooy.github.io/SmallClassNr/doc/chap0.html>



Support
-------

Please report any problems you may encounter using SmallClassNr at
<https://github.com/sTertooy/SmallClassNr>



License
-------

The SmallClassNr package is licensed under the GNU General Public License
v2.0 or later. A copy of this license is included.
