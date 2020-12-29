$result = Invoke-RestMethod https://us.battle.net/oauth/token -Method GET -Body @{client_id=""; client_secret=""; grant_type="client_credentials"} -ErrorAction STOP
if ($result.access_token){
        Write-Output "Updated Authorization Token"
        $result
        $global:accessToken = $result.access_token}
        

$item = read-host "Quel item chercher? "

$item2 = Select-String -Path .\Wow.csv -Pattern "$item"

$var1 = $item2 | where {$_ -ne "$null" } | Select-Object -Index 0
$var2= $item2 | where {$_ -ne "$null" } | Select-Object -Index 1
$var3 = $item2 | where {$_ -ne "$null" } | Select-Object -Index 2
$var4 = $item2 | where {$_ -ne "$null" } | Select-Object -Index 3 

Write-host "$var1".Split(";")[-1] "1?"
Write-host "$var2".Split(";")[-1] "2?"
Write-host "$var3".Split(";")[-1] "3?"
Write-host "$var4".Split(";")[-1] "4?"

$choix = Read-Host "Quel choix prendre?"

if ($choix -eq "1") {
	$itemfin = "$var1".Split(";"":")[-2]
}
if ($choix -eq "2") {
	$itemfin = "$var2".Split(";"":")[-2]
}
if ($choix -eq "3") {
	$itemfin = "$var3".Split(";"":")[-2]
}
if ($choix -eq "4") {
	$itemfin = "$var4".Split(";"":")[-2]
}

Invoke-RestMethod https://eu.api.blizzard.com/data/wow/connected-realm/1086/auctions?namespace=dynamic-eu"&"locale=fr-FR"&"access_token="$"access_token -Method Get -Headers @{"Authorization" = "Bearer $accessToken"} -Outfile text.txt

$item3 = Get-Content -Path .\text.txt

"$item3".Split(",") > text.csv

$item4 = Select-String -Path .\text.csv -Pattern "`"id`":$itemfin" -SimpleMatch -Context 0,4


$item7 = "$item4".Split() | Select-String -Pattern "unit_price" 
$varia11= $item7 | where {$_ -ne "$null" } | Select-Object -Index 0
$final11 = "$varia11".Split(":")[-1] 
$finalit11 ="$final11".Substring(0,$final11.Length-4)
$varia22= $item7 | where {$_ -ne "$null" } | Select-Object -Index 1
$final22 = "$varia22".Split(":")[-1]
$finalit22 ="$final22".Substring(0,$final22.Length-4)
$varia33 = $item7 | where {$_ -ne "$null" } | Select-Object -Index 2
$final33 = "$varia33".Split(":")[-1]
$finalit33 ="$final33".Substring(0,$final33.Length-4)
$varia44 = $item7 | where {$_ -ne "$null" } | Select-Object -Index 3
$final44 = "$varia44".Split(":")[-1]
$finalit44 ="$final44".Substring(0,$final44.Length-4)
$varia55 = $item7 | where {$_ -ne "$null" } | Select-Object -Index 4
$final55 = "$varia55".Split(":")[-1] 
$finalit55 ="$final55".Substring(0,$final55.Length-4)
$calcul6 = @("$finalit11", "$finalit22", "$finalit33", "$finalit44", "$finalit55") | Sort-Object | Select-Object -Index 0
$olol2 = $item7.count -1
$denier22 = $item7 | Select-Object -Index $olol2
$denier11= "$denier22".Split(":")[-1]
$denier25 = $denier11.Substring(0,$denier11.Length-4)

if ($calcul6 -lt $denier25) {
    $test1 = $calcul6
    }
else {
    $test1 = $denier25
    }

$item5 = "$item4".split() | Select-String -Pattern "buyout" 
$varia1= $item5 | where {$_ -ne "$null" } | Select-Object -Index 0
$final1 = "$varia1".Split(":")[-1] 
$finalit1 ="$final1".Substring(0,$final1.Length-4)
$varia2= $item5 | where {$_ -ne "$null" } | Select-Object -Index 1
$final2 = "$varia2".Split(":")[-1]
$finalit2 ="$final2".Substring(0,$final2.Length-4)
$varia3 = $item5 | where {$_ -ne "$null" } | Select-Object -Index 2
$final3 = "$varia3".Split(":")[-1]
$finalit3 ="$final3".Substring(0,$final3.Length-4)
$varia4 = $item5 | where {$_ -ne "$null" } | Select-Object -Index 3
$final4 = "$varia4".Split(":")[-1]
$finalit4 ="$final4".Substring(0,$final4.Length-4)
$varia5 = $item5 | where {$_ -ne "$null" } | Select-Object -Index 4
$final5 = "$varia5".Split(":")[-1] 
$finalit5 ="$final5".Substring(0,$final5.Length-4)
$varia6= $item5 | where {$_ -ne "$null" } | Select-Object -Index 5
$final6 = "$varia6".Split(":")[-1] 
$finalit6 ="$final6".Substring(0,$final6.Length-4)
$varia7= $item5 | where {$_ -ne "$null" } | Select-Object -Index 6
$final7 = "$varia7".Split(":")[-1]
$finalit7 ="$final7".Substring(0,$final7.Length-4)
$varia8 = $item5 | where {$_ -ne "$null" } | Select-Object -Index 7
$final8 = "$varia8".Split(":")[-1]
$finalit8 ="$final8".Substring(0,$final8.Length-4)
$varia9 = $item5 | where {$_ -ne "$null" } | Select-Object -Index 9
$final9 = "$varia9".Split(":")[-1]
$finalit9 ="$final9".Substring(0,$final9.Length-4)
$varia12 = $item5 | where {$_ -ne "$null" } | Select-Object -Index 12
$final12 = "$varia12".Split(":")[-1] 
$finalit12 ="$final12".Substring(0,$final12.Length-4)
$varia15= $item5 | where {$_ -ne "$null" } | Select-Object -Index 15
$final15= "$varia15".Split(":")[-1] 
$finalit15 ="$final15".Substring(0,$final15.Length-4)
$varia21= $item5 | where {$_ -ne "$null" } | Select-Object -Index 21
$final21= "$varia21".Split(":")[-1]
$finalit21 ="$final21".Substring(0,$final21.Length-4)
$calcul = @("$finalit1", "$finalit2", "$finalit3", "$finalit4", "$finalit5", "$finalit6", "$finalit7", "$finalit8", "$finalit9", "$finalit12", "$finalit15", "$finalit21" ) | Sort-Object | Select-Object -Index 0
$olol = $item5.count -1
$denier = $item5 | Select-Object -Index $olol
$denier1= "$denier".Split(":")[-1]
$denier2 = $denier1.Substring(0,$denier1.Length-4)

if ($calcul -lt $denier2) {
    $test2 = $calcul
    }
else {
    $test2 = $denier2
    }


read-host = "La valeur de cette objet est de $test2 pièces d'or si c'est un item (ou $test1 pièces d'or si c'est une ressource)."