# Change log

Plugin versioning is derived from Moodle releases, it does not comply with the semantic versioning standard.

The format of this change log follows the advice given at [Keep a CHANGELOG](https://keepachangelog.com).

## [Unreleased]

### Added

- Block can be added to Dashboard
- New setting _Add "My programs" menu_ controlling the primary navigation item, it is disabled on new installations and enabled during upgrade
- Czech translation and AI-produced previews of German, French, Italian, Portuguese and Spanish translations

### Changed

- Programs plugin is required, the block is not required by the Programs plugin any more

### Fixed

- _block_muprogmyoverview_get_active_programs_ web service failed when _showdescription_ parameter was omitted
- in right-to-left languages the block was hidden and its inner rules (_.content_ and others) reached every page,
  because the nested rules of _styles.css_ did not survive the RTL conversion; the selectors are flat now
