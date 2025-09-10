This file describes changes in the GAP package SmallClassNr.


1.4.1 (2025-09-13)
------------------

- Package tests no longer require the PrimGrp, SmallGrp and TransGrp packages
- Janitorial changes



1.4.0 (2025-09-09)
------------------

- Now requires GAP version >= 4.14
- Improved manual
- Janitorial changes



1.3.0 (2024-12-26)
------------------

- Added missing group with 14 conjugacy classes of order 104 (reported by
  Thomas Breuer)
- NrSmallClassNrGroups can now take extra parameters, like the functions
  OneSmallClassNrGroup and AllSmallClassNrGroups
- Janitorial changes



1.2.2 (2024-12-05)
------------------

- Small janitorial changes



1.2.1 (2024-11-27)
------------------

- Small janitorial changes



1.2.0 (2024-09-21)
------------------

- Added IdClassNr attribute
- SmallClassNrGroup now accepts a pair [ k, i ] as input in addition to k and i
  as separate parameters

- For groups created using SmallClassNrGroup:
  * The NrConjugacyClasses and IdClassNr attributes will automatically be set
  * PcGroups now explicitly have their Pcgs recognised as a SpecialPcgs
  * PermGroups now automatically have their generating set recognised as both a
    SmallGeneratingSet and a MinimalGeneratingSet
  * The size of PermGroups is no longer automatically set

- Dropped support for GAP versions < 4.11
- Manual slightly expanded
- Small janitorial changes



1.1.1 (2023-04-19)
------------------

- Removed GAPDoc and AutoDoc as dependencies
- Small janitorial changes



1.1.0 (2022-09-07)
------------------

- Added IteratorSmallClassNrGroups
- More freedom in supplying arguments to AllSmallClassNrGroups and
  OneSmallClassNrGroup



1.0.0 (2022-08-04)
------------------

- Initial release
