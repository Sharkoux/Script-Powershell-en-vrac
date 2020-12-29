Add-Type -AssemblyName System.speech
$speak = New-Object System.Speech.Synthesis.SpeechSynthesizer

$speak.Speak("Bonjour! Qui es tu?")
$var1 = read-host "Bonjour! Qui es tu?"

$speak.Speak("Hello, $var1!")
$speak.Speak("Quel âge as tu $var1 ?")
$var2 = Read-Host "Quel âge as-tu $var1 ?"

if ( $var2 -lt 18) {
$speak.Speak("Oh tu es jeune $var1!")
}
else {
$speak.Speak("Tu as l'air bien sage pour ton âge $var1!")
}
$speak.Speak("Veux tu jouer à un jeu $var1? ")
$var3 = Read-Host "Veux tu jouer à un jeu $var1? Y/N"

if ( $var3 -eq "Y") {
$speak.Speak("Commençons $var1! Choisis un nombre entre 1 et 40.") 
}
else {
$speak.Speak("Oh tu n'es pas très drôle $var1... Je vais bouder dans mon dossier.")
exit 
}
$nombre = Get-Random -Minimum 0 -Maximum 40

$var4 = Read-Host "Nombre choisis = "

while ($var4 -ne $nombre ) {
    if ( $var4 -le $nombre ) { 
        $speak.Speak("Plus haut! Essai encore.")
        }
    if ( $var4 -ge $nombre ) {
        $speak.Speak("Plus bas! Essai encore.")
        }
    if ( $var4 -gt 40 ) {
        $speak.Speak("Tu es stupide ou quoi?")
        }
$var4 = Read-Host "Nombre choisis = "
}
$speak.Speak("Bravo! Tu as gagné mon jeu, le nombre que j'avais choisi était bien $nombre!")
$speak.Speak("Tu voudrais jouer à un autre jeu? ")

$var5 = Read-Host "Veux tu jouer à autre chose? Y/N "

if ($var5 -eq "Y" ) {
     $speak.Speak("AHAHAH tu es vraiment crédule! ")
     exit
    }
else {
    $speak.Speak("Tu as bien raison, je vais dormir dans la corbeille!")
    exit
}
