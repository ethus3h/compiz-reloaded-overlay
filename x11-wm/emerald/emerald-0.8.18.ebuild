# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit autotools gnome2-utils

DESCRIPTION="Emerald Window Decorator"
HOMEPAGE="https://gitlab.com/compiz"
SRC_URI="https://github.com/compiz-reloaded/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="gtk3"

PDEPEND="
	>=x11-themes/emerald-themes-0.8.12
	<x11-themes/emerald-themes-0.9
"

RDEPEND="
	>=x11-wm/compiz-0.8.12
	<=x11-wm/compiz-0.9
	gtk3? (
		x11-libs/gtk+:3
		x11-libs/libwnck:3
	)
	!gtk3? (
		>=x11-libs/gtk+-2.22.0:2
		>=x11-libs/libwnck-2.22:1
	)
"

DEPEND="${RDEPEND}
	>=dev-util/intltool-0.35
	>=sys-devel/gettext-0.17
	virtual/pkgconfig
"

src_prepare() {
	sed -i -e "/PKG_CONFIG_PATH/s:/lib:/$(get_libdir):" configure.ac
	sed -i -e "s:/lib:/$(get_libdir):" \
		-e "s/+=4/+=$(get_libdir | wc -c)/" libengine/themer.c
	default
	eautoreconf
}

src_configure() {
	econf \
		--disable-static \
		--enable-fast-install \
		--disable-mime-update \
		--with-gtk=$(usex gtk3 3.0 2.0)
}

src_install() {
	default
	find "${D}" -name '*.la' -delete || die
}

pkg_postinst() {
	gnome2_icon_cache_update
	xdg_desktop_database_update
	xdg_mimeinfo_database_update
}

pkg_postrm() {
	gnome2_icon_cache_update
	xdg_desktop_database_update
	xdg_mimeinfo_database_update
}
