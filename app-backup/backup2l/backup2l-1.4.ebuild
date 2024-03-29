# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

HOMEPAGE="http://sourceforge.net/projects/backup2l/"
SRC_URI="mirror://sourceforge/backup2l/${P/-/_}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND=""
RDEPEND=""

src_install() {
	
	PREFIX=/usr
	PREFIX_BIN=/usr/bin
	PREFIX_CONF=/etc

	dodir $PREFIX_CONF/cron.daily
	CRON_FILE=$PREFIX_CONF/cron.daily
	
	PROG_FILES="$PREFIX_BIN/backup2l $PREFIX/man/man8/backup2l.8.gz"
	CONF_FILES="$PREFIX_CONF/backup2l.conf $CRON_FILE"

	elog "Installing program"
	exeinto /usr/local/bin
	doexe backup2l #$PREFIX_BIN
	
	elog "Installing manual"
	doman backup2l.8 
	
	elog "Installing sample configuration file"
	insinto $PREFIX_CONF
	newins first-time.conf backup2l.conf

	elog "Installing sample cron task"
	insinto $CRON_FILE
	doins zz-backup2l 
	elog "Configuration files installed."
}

pkg_postinst() {
	ewarn "Make sure you edit /etc/backupl.conf prior doing anything else..."
	ewarn "You will have to define what to backup and where at least."
	ewarn "Read the entire configuration file, one line must be uncommented."
}

