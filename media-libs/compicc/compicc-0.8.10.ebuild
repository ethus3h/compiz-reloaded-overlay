# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DESCRIPTION="CompICC"
HOMEPAGE="https://github.com/compiz-reloaded"
SRC_URI="https://github.com/compiz-reloaded/${PN}/releases/download/${PV}/${P}.tar.xz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND=">=media-libs/oyranos-0.9.6
	|| ( >=x11-wm/compiz-0.8 >=x11-wm/compiz-reloaded-0.8 >=compiz-reloaded/compiz-0.8.0 )
	x11-proto/xextproto
	x11-libs/libXxf86vm
	virtual/pkgconfig
	x11-libs/libXrandr
	x11-libs/libXinerama
	app-doc/doxygen
	dev-libs/libxml2
	x11-libs/libXfixes"
DEPEND="${RDEPEND}"
