$ErrorActionPreference = "Stop"

$gra = Get-Content -LiteralPath "steam/gra.json" -Raw | ConvertFrom-Json

$parametry = @{
    appid = $gra.appid
    languages = @('all')
    num_per_page = 1
    purchase_type = 1
} | ConvertTo-Json -Compress

$body = @{
    input_json = $parametry
}

$url = "https://api.steampowered.com/IUserReviewsService/GetAppReviews/v1/"

$response = Invoke-RestMethod -Uri $url -Body $body -UseBasicParsing -TimeoutSec 20

Write-Output "Gra: $($gra.nazwa)"
Write-Output "Ocena graczy: $($response.response.query_summary.review_score_desc)"
Write-Output "Liczba recenzji: $($response.response.query_summary.total_reviews)"
