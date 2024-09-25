Import-Module Terminal-Icons
Import-Module PSReadLine
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineKeyHandler -Key Alt-k -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key Alt-j -Function HistorySearchForward


function nvimFolder {Set-Location -Path C:\Users\Hansel\AppData\Local\nvim}
Set-Alias -Name nconf -Value nvimFolder
Set-Alias -Name v -Value nvim

function commit ($message) {
        git add .
        git commit -m $message
        git push
}

function run ($file) {
        g++ $file
        ./a.exe
        rm a.exe
}

function whereis ($command) {
    Get-Command -Name $command -ErrorAction SilentlyContinue |
    Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}

function prompt {
  $loc = $executionContext.SessionState.Path.CurrentLocation;

$out = ""
  if ($loc.Provider.Name -eq "FileSystem") {
    $out += "$([char]27)]9;9;`"$($loc.ProviderPath)`"$([char]27)\"
  }
  $out += "PS $loc$('>' * ($nestedPromptLevel + 1)) ";
  return $out
}
