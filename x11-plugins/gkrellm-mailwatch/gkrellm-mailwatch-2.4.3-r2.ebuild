# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
inherit gkrellm-plugin toolchain-funcs

DESCRIPTION="A GKrellM2 plugin that shows the status of additional mail boxes"
SRC_URI="http://gkrellm.luon.net/files/${P}.tar.gz"
HOMEPAGE="http://gkrellm.luon.net/mailwatch.php"

SLOT="2"
LICENSE="GPL-2"
KEYWORDS="~alpha ~amd64 ~ppc ~sparc ~x86"
IUSE=""

PLUGIN_SO=mailwatch.so
S="${WORKDIR}/${PN}"

RDEPEND="app-admin/gkrellm[X]"

PATCHES=(
	"${FILESDIR}"/2.4.3-0001-Respect-LDFLAGS.patch
	"${FILESDIR}"/2.4.3-0002-Use-gkrellm_gkd_string_width.patch
	"${FILESDIR}"/2.4.3-0003-Remove-a-few-more-GCC-warnings.patch
	"${FILESDIR}"/2.4.3-0004-Do-not-force-O2-in-CFLAGS.patch
)

src_compile() {
	tc-export CC
	default_src_compile
}
