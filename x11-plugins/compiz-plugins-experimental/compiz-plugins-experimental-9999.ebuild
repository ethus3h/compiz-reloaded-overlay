# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit autotools eutils git-r3 gnome2-utils

DESCRIPTION="Compiz Window Manager: Experimental Plugins"
HOMEPAGE="https://gitlab.com/compiz"
EGIT_REPO_URI="https://github.com/compiz-reloaded/compiz-plugins-experimental.git"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS=""

RDEPEND="
	gnome-base/librsvg
	media-libs/glew:=
	net-misc/curl
	virtual/jpeg:0
	>=x11-libs/compiz-bcop-${PV}
	>=x11-plugins/compiz-plugins-main-${PV}
	>=x11-plugins/compiz-plugins-extra-${PV}
	>=x11-wm/compiz-${PV}
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

compiz_icon_cache_update() {
	# Needed because compiz needs its own icon cache.
	# Based on https://gitweb.gentoo.org/repo/gentoo.git/tree/eclass/gnome2-utils.eclass#n241
	local dir="${EROOT}/usr/share/compiz/icons/hicolor"
	local updater="${EROOT}/usr/bin/gtk-update-icon-cache"
	if [[ -n "$(ls "$dir")" ]]; then
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
