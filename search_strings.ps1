param([string]$query)
$b = [System.IO.File]::ReadAllBytes('E:/netmiror/app/src/main/assets/index.android.bundle')
$s = [System.Text.Encoding]::ASCII.GetString($b)
if ($s.Contains($query)) {
    $idx = $s.IndexOf($query)
    $start = [Math]::Max(0, $idx - 100)
    $len = [Math]::Min(200, $s.Length - $start)
    Write-Output "Found at $idx : "
    Write-Output $s.Substring($start, $len)
} else {
    Write-Output "Not found"
}
