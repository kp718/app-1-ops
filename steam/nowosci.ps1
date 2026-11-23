$ErrorActionPreference = "Stop"

$gra = Get-Content -LiteralPath "steam/gra.json" -Raw | ConvertFrom-Json

$url = "https://api.steampowered.com/ISteamNews/GetNewsForApp/v2/?appid=$($gra.appid)&count=1&maxlength=300&feeds=steam_community_announcements"

$response = Invoke-RestMethod -Uri $url -UseBasicParsing -TimeoutSec 20

$news = $response.appnews.newsitems[0]

Write-Output "Gra: $($gra.nazwa)"
Write-Output "Tytul najnowszej wiadomosci: $($news.title)"
Write-Output "Link do wiadomosci: $($news.url)"
