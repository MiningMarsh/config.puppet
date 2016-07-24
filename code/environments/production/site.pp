node default {
	$osfamily_downcase = downcase($osfamily)

	include os::all
	include "os::${osfamily_downcase}"
}
