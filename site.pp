node default {
	$osfamily_downcase = "gentoo"

	include "os::${osfamily_downcase}"
	include os::all
}
