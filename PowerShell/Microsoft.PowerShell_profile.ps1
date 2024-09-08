Import-Module Terminal-Icons
Import-Module PSReadLine
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineKeyHandler -Key Alt-k -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key Alt-j -Function HistorySearchForward

function commit ($message) {
        git add . 
        git commit -m $message 
        git push 
}

function whereis ($command) {
    Get-Command -Name $command -ErrorAction SilentlyContinue |
    Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}

