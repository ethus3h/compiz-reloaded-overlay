# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 python3_{4,5,6} )
inherit autotools python-single-r1 git-r3

DESCRIPTION="Python bindings for libraries/plugins for compizconfig-settings"
HOMEPAGE="https://gitlab.com/compiz"
EGIT_REPO_URI="https://github.com/compiz-reloaded/compizconfig-python.git"

LICENSE="GPL-2+"
SLOT="0"

RDEPEND="${PYTHON_DEPS}
	dev-python/cython[${PYTHON_USEDEP}]
	>=dev-libs/glib-2.6
	>=x11-libs/libcompizconfig-${PV}
"

DEPEND="${RDEPEND}
	virtual/pkgconfig
"

REQUIRED_USE="${PYTHON_REQUIRED_USE}"

src_prepare(){
	default
	eautoreconf
}

src_install() {
	default
	find "${D}" -name '*.la' -delete || die
}
