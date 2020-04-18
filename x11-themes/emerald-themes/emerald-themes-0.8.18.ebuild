# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit autotools

DESCRIPTION="Emerald window decorator themes"
HOMEPAGE="https://gitlab.com/compiz"
SRC_URI="https://gitlab.com/compiz/${PN}/uploads/dbbeef582f467ff839b5bc62b36e6f05/${P}.tar.xz"

LICENSE="GPL-2+ GPL-3+"
SLOT="0"
KEYWORDS="~amd64 ~x86"
RDEPEND=">=x11-wm/emerald-0.8.12
		<x11-wm/emerald-0.9
"

src_prepare(){
	default
	eautoreconf
}
