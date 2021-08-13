# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake eutils

MY_PN="indi"

DESCRIPTION="Firmware for the Fishcamp Engineering's Starfish CMOS autoguider"
HOMEPAGE="http://indilib.org"
SRC_URI="https://github.com/${MY_PN}lib/${MY_PN}-3rdparty/archive/v${PV}.tar.gz -> ${MY_PN}lib-3rdparty-${PV}.tar.gz"

LICENSE="fishcamp"
KEYWORDS="~amd64 ~x86"

SLOT="0/1"

RDEPEND="${DEPEND}
	sys-apps/fxload
	<sci-libs/indilib-9999"

INDI_TARGET_DIRECTORY="${PN%%lib-driver-**}"

S="${WORKDIR}/${MY_PN}-3rdparty-${PV}/${INDI_TARGET_DIRECTORY}"
