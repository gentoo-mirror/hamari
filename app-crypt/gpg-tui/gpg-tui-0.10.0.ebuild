# Copyright 2017-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
	addr2line@0.21.0
	adler@1.0.2
	android-tzdata@0.1.1
	android_system_properties@0.1.5
	anstream@0.5.0
	anstyle@1.0.2
	anstyle-parse@0.2.1
	anstyle-query@1.0.0
	anstyle-wincon@2.1.0
	anyhow@1.0.75
	autocfg@1.1.0
	backtrace@0.3.69
	better-panic@0.3.0
	bitflags@1.3.2
	bitflags@2.4.0
	block@0.1.6
	block-buffer@0.10.4
	build-rs@0.1.2
	bumpalo@3.13.0
	bytemuck@1.14.0
	byteorder@1.4.3
	cassowary@0.3.0
	cc@1.0.83
	cfg-expr@0.15.5
	cfg-if@1.0.0
	chrono@0.4.30
	clap@4.4.2
	clap_builder@4.4.2
	clap_complete@4.4.1
	clap_derive@4.4.2
	clap_lex@0.5.1
	clipboard-win@3.1.1
	color_quant@1.1.0
	colorchoice@1.0.0
	colorsys@0.6.7
	console@0.15.7
	conv@0.3.3
	copypasta@0.8.2
	copypasta-ext@0.4.4
	core-foundation-sys@0.8.4
	cpufeatures@0.2.9
	crossterm@0.27.0
	crossterm_winapi@0.9.1
	crypto-common@0.1.6
	cstr-argument@0.1.2
	custom_derive@0.1.7
	diff@0.1.13
	digest@0.10.7
	dirs@5.0.1
	dirs-next@2.0.0
	dirs-sys@0.4.1
	dirs-sys-next@0.1.2
	dlib@0.5.2
	downcast-rs@1.2.0
	either@1.9.0
	encode_unicode@0.3.6
	equivalent@1.0.1
	errno@0.3.3
	errno-dragonfly@0.1.2
	generic-array@0.14.7
	gethostname@0.2.3
	getrandom@0.2.10
	gimli@0.28.0
	gpg-error@0.6.0
	gpgme@0.11.0
	gpgme-sys@0.11.0
	hashbrown@0.14.0
	heck@0.4.1
	hermit-abi@0.3.2
	hex-literal@0.4.1
	home@0.5.5
	iana-time-zone@0.1.57
	iana-time-zone-haiku@0.1.2
	image@0.24.7
	indexmap@2.0.0
	indoc@2.0.3
	io-lifetimes@1.0.11
	itertools@0.11.0
	itoa@1.0.9
	jpeg-decoder@0.3.0
	js-sys@0.3.64
	lazy-bytes-cast@5.0.1
	lazy_static@1.4.0
	libc@0.2.147
	libgpg-error-sys@0.6.0
	libloading@0.8.0
	linux-raw-sys@0.3.8
	linux-raw-sys@0.4.7
	lock_api@0.4.10
	log@0.4.20
	malloc_buf@0.0.6
	memchr@2.6.3
	memmap2@0.5.10
	memoffset@0.6.5
	memoffset@0.7.1
	minimal-lexical@0.2.1
	miniz_oxide@0.7.1
	mio@0.8.8
	nix@0.24.3
	nom@7.1.3
	num-integer@0.1.45
	num-rational@0.4.1
	num-traits@0.2.16
	objc@0.2.7
	objc-foundation@0.1.1
	objc_id@0.1.1
	object@0.32.1
	once_cell@1.18.0
	option-ext@0.2.0
	parking_lot@0.12.1
	parking_lot_core@0.9.8
	paste@1.0.14
	pkg-config@0.3.27
	pretty_assertions@1.4.0
	proc-macro2@1.0.66
	quote@1.0.33
	ratatui@0.23.0
	redox_syscall@0.2.16
	redox_syscall@0.3.5
	redox_users@0.4.3
	rust-embed@8.0.0
	rust-embed-impl@8.0.0
	rust-embed-utils@8.0.0
	rustc-demangle@0.1.23
	rustix@0.37.23
	rustix@0.38.12
	rustversion@1.0.14
	ryu@1.0.15
	same-file@1.0.6
	scoped-tls@1.0.1
	scopeguard@1.2.0
	serde@1.0.188
	serde_derive@1.0.188
	serde_json@1.0.106
	serde_spanned@0.6.3
	sha2@0.10.7
	shellexpand@3.1.0
	signal-hook@0.3.17
	signal-hook-mio@0.2.3
	signal-hook-registry@1.4.1
	smallvec@1.11.0
	smithay-client-toolkit@0.16.0
	smithay-clipboard@0.6.6
	static_assertions@1.1.0
	strsim@0.10.0
	strum@0.25.0
	strum_macros@0.25.2
	syn@2.0.31
	system-deps@6.1.1
	target-lexicon@0.12.11
	terminal_size@0.2.6
	thiserror@1.0.48
	thiserror-impl@1.0.48
	tinytemplate@1.2.1
	toml@0.7.8
	toml_datetime@0.6.3
	toml_edit@0.19.15
	typenum@1.16.0
	unicode-ident@1.0.11
	unicode-segmentation@1.10.1
	unicode-width@0.1.10
	utf8parse@0.2.1
	version-compare@0.1.1
	version_check@0.9.4
	walkdir@2.4.0
	wasi@0.11.0+wasi-snapshot-preview1
	wasm-bindgen@0.2.87
	wasm-bindgen-backend@0.2.87
	wasm-bindgen-macro@0.2.87
	wasm-bindgen-macro-support@0.2.87
	wasm-bindgen-shared@0.2.87
	wayland-client@0.29.5
	wayland-commons@0.29.5
	wayland-cursor@0.29.5
	wayland-protocols@0.29.5
	wayland-scanner@0.29.5
	wayland-sys@0.29.5
	which@4.4.2
	winapi@0.3.9
	winapi-i686-pc-windows-gnu@0.4.0
	winapi-util@0.1.5
	winapi-wsapoll@0.1.1
	winapi-x86_64-pc-windows-gnu@0.4.0
	windows@0.48.0
	windows-sys@0.45.0
	windows-sys@0.48.0
	windows-targets@0.42.2
	windows-targets@0.48.5
	windows_aarch64_gnullvm@0.42.2
	windows_aarch64_gnullvm@0.48.5
	windows_aarch64_msvc@0.42.2
	windows_aarch64_msvc@0.48.5
	windows_i686_gnu@0.42.2
	windows_i686_gnu@0.48.5
	windows_i686_msvc@0.42.2
	windows_i686_msvc@0.48.5
	windows_x86_64_gnu@0.42.2
	windows_x86_64_gnu@0.48.5
	windows_x86_64_gnullvm@0.42.2
	windows_x86_64_gnullvm@0.48.5
	windows_x86_64_msvc@0.42.2
	windows_x86_64_msvc@0.48.5
	winnow@0.5.15
	winreg@0.10.1
	x11-clipboard@0.7.1
	x11rb@0.10.1
	x11rb-protocol@0.10.0
	xcursor@0.3.4
	xml-rs@0.8.18
	yansi@0.5.1
	${PN}@${PV}
"

inherit cargo shell-completion

DESCRIPTION="Terminal User Interface for GnuPG"
HOMEPAGE="
	https://crates.io/crates/gpg-tui
	https://github.com/orhun/gpg-tui
"
SRC_URI="
	${CARGO_CRATE_URIS}
	https://github.com/orhun/${PN}/raw/v${PV}/man/${PN}.1 -> ${P}.man.1
	https://github.com/orhun/${PN}/raw/v${PV}/man/${PN}.toml.5 -> ${P}.toml.man.5
"

LICENSE="MIT"
# Dependent crate licenses
LICENSE+="
	Apache-2.0 Apache-2.0-with-LLVM-exceptions Boost-1.0 ISC LGPL-2.1
	MIT MPL-2.0 Unicode-DFS-2016 Unlicense
"
SLOT="0"
KEYWORDS="amd64"
RESTRICT="mirror"

DEPEND="
	app-crypt/gpgme
	dev-libs/libgpg-error
	x11-libs/libxcb
"
RDEPEND="${DEPEND}"
BDEPEND="x11-libs/libxkbcommon"

src_unpack() {
	cargo_src_unpack

	local man="${T}/man"
	mkdir -- "${man}" || die
	cp -v -- "${DISTDIR}/${P}.man.1" "${man}/${PN}.1" || die
	cp -v -- "${DISTDIR}/${P}.toml.man.5" "${man}/${PN}.toml.5" || die
}

src_install() {
	cargo_src_install

	doman "${T}/man"/*

	local exe="${ED}/usr/bin/${PN}-completions"
	local completions="${S}/completions"
	mkdir -p "${completions}" || die
	ebegin "generating completions"
	OUT_DIR="${completions}" "${exe}"
	eend "${?}" 'failed to generate completions' || die "${_}"
	rm "${exe}" || die

	# bash-completion
	newbashcomp "completions/${PN}.bash" "${PN}"

	# zsh-completion
	dozshcomp "completions/_${PN}"

	# fish-completion
	dofishcomp "completions/${PN}.fish"
}
