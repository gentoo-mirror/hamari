# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

MY_PN="${PN%%lib-driver-**}"

inherit cmake eutils

DESCRIPTION="INDI driver for the Moravian MI CCD cameras"
HOMEPAGE="http://indilib.org"
SRC_URI="https://github.com/${MY_PN}lib/${MY_PN}-3rdparty/archive/v${PV}.tar.gz -> ${MY_PN}lib-3rdparty-${PV}.tar.gz"

LICENSE="LGPL-2.1"
KEYWORDS="~amd64 ~x86"

SLOT="0/1"

DEPEND="<sci-libs/indilib-9999"

RDEPEND="${DEPEND}
	<sci-libs/libmicam-9999"

INDI_TARGET_DIRECTORY="${PN%%lib-driver-**}${PN##*-driver}"

S="${WORKDIR}/${MY_PN}-3rdparty-${PV}/${INDI_TARGET_DIRECTORY}"
