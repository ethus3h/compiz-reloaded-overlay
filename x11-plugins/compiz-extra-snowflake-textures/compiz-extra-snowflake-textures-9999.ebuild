# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

if [[ "${PV}" == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/ethus3h/${PN}.git"
	KEYWORDS=""
	RDEPEND=">=x11-plugins/compiz-plugins-experimental-${PV}"
else
	SRC_URI="https://github.com/ethus3h/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
	RDEPEND=">=x11-plugins/compiz-plugins-experimental-0.8
		<x11-plugins/compiz-plugins-experimental-0.9"
fi

DESCRIPTION="Extra snowflake textures for Compiz"
HOMEPAGE="https://futuramerlin.com/"

LICENSE="AGPL-3"
SLOT="0"
RDEPEND="x11-plugins/compiz-plugins-experimental"

src_install() {
	insinto /usr/share/compiz/snow/
	GLOBIGNORE="README.md:.git:.egup.tags"
	doins -r *
	unset GLOBIGNORE
}
