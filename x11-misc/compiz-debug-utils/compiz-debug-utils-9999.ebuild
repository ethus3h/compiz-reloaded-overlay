# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

inherit git-r3

DESCRIPTION=" Helper utilities for debugging Compiz"
HOMEPAGE="https://github.com/compiz-reloaded"
EGIT_REPO_URI="git://github.com/compiz-reloaded/compiz-debug-utils.git"

LICENSE="GPL-2+"
SLOT="0"

RDEPEND="
		>=dev-lang/python-3:*
		x11-wm/compiz[dbus]
"

DEPEND="${RDEPEND}"

src_install() {
	GLOBIGNORE="COPYING:README.md:.git"
	dobin *
	dodoc README.md
	unset GLOBIGNORE
}
