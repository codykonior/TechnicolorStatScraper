while ($true) {
    $date = (Get-Date).ToString("o")
    $data = &python3 modem-technicolour-httpstats.py
    $data = $data | ForEach-Object { $_.Trim() } | Where-Object { $_ }
    $hashtable = [ordered] @{ Date = $date }
    for ($i = 0; $i -lt $data.Count; $i += 2) {
        $hashtable.($data[$i]) = $data[$i + 1]
    }

    [PSCustomObject] $hashtable | Export-Csv -Path Data.txt -Append
    Start-Sleep -Seconds 30
}
