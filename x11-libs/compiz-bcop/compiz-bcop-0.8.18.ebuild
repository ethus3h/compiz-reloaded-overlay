# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit autotools

DESCRIPTION="Compiz Option code Generator"
HOMEPAGE="https://gitlab.com/compiz"
SRC_URI="https://gitlab.com/compiz/${PN}/uploads/5b37c3edbf45fcac9412c34e00383715/${P}.tar.xz"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="dev-libs/libxslt"

DEPEND="${RDEPEND}
	virtual/pkgconfig
"

src_prepare(){
	default
	eautoreconf
}
