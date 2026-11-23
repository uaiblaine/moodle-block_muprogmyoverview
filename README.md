# My programs overview block for Moodle™ LMS

[![MDL Shield](https://img.shields.io/endpoint?url=https%3A%2F%2Fmdlshield.com%2Fapi%2Fbadge%2Fblock_muprogmyoverview)](https://mdlshield.com/plugins/block_muprogmyoverview) ![Moodle Plugin CI](https://github.com/mutms/moodle-block_muprogmyoverview/actions/workflows/moodle-ci.yml/badge.svg) [![camp](https://camp-registry.org/badge/block_muprogmyoverview.svg)](https://camp-registry.org/plugin/block_muprogmyoverview.html)

Optional block for the [Programs plugin](https://github.com/mutms/moodle-tool_muprog)
— fully open source under GPL 3.0. Part of the [MuTMS suite](https://github.com/mutms).

Provides a My programs overview block — a programs equivalent of the standard Moodle
"Course overview" block. The block can be added to:

* Dashboard
* custom home pages provided by the [Custom home pages plugin](https://github.com/mutms/moodle-tool_muhome)

The block is displayed only to users allocated to at least one program.

Optionally a dedicated "My programs" page can be added to the main menu for all users
allocated to programs, see the _Add "My programs" menu_ block setting. The setting is disabled
on new installations and it is kept enabled on sites upgraded from older versions.

## Requirements

> This plugin is included in the [MuTMS distribution](https://github.com/mutms/mutms) —
> no manual installation needed if you use the distribution.

Required plugins:

* [Additional tools library plugin](https://github.com/mutms/moodle-tool_mulib)
* [Programs plugin](https://github.com/mutms/moodle-tool_muprog)

## Documentation

See [online documentation](https://docs.mutms.org/muprog/) for more information.

## AI disclosure

Parts of this plugin were written with the help of Claude (Anthropic). A human
maintainer reviewed, corrected and accepted everything before it was committed.
The design decisions and the final code are the maintainer's own.

---

> This plugin is based on the standard Moodle "Course overview" block (block_myoverview) and the former "My courses"
> main menu entry, it replicates the same experience for MuTMS Programs.
> MuTMS is an independent open-source project, not affiliated with Moodle HQ.
