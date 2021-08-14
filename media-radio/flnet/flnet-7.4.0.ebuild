# Copyright 1999-2021 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=8

DESCRIPTION="Amateur Radio Net Control Program"
HOMEPAGE="http://w1hkj.com/Net-help/index.html"
SRC_URI="mirror://sourceforge/fldigi/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="mbedtls xmlrpc"

RDEPEND="
	x11-libs/fltk:1
	x11-libs/libX11
	x11-misc/xdg-utils
	mbedtls? ( >=net-libs/mbedtls-2.16.0:= )
	xmlrpc? ( >=media-radio/flxmlrpc-0.1.0 )
"

DEPEND="${RDEPEND}
	virtual/pkgconfig"

DOCS=( AUTHORS ChangeLog INSTALL README )

src_configure() {
	econf $(use_with xmlrpc flxmlrpc)

# TODO: mbedtls is broken
#	econf $(use_with xmlrpc flxmlrpc) \
#		$(use_with mbedtls libmbedtls)
}
