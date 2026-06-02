$b = [System.IO.File]::ReadAllBytes('E:/netmiror/app/classes.dex')
$s = [System.Text.Encoding]::ASCII.GetString($b)
$matches = [regex]::Matches($s, 'https?://[a-zA-Z0-9\./_-]+')
foreach ($m in $matches) {
    Write-Output $m.Value
}
