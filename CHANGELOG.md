Digger Changelog
================

Digger v2.3 (2015-06-14)
------------------------

 * Add `bisectBuild` bisect config option
 * Add `--with` and `--without` switches to control D components to build
 * Add `website` component for building dlang.org (POSIX-only)
 * Work around `appender` memory corruption bug with `git` cache engine
 * Various fixes

Digger v2.2 (2015-06-05)
------------------------

 * Fix `digger install` to work with `object.d`
 * Improve resilience of `digger install`
 * Add `--bootstrap` switch to build compiler entirely from C++ source
 * Replace usage of `git bisect run` with internal implementation
   * Bisection now prefers cached builds when choosing a commit to test
 * Allow customizing the set of components to build during bisection
 * Use git plumbing in git cache driver for concurrency and better performance
 * Don't cache build failures if the error is likely temporary

Digger v2.1 (2015-05-03)
------------------------

 * Add [license](LICENSE.md)
 * Add `git` cache engine
 * Add `cache` action and subcommands
 * Fix starting `digger-web` in OS X
   (auto-correct working directory)

Digger v2.0 (2015-04-26)
------------------------

 * `idgen.d` update (DMD now requires DMD to build)
 * Full core overhaul, for improved performance, granularity and extensibility.
   A fresh install is recommended.

Digger v1.1 (2015-03-04)
------------------------

 * Add `rebuild` action, for incremental rebuilds
   (thanks to Sergei Nosov)
 * Add `install` and `uninstall` actions
 * Add `--help` text
 * Add `--make-args` option
 * Add `--model` option to replace the `--64` switch
 * Add `--host` and `--port` to `digger-web`
 * Various smaller improvements

Digger v1.0 (2014-09-18)
------------------------

 * On Windows, Digger may now download and locally install (unpack) required 
   software, as needed:
   - Git
   - A number of Visual Studio 2013 Express and Windows SDK components (for 
     64-bit builds)
   - 7-Zip and WiX (necessary for unpacking Visual Studio Express components)
 * Various smaller improvements

Digger v0.3 (2014-05-22) [DConf edition]
----------------------------------------

 * Allow merging arbitrary GitHub forks
 * Add `--offline`, which suppresses updating the D repositories.
 * Move digger-web tasks to digger, thus removing D building logic from 
   digger-web binary
 * Improve revision parsing, allowing e.g. `digger build 2.065 @ 3 weeks ago`
 * Rename `digger-web` directory to `web`, to avoid conflict with POSIX binary 
   of `digger-web.d`
 * Fix web UI behavior when refreshing
 * Fix exit status code propagation
 * Various smaller improvements

Digger v0.2 (2014-04-01) [April Fools' edition]
-----------------------------------------------

 * Add `digger-web`
 * Fix parsing Environment configuration section
 * Various smaller improvements

Digger v0.1 (2014-02-17) [Initial release]
------------------------------------------

 * Initial announcement

