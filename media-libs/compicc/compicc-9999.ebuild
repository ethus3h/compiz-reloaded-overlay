# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit git-r3

DESCRIPTION="CompICC"
HOMEPAGE="https://github.com/compiz-reloaded"
EGIT_REPO_URI="git://github.com/compiz-reloaded/compicc.git"

LICENSE="BSD"
SLOT="0"

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
