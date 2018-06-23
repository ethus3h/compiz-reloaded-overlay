# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Extra snowflake textures for Compiz"
SRC_URI="https://github.com/ethus3h/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND=">=x11-plugins/compiz-plugins-experimental-0.8
	<x11-plugins/compiz-plugins-experimental-0.9"

src_install() {
	rm .egup.{branches,refs,remotes,tags} {CODE_OF_CONDUCT,CONTRIBUTING,LICENSE,README}.md || die
	insinto /usr/share/compiz/snow/
	doins -r .
}
