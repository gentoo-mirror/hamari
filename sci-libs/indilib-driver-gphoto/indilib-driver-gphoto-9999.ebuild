# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake git-r3 eutils

DESCRIPTION="INDI driver for the gphoto2 compatible cameras"
HOMEPAGE="http://indilib.org"
EGIT_REPO_URI="https://github.com/indilib/indi-3rdparty.git"
EGIT_CHECKOUT_DIR="${WORKDIR}/${P}"

LICENSE="LGPL-2"
KEYWORDS=""

SLOT="0/1"

DEPEND="~sci-libs/indilib-9999
	media-libs/libgphoto2[jpeg]
	media-libs/libraw
	dev-libs/npth
	media-libs/tiff[cxx]"

RDEPEND="${DEPEND}"

INDI_GIT_DIR="${PN%%lib-driver-*}${PN##*-driver}"

S="${EGIT_CHECKOUT_DIR}/${INDI_GIT_DIR}"
