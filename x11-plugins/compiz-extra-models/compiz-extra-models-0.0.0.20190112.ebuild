# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Extra 3D models for Compiz"
HOMEPAGE="https://wiki.gentoo.org/wiki/No_homepage"
SRC_URI="https://archive.org/download/compiz-cube-models-downloaded-2019jan12/cube-models.tar.gz%3Fdl%3D1 -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""

RDEPEND=">=x11-plugins/compiz-plugins-experimental-0.8"
S="${WORKDIR}/cube-models"

src_install() {
	insinto /usr/share/compiz/cube-models/
	doins -r .
}
