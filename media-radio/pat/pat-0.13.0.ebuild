# Copyright 2021-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
EGO_PN=github.com/la5nta/pat

inherit go-module

EGO_SUM=(
	"github.com/adrg/xdg v0.3.3"
	"github.com/adrg/xdg v0.3.3/go.mod"
	"github.com/albenik/go-serial/v2 v2.4.0/go.mod"
	"github.com/albenik/go-serial/v2 v2.5.0"
	"github.com/albenik/go-serial/v2 v2.5.0/go.mod"
	"github.com/aymerick/douceur v0.2.0"
	"github.com/aymerick/douceur v0.2.0/go.mod"
	"github.com/bndr/gotabulate v1.1.3-0.20170315142410-bc555436bfd5"
	"github.com/bndr/gotabulate v1.1.3-0.20170315142410-bc555436bfd5/go.mod"
	"github.com/creack/goselect v0.1.2"
	"github.com/creack/goselect v0.1.2/go.mod"
	"github.com/creack/pty v1.1.9/go.mod"
	"github.com/davecgh/go-spew v1.1.0/go.mod"
	"github.com/davecgh/go-spew v1.1.1"
	"github.com/davecgh/go-spew v1.1.1/go.mod"
	"github.com/dimchansky/utfbom v1.1.1"
	"github.com/dimchansky/utfbom v1.1.1/go.mod"
	"github.com/fsnotify/fsnotify v1.4.9"
	"github.com/fsnotify/fsnotify v1.4.9/go.mod"
	"github.com/gorhill/cronexpr v0.0.0-20180427100037-88b0669f7d75"
	"github.com/gorhill/cronexpr v0.0.0-20180427100037-88b0669f7d75/go.mod"
	"github.com/gorilla/css v1.0.0"
	"github.com/gorilla/css v1.0.0/go.mod"
	"github.com/gorilla/mux v1.8.0"
	"github.com/gorilla/mux v1.8.0/go.mod"
	"github.com/gorilla/websocket v1.4.2"
	"github.com/gorilla/websocket v1.4.2/go.mod"
	"github.com/harenber/ptc-go/v2 v2.2.3"
	"github.com/harenber/ptc-go/v2 v2.2.3/go.mod"
	"github.com/howeyc/crc16 v0.0.0-20171223171357-2b2a61e366a6"
	"github.com/howeyc/crc16 v0.0.0-20171223171357-2b2a61e366a6/go.mod"
	"github.com/howeyc/gopass v0.0.0-20190910152052-7cb4b85ec19c"
	"github.com/howeyc/gopass v0.0.0-20190910152052-7cb4b85ec19c/go.mod"
	"github.com/imdario/mergo v0.3.12"
	"github.com/imdario/mergo v0.3.12/go.mod"
	"github.com/kr/pretty v0.2.1/go.mod"
	"github.com/kr/pty v1.1.1/go.mod"
	"github.com/kr/text v0.1.0/go.mod"
	"github.com/kr/text v0.2.0/go.mod"
	"github.com/la5nta/wl2k-go v0.7.3/go.mod"
	"github.com/la5nta/wl2k-go v0.9.2/go.mod"
	"github.com/la5nta/wl2k-go v0.10.0"
	"github.com/la5nta/wl2k-go v0.10.0/go.mod"
	"github.com/mattn/go-runewidth v0.0.3/go.mod"
	"github.com/mattn/go-runewidth v0.0.13"
	"github.com/mattn/go-runewidth v0.0.13/go.mod"
	"github.com/microcosm-cc/bluemonday v1.0.16"
	"github.com/microcosm-cc/bluemonday v1.0.16/go.mod"
	"github.com/n8jja/Pat-Vara/vara v0.0.0-20220513234311-0b0963c08629"
	"github.com/n8jja/Pat-Vara/vara v0.0.0-20220513234311-0b0963c08629/go.mod"
	"github.com/nfnt/resize v0.0.0-20180221191011-83c6a9932646"
	"github.com/nfnt/resize v0.0.0-20180221191011-83c6a9932646/go.mod"
	"github.com/paulrosania/go-charset v0.0.0-20151028000031-621bb39fcc83/go.mod"
	"github.com/paulrosania/go-charset v0.0.0-20190326053356-55c9d7a5834c"
	"github.com/paulrosania/go-charset v0.0.0-20190326053356-55c9d7a5834c/go.mod"
	"github.com/pd0mz/go-maidenhead v1.0.0"
	"github.com/pd0mz/go-maidenhead v1.0.0/go.mod"
	"github.com/peterh/liner v1.2.1"
	"github.com/peterh/liner v1.2.1/go.mod"
	"github.com/pmezard/go-difflib v1.0.0"
	"github.com/pmezard/go-difflib v1.0.0/go.mod"
	"github.com/rivo/uniseg v0.2.0"
	"github.com/rivo/uniseg v0.2.0/go.mod"
	"github.com/spf13/pflag v1.0.5"
	"github.com/spf13/pflag v1.0.5/go.mod"
	"github.com/stretchr/objx v0.1.0/go.mod"
	"github.com/stretchr/testify v1.3.0/go.mod"
	"github.com/stretchr/testify v1.7.0"
	"github.com/stretchr/testify v1.7.0/go.mod"
	"github.com/tarm/goserial v0.0.0-20151007205400-b3440c3c6355/go.mod"
	"go.uber.org/atomic v1.7.0/go.mod"
	"go.uber.org/atomic v1.9.0"
	"go.uber.org/atomic v1.9.0/go.mod"
	"go.uber.org/multierr v1.6.0/go.mod"
	"go.uber.org/multierr v1.7.0"
	"go.uber.org/multierr v1.7.0/go.mod"
	"golang.org/x/crypto v0.0.0-20210813211128-0a44fdfbc16e"
	"golang.org/x/crypto v0.0.0-20210813211128-0a44fdfbc16e/go.mod"
	"golang.org/x/net v0.0.0-20210226172049-e18ecbb05110/go.mod"
	"golang.org/x/net v0.0.0-20210614182718-04defd469f4e/go.mod"
	"golang.org/x/net v0.0.0-20210813160813-60bc85c4be6d"
	"golang.org/x/net v0.0.0-20210813160813-60bc85c4be6d/go.mod"
	"golang.org/x/sys v0.0.0-20191005200804-aed5e4c7ecf9/go.mod"
	"golang.org/x/sys v0.0.0-20201119102817-f84b799fce68/go.mod"
	"golang.org/x/sys v0.0.0-20210223212115-eede4237b368/go.mod"
	"golang.org/x/sys v0.0.0-20210423082822-04245dca01da/go.mod"
	"golang.org/x/sys v0.0.0-20210615035016-665e8c7367d1/go.mod"
	"golang.org/x/sys v0.0.0-20211216021012-1d35b9e2eb4e"
	"golang.org/x/sys v0.0.0-20211216021012-1d35b9e2eb4e/go.mod"
	"golang.org/x/term v0.0.0-20201126162022-7de9c90e9dd1/go.mod"
	"golang.org/x/term v0.0.0-20210615171337-6886f2dfbf5b"
	"golang.org/x/term v0.0.0-20210615171337-6886f2dfbf5b/go.mod"
	"golang.org/x/text v0.3.3/go.mod"
	"golang.org/x/text v0.3.6/go.mod"
	"golang.org/x/tools v0.0.0-20180917221912-90fa682c2a6e/go.mod"
	"gopkg.in/check.v1 v0.0.0-20161208181325-20d25e280405/go.mod"
	"gopkg.in/check.v1 v1.0.0-20201130134442-10cb98267c6c/go.mod"
	"gopkg.in/yaml.v2 v2.3.0"
	"gopkg.in/yaml.v2 v2.3.0/go.mod"
	"gopkg.in/yaml.v3 v3.0.0-20200313102051-9f266ea9e77c/go.mod"
	"gopkg.in/yaml.v3 v3.0.0-20210107192922-496545a6307b"
	"gopkg.in/yaml.v3 v3.0.0-20210107192922-496545a6307b/go.mod"
)

go-module_set_globals

DESCRIPTION="Cross platform Winlink client"
HOMEPAGE="https://getpat.io/"
SRC_URI="
	https://${EGO_PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz
	${EGO_SUM_SRC_URI}
"

LICENSE="Apache-2.0 BSD ISC MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="dev-libs/libax25"
RDEPEND="${DEPEND}"
BDEPEND=""

src_compile() {
	set -- go build -tags libax25 ${EGO_PN}
	echo "$@"
	"$@" || die
}

src_install() {
	dobin pat
	dodoc README.md
	doman man/*.1
}
