

$contenu3 = read-host "Voulez vous continuer? [OUI]? "
while ($contenu3 -eq "OUI") {
$crypt = read-host "Quel est la crypto dont vous recherchez la valeur? (Exemple: BTC/ETH/USDT ect)"

$fiat = Read-Host "En quel monnaie fiat souhaitez vous voir cette valeur? (Exemple: EUR/USDT)"


$contenu = Invoke-RestMethod -Uri "https://api.binance.com/api/v3/ticker/price?symbol=$crypt$fiat" -Method get  

$contenu2 = "$contenu".Split("}").Split("=").Split()[-2]

Read-Host "La valeur de $crypt est de $contenu2 $fiat ! "

$contenu3 = read-host "Voulez vous continuer? [OUI]"
}
