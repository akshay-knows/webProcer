$b = [System.IO.File]::ReadAllBytes('E:/netmiror/app/src/main/assets/index.android.bundle')
$s = [System.Text.Encoding]::ASCII.GetString($b)
$matches = [regex]::Matches($s, 'https?://[a-zA-Z0-9\./_-]+')
foreach ($m in $matches) {
    Write-Output $m.Value
}
