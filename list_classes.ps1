$b = [System.IO.File]::ReadAllBytes('E:/netmiror/app/classes.dex')
$s = [System.Text.Encoding]::ASCII.GetString($b)
$matches = [regex]::Matches($s, 'Lapp/netmirror/netmirrornew/([\w\$/]+);')
$classes = @()
foreach ($m in $matches) {
    $classes += $m.Groups[1].Value.Replace("/", ".")
}
$classes | Sort-Object -Unique
