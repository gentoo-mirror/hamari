# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Direct Memory Access (DMA) Attack Software"
HOMEPAGE="https://github.com/ufrisk/LeechCore"
SRC_URI="https://github.com/ufrisk/LeechCore/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0/0"
KEYWORDS="amd64 x86"

DEPEND="virtual/libusb:="
RDEPEND="${DEPEND}"

src_compile() {
	emake -C leechcore
}

src_install() {
	dolib.so files/leechcore.so
	doheader includes/leechcore.h
}
