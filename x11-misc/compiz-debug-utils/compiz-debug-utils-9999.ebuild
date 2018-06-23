# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python3_{4,5,6} )

inherit git-r3 python-single-r1

DESCRIPTION="Helper utilities for debugging Compiz"
HOMEPAGE="https://gitlab.com/compiz"
EGIT_REPO_URI="https://github.com/compiz-reloaded/compiz-debug-utils.git"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS=""
IUSE="test"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

RDEPEND="${PYTHON_DEPS}
		>=x11-wm/compiz-${PV}[dbus]
"
DEPEND="${RDEPEND}"

src_install() {
	dodoc README.md
	rm README.md COPYING || die
	dobin *
}
