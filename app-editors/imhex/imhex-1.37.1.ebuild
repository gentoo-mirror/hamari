# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CMAKE_BUILD_TYPE="Release"
CMAKE_MAKEFILE_GENERATOR="emake"
LLVM_COMPAT=( {15..19} )

inherit cmake desktop llvm-r1 toolchain-funcs xdg-utils

DESCRIPTION="A hex editor for reverse engineers, programmers, and eyesight"
HOMEPAGE="https://github.com/WerWolv/ImHex"
SRC_URI="
	https://github.com/WerWolv/ImHex/releases/download/v${PV}/Full.Sources.tar.gz -> ${P}.tar.gz
	https://github.com/WerWolv/ImHex-Patterns/archive/refs/tags/ImHex-v${PV}.tar.gz -> ${PN}-patterns-${PV}.tar.gz
"
S="${WORKDIR}/ImHex"
S_PATTERNS="${WORKDIR}/ImHex-Patterns-ImHex-v${PV}"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64"
IUSE="+system-llvm test"
RESTRICT="!test? ( test )"
#RESTRICT="test" # the tests need the shared library to work

DEPEND="
	app-arch/bzip2
	app-arch/lzma
	app-arch/lz4
	app-arch/zstd[zlib]
	app-forensics/yara
	>=dev-cpp/nlohmann_json-3.10.2
	dev-libs/boost:=
	dev-libs/capstone
	>=dev-libs/nativefiledialog-extended-1.2.0
	>=dev-libs/libfmt-8.0.0:=
	media-libs/freetype
	media-libs/glfw
	media-libs/glm
	net-libs/libssh2
	net-libs/mbedtls
	net-misc/curl
	sys-apps/dbus
	sys-apps/file
	sys-apps/xdg-desktop-portal
	virtual/libiconv
	virtual/libintl
"
RDEPEND="${DEPEND}"
BDEPEND="
	app-admin/chrpath
	gnome-base/librsvg
	system-llvm? ( $(llvm_gen_dep 'llvm-core/llvm:${LLVM_SLOT}=' ) )
"

pkg_pretend() {
	if tc-is-gcc && [[ $(gcc-major-version) -lt 12 ]]; then
		die "${PN} requires GCC 12 or newer"
	fi
}

src_prepare() {
	cmake_src_prepare

	sed -i -e "/set(BOOST_LIBRARIES Boost::regex)/d" cmake/build_helpers.cmake
}

src_configure() {
	local mycmakeargs=(
		-D CMAKE_BUILD_TYPE="Release" \
		-D CMAKE_SKIP_RPATH=ON \
		-D IMHEX_PLUGINS_IN_SHARE=OFF \
		-D IMHEX_STRIP_RELEASE=OFF \
		-D IMHEX_OFFLINE_BUILD=ON \
		-D IMHEX_IGNORE_BAD_CLONE=ON \
		-D IMHEX_PATTERNS_PULL_MASTER=OFF \
		-D IMHEX_IGNORE_BAD_COMPILER=OFF \
		-D IMHEX_USE_GTK_FILE_PICKER=OFF \
		-D IMHEX_DISABLE_STACKTRACE=OFF \
		-D IMHEX_USE_DEFAULT_BUILD_SETTINGS=OFF \
		-D IMHEX_STRICT_WARNINGS=OFF \
		-D IMHEX_VERSION="${PV}" \
		-D IMHEX_ENABLE_UNIT_TESTS="$(use test)"
		-D PROJECT_VERSION="${PV}" \
		-D USE_SYSTEM_BOOST=ON \
		-D USE_SYSTEM_CAPSTONE=ON \
		-D USE_SYSTEM_FMT=ON \
		-D USE_SYSTEM_LLVM=$(use system-llvm) \
		-D USE_SYSTEM_NFD=ON \
		-D USE_SYSTEM_NLOHMANN_JSON=ON \
		-D USE_SYSTEM_YARA=ON
	)

	cmake_src_configure
}

src_install() {
	cmake_src_install

	domenu "${S}/dist/${PN}.desktop"

	# Install patterns
	insinto /usr/share/imhex
	rm -rf "${S_PATTERNS}/tests"
	doins -r "${S_PATTERNS}"/*
}

pkg_postinst() {
	xdg_desktop_database_update
	xdg_mimeinfo_database_update
}

pkg_postrm() {
	xdg_desktop_database_update
	xdg_mimeinfo_database_update
}
