TERMUX_PKG_HOMEPAGE=https://gmic.eu
TERMUX_PKG_DESCRIPTION="Full-featured framework for image processing"
TERMUX_PKG_LICENSE="CeCILL-2.1"
TERMUX_PKG_VERSION=2.5.2
TERMUX_PKG_REVISION=1
TERMUX_PKG_SHA256=8a954d2bbb4bd1bacb3ee99ded7e3c57ee340e04a9d0c3415006d574d9b61c4d
TERMUX_PKG_SRCURL=https://gmic.eu/files/source/gmic_$TERMUX_PKG_VERSION.tar.gz
TERMUX_PKG_DEPENDS="graphicsmagick++, libcurl, fftw, libpng, libjpeg-turbo, libtiff"
TERMUX_PKG_BUILD_DEPENDS="graphicsmagick-dev"
TERMUX_PKG_NO_DEVELSPLIT=yes
TERMUX_PKG_BUILD_IN_SRC=yes

termux_step_configure() {
	return 0;
}

termux_step_make() {
	cd src/
	make cli
}

termux_step_make_install() {
	cp src/gmic $TERMUX_PREFIX/bin/gmic
	cp src/*.h $TERMUX_PREFIX/include/
	gunzip man/gmic.1.gz
	cp man/gmic.1 $TERMUX_PREFIX/share/man/man1
}

