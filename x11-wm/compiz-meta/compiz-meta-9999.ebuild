# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="6"

DESCRIPTION="Compiz Reloaded (meta)"
HOMEPAGE="https://github.com/compiz-reloaded"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
IUSE="boxmenu +ccsm +emerald +fusionicon gtk3 manager simpleccsm"

RDEPEND="
	>=x11-plugins/compiz-plugins-meta-${PV}
	boxmenu? ( >=x11-apps/compiz-boxmenu-${PV} )
	ccsm? ( >=x11-misc/ccsm-${PV}[gtk3=] )
	emerald? ( >=x11-wm/emerald-${PV}[gtk3=] )
	fusionicon? ( >=x11-apps/fusion-icon-${PV} )
	manager? ( >=x11-apps/compiz-manager-${PV} )
	simpleccsm? ( >=x11-misc/simple-ccsm-${PV}[gtk3=] )
"
