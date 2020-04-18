# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="The Compiz ICC colour server"
HOMEPAGE="https://gitlab.com/compiz"
SRC_URI="https://gitlab.com/compiz/${PN}/uploads/6b54348ca52f0401d4481d6c4634ca5f/${P}.tar.xz"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
	dev-libs/libxml2
	>=media-libs/oyranos-0.9.6
	>=x11-wm/compiz-0.8
	<x11-wm/compiz-0.9
	x11-libs/libXinerama
	x11-libs/libXxf86vm
	x11-libs/libXfixes
	x11-libs/libXrandr
	x11-base/xorg-proto
"

DEPEND="${RDEPEND}
	app-doc/doxygen
	>=dev-util/intltool-0.35
	>=sys-devel/gettext-0.17
	virtual/pkgconfig
"
