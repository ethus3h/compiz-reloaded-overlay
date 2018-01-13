# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

if [[ "${PV}" == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/compiz-reloaded/compiz-debug-utils.git"
	KEYWORDS=""
	RDEPEND="
			>=dev-lang/python-3:*
			=x11-wm/compiz-${PV}[dbus]
	"
else
	myCommit="f700dd2b6af1f0c93b6b1eb1d75e658783f848e2"
	SRC_URI="https://github.com/compiz-reloaded/${PN}/archive/${myCommit}.zip -> ${P}-${myCommit}.zip"
	KEYWORDS="~amd64 ~x86"
	RDEPEND="
			>=dev-lang/python-3:*
			>=x11-wm/compiz-0.8[dbus]
			<x11-wm/compiz-0.9[dbus]
	"
	S="${WORKDIR}/${PN}-${myCommit}"
fi

DESCRIPTION=" Helper utilities for debugging Compiz"
HOMEPAGE="https://github.com/compiz-reloaded"

LICENSE="GPL-2+"
SLOT="0"

DEPEND="${RDEPEND}"

src_install() {
	GLOBIGNORE="COPYING:README.md:.git"
	dobin *
	dodoc README.md
	unset GLOBIGNORE
}
