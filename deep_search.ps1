param([string]$query)
$b = [System.IO.File]::ReadAllBytes('E:/netmiror/app/src/main/assets/index.android.bundle')
$s = [System.Text.Encoding]::ASCII.GetString($b)
$matches = [regex]::Matches($s, "(?i).*$query.*")
if ($matches.Count -gt 0) {
    Write-Output "Found $($matches.Count) occurrences of '$query':"
    foreach ($m in $matches | Select-Object -First 5) {
        $start = [Math]::Max(0, $m.Index - 50)
        $len = [Math]::Min(100, $s.Length - $start)
        Write-Output "---"
        Write-Output $s.Substring($start, $len)
    }
} else {
    Write-Output "'$query' not found"
}
