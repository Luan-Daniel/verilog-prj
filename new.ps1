if ($args.Count -ne 1) {
	Write-Host "Error: expected a directory path as argument"
	return $false
}
$newdir = $args[0]
New-Item -ItemType Directory -Path $newdir
@('src', 'prj', 'sim', 'doc').foreach({
	New-Item -ItemType Directory -Path "$newdir\\$_"
})
