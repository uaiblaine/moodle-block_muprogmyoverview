# Change log

Plugin versioning is derived from Moodle releases, it does not comply with the semantic versioning standard.

The format of this change log follows the advice given at [Keep a CHANGELOG](https://keepachangelog.com).

## [Unreleased]

### Fixed

- _block_muprogmyoverview_get_active_programs_ web service failed when _showdescription_ parameter was omitted
- in right-to-left languages the block was hidden and its inner rules (_.content_ and others) reached every page,
  because the nested rules of _styles.css_ did not survive the RTL conversion; the selectors are flat now
