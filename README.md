# compiz-reloaded-overlay

## Info

Repoman status: [![Build Status](https://travis-ci.org/ethus3h/compiz-reloaded-overlay.svg?branch=master)](https://travis-ci.org/ethus3h/compiz-reloaded-overlay)

This overlay provides ebuilds for Compiz-Reloaded. The instructions below document how to add and use this overlay with Portage. (If you prefer to use the overlay differently than below, feel free.)

### Upgrade note, 18 April 2020: Version 0.8.16 to 0.8.18

When upgrading from version 0.8.16 to 0.8.18, if both compiz-plugins-extra and compiz-plugins-experimental are installed, it's necessary to upgrade compiz-plugins-experimental first of the two, because the workspacenames plugin was moved from -experimental to -extra. Otherwise, the files would conflict because both packages would try to install them.

### How to add the overlay

#### Adding using Layman

To add this overlay to Portage using `layman`, run `layman -o https://github.com/ethus3h/compiz-reloaded-overlay/raw/master/compiz-reloaded.xml -f -a compiz-reloaded`. To update the repository, run `layman -s compiz-reloaded` (or `layman -S` to update all the installed overlays managed by Layman).

#### Adding using repos.conf

To add this overlay to Portage in `repos.conf`, here is example configuration for it:

```
[compiz-reloaded]
priority = 50
location = /var/lib/layman/compiz-reloaded
sync-type = git
sync-uri = https://github.com/ethus3h/compiz-reloaded-overlay.git
auto-sync = yes
clone-depth = 0
```

See the Gentoo wiki page at https://wiki.gentoo.org/wiki//etc/portage/repos.conf for how to use this. If `auto-sync` is set to `yes`, as it is in this example, the repository should be automatically updated when you update your system.

#### Adding using eselect-repository (not tested)

To add this overlay to Portage using `eselect-repository`, run `eselect repository add compiz-reloaded git https://github.com/ethus3h/compiz-reloaded-overlay.git`. The repository should be automatically updated when you update your system.

### Installation of packages

#### Version and live ebuilds

You can use ''version'' ebuilds, which correspond to the released versions of compiz-reloaded, or ''live'' ebuilds, which pull in the latest commits from the compiz-reloaded git repository at build time.

If you use the version ebuilds, they will need to accept the Portage keywords for either `~amd64` or `~x86` depending on the architecture; other architectures aren't given keywords in these ebuilds right now.

If you use the live ebuilds, keywords will need to be ignored (`**`) as live ebuilds declare no keywords.

To see how to do this, see the Gentoo wiki pages at https://wiki.gentoo.org/wiki/ACCEPT_KEYWORDS and https://wiki.gentoo.org/wiki//etc/portage/package.accept_keywords.

#### Available packages

These packages are provided by this overlay, with both version and live ebuilds available for each. Once the overlay is installed and keywords have been set, these can be `emerge`d as with any other Gentoo package.

- dev-python/compizconfig-python
- x11-apps/compiz-boxmenu
- x11-apps/compiz-manager
- x11-apps/fusion-icon
- x11-libs/compiz-bcop
- x11-libs/libcompizconfig
- x11-misc/ccsm
- x11-misc/compiz-debug-utils
- x11-misc/simple-ccsm
- x11-plugins/compicc
- x11-plugins/compiz-extra-snowflake-textures
- x11-plugins/compiz-plugins-community
- x11-plugins/compiz-plugins-experimental
- x11-plugins/compiz-plugins-extra
- x11-plugins/compiz-plugins-main
- x11-plugins/compiz-plugins-meta
- x11-themes/emerald-themes
- x11-wm/compiz
- x11-wm/compiz-meta
- x11-wm/emerald

### Updating packages

Version ebuilds will be updated automatically in the usual manner of installed packages.

Live ebuilds will not be automatically updated when updating your installed packages, but can be updated by running `smart-live-rebuild` (if that command is not available, it can be installed by running `emerge app-portage/smart-live-rebuild`).

### Getting help

Feel free to ask questions [issue tracker](https://github.com/ethus3h/compiz-reloaded-overlay/issues) and/or in the Matrix chat (probably quickest response) at [#futuramerlin:matrix.org](https://matrix.to/#/%23futuramerlin:matrix.org); more up-to-date contact information may be available at http://futuramerlin.com/contact.htm. (You can also send email to [elli@futuramerlin.com](mailto:elli@futuramerlin.com), but that's not recommended as I may not see it.)

For general discussion about Compiz-Reloaded, [the #compiz-reloaded channel](irc://irc.freenode.net/compiz-reloaded) on the Freenode IRC network is available.

Good luck!
