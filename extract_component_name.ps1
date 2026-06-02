$b = [System.IO.File]::ReadAllBytes('E:/netmiror/app/src/main/assets/index.android.bundle')
$s = [System.Text.Encoding]::ASCII.GetString($b)
$idx = $s.IndexOf("registerComponent")
if ($idx -ge 0) {
    # Search for the string argument before or after
    $start = [Math]::Max(0, $idx - 500)
    $len = [Math]::Min(1000, $s.Length - $start)
    $context = $s.Substring($start, $len)
    Write-Output $context
} else {
    Write-Output "Not found"
}
