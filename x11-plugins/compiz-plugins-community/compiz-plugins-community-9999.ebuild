# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit autotools eutils git-r3 gnome2-utils

DESCRIPTION="Compiz Window Manager: Community Plugins"
HOMEPAGE="https://wiki.gentoo.org/wiki/No_homepage"
EGIT_REPO_URI="https://github.com/ethus3h/${PN}.git"

LICENSE="GPL-2+ BSD"
SLOT="0"

RDEPEND="
	media-libs/opencv
	gnome-base/librsvg
	virtual/jpeg:0
	>=x11-libs/compiz-bcop-${PV}
	>=x11-plugins/compiz-plugins-experimental-${PV}
	>=x11-wm/compiz-${PV}
	x11-libs/cairo
"

DEPEND="${RDEPEND}
	>=dev-util/intltool-0.35
	>=sys-devel/gettext-0.15
	virtual/pkgconfig
"

src_prepare(){
	# app-misc/cwiid is not available in Portage, so disable the plugins that depend on it.
	# Ideally, the configure script of compiz-plugins-community would do this automatically,
	# but I don't know how to do that yet.
	enotify "The wiimote and wiitrack plugins are not built."
	sed -i '/wiimote/d' {src,icons}/Makefile.am || die
	sed -i '/wiitrack/d' {src,icons}/Makefile.am || die
	tac src/Makefile.am | sed '0,/\(\w\)[ \t]*\\/s//\1/' > src/Makefile.am.tmp || die
	tac src/Makefile.am.tmp > src/Makefile.am || die
	rm src/Makefile.am.tmp || die
	tac icons/Makefile.am | sed '0,/\.svg[ \t]*\\/s//.svg/' > icons/Makefile.am.tmp || die
	tac icons/Makefile.am.tmp > icons/Makefile.am || die
	rm icons/Makefile.am.tmp || die

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

compiz_icon_cache_update() {
    # Needed because compiz needs its own icon cache.
    # Based on https://gitweb.gentoo.org/repo/gentoo.git/tree/eclass/gnome2-utils.eclass#n241
    local dir="${EROOT}/usr/share/compiz/icons/hicolor"
    local updater="${EROOT}/usr/bin/gtk-update-icon-cache"
    if [[ -z "$dir" ]]; then
        "${updater}" -q -f -t "${dir}"
        rv=$?

        if [[ ! $rv -eq 0 ]] ; then
            debug-print "Updating cache failed on ${dir}"

            # Add to the list of failures
            fails+=( "${dir}" )

            retval=2
        fi
    elif [[ $(ls "${dir}") = "icon-theme.cache" ]]; then
        # Clear stale cache files after theme uninstallation
        rm "${dir}/icon-theme.cache"
    fi

    if [[ -z $(ls "${dir}") ]]; then
        # Clear empty theme directories after theme uninstallation
        rmdir "${dir}"
    fi
}

pkg_postinst() {
	gnome2_icon_cache_update
	compiz_icon_cache_update
}

pkg_postrm() {
	gnome2_icon_cache_update
	compiz_icon_cache_update
}
