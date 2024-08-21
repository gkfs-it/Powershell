$app = "rclone"

if (Get-Process -Name $app -ErrorAction SilentlyContinue) {
    Write-Output "$app is running."
} else {
	 $output = & "C:\jobs\rclone\rclone.exe" sync -c d:\Share\Formula.Smaku MS:Formula.Smaku
    Write-Output $output
}