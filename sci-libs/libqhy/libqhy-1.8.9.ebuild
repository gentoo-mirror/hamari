# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake eutils

MY_PN="indi"

DESCRIPTION="SDK and firmware for the QHY CCD cameras"
HOMEPAGE="http://indilib.org"
SRC_URI="https://github.com/${MY_PN}lib/${MY_PN}-3rdparty/archive/v${PV}.tar.gz -> ${MY_PN}lib-3rdparty-${PV}.tar.gz"

LICENSE="qhyccd"
KEYWORDS="~amd64 ~x86"

SLOT="0/1"

DEPEND=""

RDEPEND="${DEPEND}
	sys-apps/fxload"

INDI_TARGET_DIRECTORY="${PN%%lib-driver-**}"

S="${WORKDIR}/${MY_PN}-3rdparty-${PV}/${INDI_TARGET_DIRECTORY}"
