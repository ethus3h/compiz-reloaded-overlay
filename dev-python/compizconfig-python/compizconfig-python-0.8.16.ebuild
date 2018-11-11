# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 python3_{4,5,6} )
inherit python-single-r1

DESCRIPTION="Python bindings for libraries/plugins for compizconfig-settings"
HOMEPAGE="https://gitlab.com/compiz"
SRC_URI="https://github.com/compiz-reloaded/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="${PYTHON_DEPS}
	dev-python/cython[${PYTHON_USEDEP}]
	>=dev-libs/glib-2.6
	>=x11-libs/libcompizconfig-0.6.99
	<x11-libs/libcompizconfig-0.9
"

DEPEND="${RDEPEND}
	virtual/pkgconfig
"

REQUIRED_USE="${PYTHON_REQUIRED_USE}"

src_install() {
	default
	find "${D}" -name '*.la' -delete || die
}
