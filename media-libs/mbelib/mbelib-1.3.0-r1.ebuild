# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="P25 Phase 1 and ProVoice vocoder"
HOMEPAGE="https://github.com/szechyjs/mbelib"

LICENSE="BSD"
SLOT=0
IUSE="static-libs"

if [[ ${PV} == "9999" ]] ; then
	EGIT_REPO_URI="https://github.com/szechyjs/mbelib.git"
	inherit git-r3
else
	SRC_URI="https://github.com/szechyjs/mbelib/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="amd64 ~x86"
fi

src_prepare() {
	default

	sed -i -e "s#X}/lib#X}/$(get_libdir)#" -e "s#N lib#N $(get_libdir)#" "${S}/CMakeLists.txt"

	cmake_src_prepare
}

src_install() {
	cmake_src_install
	use static-libs || rm "${ED}"/usr/$(get_libdir)/libmbe.a
}
