This file describes changes in the GAP package SmallClassNr.


1.2.0 (20/09/2024)
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

- Small janitorial changes



1.1.1 (19/04/2023)
------------------

- Removed GAPDoc and AutoDoc as dependencies
- Small janitorial changes



1.1.0 (07/09/2022)
------------------

- Added IteratorSmallClassNrGroups
- More freedom in supplying arguments to AllSmallClassNrGroups and
  OneSmallClassNrGroup



1.0.0 (04/08/2022)
------------------

- Initial release
