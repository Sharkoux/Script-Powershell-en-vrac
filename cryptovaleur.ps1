

$contenu3 = read-host "Voulez vous continuer? [OUI]? "
while ($contenu3 -eq "OUI") {
$crypt = read-host "Quel est la crypto dont vous recherchez la valeur? "

$fiat = Read-Host "En quel monnaie fiat souhaitez vous voir cette valeur? "

Invoke-RestMethod "https://api.blockchain.com/v3/exchange/tickers/$crypt-$fiat" -Method Get  -OutFile "D:\Bureau\test2.txt"

$contenu = Get-Content -Path D:\Bureau\test2.txt

$contenu2 = "$contenu".Split(",")[-1].Split(":""}")[-2] 

Read-Host "La valeur de $crypt est de $contenu2 $fiat ! "

$contenu3 = read-host "Voulez vous continuer? [OUI]"
}
