# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit autotools eutils

DESCRIPTION="Compiz Window Manager: Experimental Plugins"
HOMEPAGE="https://gitlab.com/compiz"
SRC_URI="https://github.com/compiz-reloaded/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
	gnome-base/librsvg
	media-libs/glew:=
	net-misc/curl
	virtual/jpeg:0
	>=x11-libs/compiz-bcop-0.7.3
	<x11-libs/compiz-bcop-0.9
	>=x11-plugins/compiz-plugins-main-0.8
	<x11-plugins/compiz-plugins-main-0.9
	>=x11-plugins/compiz-plugins-extra-0.8
	<x11-plugins/compiz-plugins-extra-0.9
	>=x11-wm/compiz-0.8
	<x11-wm/compiz-0.9
	x11-libs/cairo[X]
	x11-libs/libXScrnSaver
"

DEPEND="${RDEPEND}
	>=dev-util/intltool-0.35
	>=sys-devel/gettext-0.15
	virtual/pkgconfig
"

src_prepare(){
	default
	eautoreconf
}

src_configure() {
	econf \
		--enable-fast-install \
		--disable-static
}

src_install() {
	default
	find "${D}" -name '*.la' -delete || die
}
