# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake eutils

MY_PN="indi"

DESCRIPTION="This is the Orion Starshoot G Library SDK for Linux & MacOS"
HOMEPAGE="http://indilib.org"
SRC_URI="https://github.com/${MY_PN}lib/${MY_PN}-3rdparty/archive/v${PV}.tar.gz -> ${MY_PN}lib-3rdparty-${PV}.tar.gz"

LICENSE="LGPL-2.1"
KEYWORDS="~amd64 ~arm ~x86"

SLOT="0/1"

RDEPEND="${DEPEND}"

INDI_TARGET_DIRECTORY="${PN%%lib-driver-**}"

S="${WORKDIR}/${MY_PN}-3rdparty-${PV}/${INDI_TARGET_DIRECTORY}"
