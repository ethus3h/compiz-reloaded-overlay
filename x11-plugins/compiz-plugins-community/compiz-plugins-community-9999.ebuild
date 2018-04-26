# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

if [[ "${PV}" == "9999" ]]; then
	inherit autotools eutils git-r3
	EGIT_REPO_URI="https://github.com/ethus3h/${PN}.git"
	KEYWORDS=""
	RDEPEND="
		app-misc/cwiid
		media-libs/opencv
		gnome-base/librsvg
		virtual/jpeg:0
		>=x11-libs/compiz-bcop-${PV}
		>=x11-plugins/compiz-plugins-experimental-${PV}
		>=x11-wm/compiz-${PV}
	"
else
	inherit autotools eutils
	SRC_URI="https://github.com/ethus3h/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
	RDEPEND="
		gnome-base/librsvg
		virtual/jpeg:0
		>=x11-libs/compiz-bcop-0.7.3
		<x11-libs/compiz-bcop-0.9
		>=x11-plugins/compiz-plugins-experimental-0.8
		<x11-plugins/compiz-plugins-experimental-0.9
		>=x11-wm/compiz-0.8
		<x11-wm/compiz-0.9
	"
fi

DESCRIPTION="Compiz Fusion Window Decorator Community Plugins"
HOMEPAGE="http://futuramerlin.com/"

LICENSE="GPL-2+ BSD"
SLOT="0"

DEPEND="${RDEPEND}
	>=dev-util/intltool-0.35
	>=sys-devel/gettext-0.15
	virtual/pkgconfig
	x11-libs/cairo
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
	prune_libtool_files
}
