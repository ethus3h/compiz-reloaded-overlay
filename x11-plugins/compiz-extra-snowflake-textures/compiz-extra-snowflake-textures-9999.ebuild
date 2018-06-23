# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit git-r3

DESCRIPTION="Extra snowflake textures for Compiz"
HOMEPAGE="https://wiki.gentoo.org/wiki/No_homepage"
EGIT_REPO_URI="https://github.com/ethus3h/${PN}.git"

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS=""

RDEPEND=">=x11-plugins/compiz-plugins-experimental-${PV}"

src_install() {
	rm .egup.{branches,refs,remotes,tags} {CODE_OF_CONDUCT,CONTRIBUTING,LICENSE,README}.md || die
	rm -r .git || die
	insinto /usr/share/compiz/snow/
	doins -r .
}
