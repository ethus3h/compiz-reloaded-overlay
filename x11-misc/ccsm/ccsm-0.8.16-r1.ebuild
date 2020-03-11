# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7  python3_{4,5,6} )
DISTUTILS_IN_SOURCE_BUILD=1
DISTUTILS_SINGLE_IMPL=1
inherit distutils-r1 gnome2-utils

DESCRIPTION="A graphical manager for CompizConfig Plugin (libcompizconfig)"
HOMEPAGE="https://gitlab.com/compiz"
SRC_URI="https://github.com/compiz-reloaded/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="gtk3"

RDEPEND="
	$(python_gen_cond_dep '
		dev-python/pycairo[${PYTHON_MULTI_USEDEP}]
	')
	>=dev-python/compizconfig-python-0.8.12[${PYTHON_SINGLE_USEDEP}]
	<dev-python/compizconfig-python-0.9
	$(python_gen_cond_dep '
		dev-python/pygobject:3[${PYTHON_MULTI_USEDEP}]
	')
	gnome-base/librsvg
"

python_prepare_all() {
	# correct gettext behavior
	if [[ -n "${LINGUAS+x}" ]] ; then
		for i in $(cd po ; echo *po | sed 's/\.po//g') ; do
		if ! has ${i} ${LINGUAS} ; then
			rm po/${i}.po || die
		fi
		done
	fi

	distutils-r1_python_prepare_all
}

python_configure_all() {
	mydistutilsargs=(
		build
		"--prefix=/usr"
		"--with-gtk=$(usex gtk3 3.0 2.0)"
	)
}

pkg_postinst() {
	gnome2_icon_cache_update
}

pkg_postrm() {
	gnome2_icon_cache_update
}
