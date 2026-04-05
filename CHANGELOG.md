# CHANGELOG - GAP package SmallClassNr

## 1.5.0 (2026-04-04)

### Added
- Added functionality to convert `IdClassNr` to id's used by other group
  libraries:
  * The Small Groups Library (provided by the SmallGrp package).
  * The Library of Finite Perfect Groups.
  * The Primitive Permutation Groups Library (provided by the PrimGrp package).
  * The Library of Transitive Groups (provided by the TransGrp package).
  * The ATLAS of Group Representations (provided by the AtlasRep package).
- Precomputed group sizes are now stored for all groups in the library, and are
  used to more efficiently determine `IdClassNr` for a given group.

### Changed
- Improvemed the documentation.
- Expanded the test suite.
- Renamed `CHANGES.md` to `CHANGELOG.md`.
- Janitorial changes.

## 1.4.3 (2025-11-13)

### Changed
- Improved references in the documentation.

### Fixed
- Fixed faulty URLs in the documentation.

## 1.4.2 (2025-10-11)

### Changed
- Updated license text to latest version (by @jamesjer).
- Updated installation instructions in manual.
- Janitorial changes.

## 1.4.1 (2025-09-13)

### Changed
- Package tests no longer require the PrimGrp, SmallGrp and TransGrp packages.
- Janitorial changes.

## 1.4.0 (2025-09-09)

### Changed
- Now requires GAP version >= 4.14.
- Improved manual.
- Janitorial changes.

## 1.3.0 (2024-12-26)

### Added
- Added missing group with 14 conjugacy classes of order 104 (reported by
  Thomas Breuer).
- `NrSmallClassNrGroups` can now take extra parameters, like the functions
  `OneSmallClassNrGroup` and `AllSmallClassNrGroups`.

### Changed
- Janitorial changes.

## 1.2.2 (2024-12-05)

### Changed
- Small janitorial changes.

## 1.2.1 (2024-11-27)

### Changed
- Small janitorial changes.

## 1.2.0 (2024-09-21)

### Added
- Added `IdClassNr` attribute.
- `SmallClassNrGroup` now accepts a pair `[ k, i ]` as input in addition to `k`
  and `i` as separate parameters.
- For groups created using `SmallClassNrGroup`:
  * The `NrConjugacyClasses` and `IdClassNr` attributes will automatically be
    set.
  * PcGroups now explicitly have their Pcgs recognised as a SpecialPcgs.
  * PermGroups now automatically have their generating set recognised as both a
    `SmallGeneratingSet` and a `MinimalGeneratingSet`.
  * The size of PermGroups is no longer automatically set.

### Changed
- Dropped support for GAP versions < 4.11.
- Manual slightly expanded.
- Small janitorial changes.

## 1.1.1 (2023-04-19)

### Changed
- Removed GAPDoc and AutoDoc as dependencies.
- Small janitorial changes.

## 1.1.0 (2022-09-07)

### Added
- Added `IteratorSmallClassNrGroups`.
- More freedom in supplying arguments to `AllSmallClassNrGroups` and
  `OneSmallClassNrGroup`.

## 1.0.0 (2022-08-04)

### Added
- Initial release.
