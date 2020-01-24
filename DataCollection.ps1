Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

while ($true) {
    try {
        $date = (Get-Date).ToString("o")

        $data = &python3 modem-technicolour-httpstats.py
        $data = $data | ForEach-Object { $_.Trim() } | Where-Object { $_ }
        $hashtable = [ordered] @{ Date = $date }
        for ($i = 0; $i -lt $data.Count; $i += 2) {
            $hashtable.($data[$i]) = $data[$i + 1]
        }
        "$date Query result: $($hashtable."DSL Status")"
        [PSCustomObject] $hashtable | Export-Csv -Path Data.csv -Append -Force
    } catch {
        "Caught exception and continuing"
        Add-Content Error.txt "$date $($data -join " - ")"
    }
    Start-Sleep -Seconds 30
}


<#
# To convert that format to one you can use with charts

$content = Import-Csv Data.csv
$content | ForEach-Object {
    $up, $down = $_."Maximum Line rate".Replace("Mbps", "").Trim() -split "\s+"
    $_.PSObject.Properties.Remove("Maximum Line rate")
    $_ | Add-Member -MemberType NoteProperty -Name "Maximum Line rate up" -Value $up
    $_ | Add-Member -MemberType NoteProperty -Name "Maximum Line rate down" -Value $down

    $up, $down = $_."Line Rate".Replace("Mbps", "").Trim() -split "\s+"
    $_.PSObject.Properties.Remove("Line Rate")
    $_ | Add-Member -MemberType NoteProperty -Name "Line Rate up" -Value $up
    $_ | Add-Member -MemberType NoteProperty -Name "Line Rate down" -Value $down

}
$content | Export-Csv Data_Formatted.csv 
#>
