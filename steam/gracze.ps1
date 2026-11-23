$ErrorActionPreference = "Stop"

$gra = Get-Content -LiteralPath "steam/gra.json" -Raw | ConvertFrom-Json

$url = "https://api.steampowered.com/ISteamUserStats/GetNumberOfCurrentPlayers/v1/?appid=$($gra.appid)"

$response = Invoke-RestMethod -Uri $url -UseBasicParsing -TimeoutSec 20

Write-Output "Gra: $($gra.nazwa)"
Write-Output "Gra ID: $($gra.appid)"
Write-Output "Liczba graczy online: $($response.response.player_count)"
