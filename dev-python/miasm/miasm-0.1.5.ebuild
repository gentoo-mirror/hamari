# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..13} )
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1

DESCRIPTION="Reverse engineering framework in Python"
HOMEPAGE="https://miasm.re/"

if [[ ${PV} == "9999" ]] ; then
	EGIT_REPO_URI="https://github.com/cea-sec/miasm.git"
	inherit git-r3
else
	SRC_URI="https://github.com/cea-sec/miasm/archive/refs/tags/v${PV}/${P}.tar.gz"
	KEYWORDS="amd64 x86"
fi

LICENSE="GPL-2"
SLOT="0"
RESTRICT="test"

src_prepare() {
	default

	if [[ ${PV} != "9999" ]] ; then
		echo ${PV} > "${S}/${PN}/VERSION" || die
	fi
}
