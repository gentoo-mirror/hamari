# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake git-r3 eutils

DESCRIPTION="Driver for the Finger Lakes Instruments CCD and Focuser"
HOMEPAGE="http://indilib.org"
EGIT_REPO_URI="https://github.com/indilib/indi-3rdparty.git"
EGIT_CHECKOUT_DIR="${WORKDIR}/${P}"

LICENSE="BSD"
KEYWORDS=""

SLOT="0/1"

DEPEND="~sci-libs/indilib-9999
	virtual/libusb:1"

RDEPEND="${DEPEND}"

S="${EGIT_CHECKOUT_DIR}/${PN}"
