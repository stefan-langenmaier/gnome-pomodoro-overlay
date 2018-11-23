# Copyright 1999-2018 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

VALA_MIN_API_VERSION="0.36"
VALA_USE_DEPEND="vapigen"

inherit autotools vala gnome2 git-r3
EGIT_REPO_URI="https://github.com/codito/gnome-pomodoro"
# newer version need >vala-40
EGIT_BRANCH="gnome-3.26"

DESCRIPTION="Time management utility for GNOME based on the pomodoro technique"
HOMEPAGE="http://gnomepomodoro.org"
SRC_URI=""

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

COMMON_DEPEND="
	>=gnome-base/gsettings-desktop-schemas-3.20
	>=dev-libs/gom-0.3
	>=dev-libs/glib-2.38:2
	>=x11-libs/gtk+-3.20:3=[introspection]
	>=dev-libs/libpeas-1.5.0
	>=media-libs/gstreamer-1.0.10
	>=media-libs/libcanberra-0.30
"
DEPEND="
	${COMMON_DEPEND}
	$(vala_depend)
"

RDEPEND="${COMMON_DEPEND}"

src_prepare() {
	eautoreconf
	gnome2_src_prepare
	vala_src_prepare
}
