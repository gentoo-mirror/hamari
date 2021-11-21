# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..10} )
DISTUTILS_USE_SETUPTOOLS=no

inherit distutils-r1

DESCRIPTION="Python version of NASA DE4xx ephemerides"
HOMEPAGE="https://github.com/brandon-rhodes/python-jplephem"
SRC_URI="https://github.com/brandon-rhodes/python-jplephem/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

KEYWORDS="amd64 x86"
LICENSE="MIT"
SLOT="0"
IUSE=""

RDEPEND="${PYTHON_DEPS}
	dev-python/numpy[${PYTHON_USEDEP}]"
