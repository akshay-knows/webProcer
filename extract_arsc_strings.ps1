$b = [System.IO.File]::ReadAllBytes('E:/netmiror/app/resources.arsc')
$s = [System.Text.Encoding]::ASCII.GetString($b)
# Match strings between 4 and 100 chars, printable ASCII
$matches = [regex]::Matches($s, '[ -~]{4,100}')
$unique = $matches | Select-Object -ExpandProperty Value | Sort-Object -Unique
foreach ($u in $unique) {
    if ($u -match 'ad' -or $u -match 'http' -or $u -match 'mirror') {
        Write-Output $u
    }
}
