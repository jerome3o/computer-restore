

function conda_env{
   (conda info) -match ".*active environment : (.+)" -replace "active environment : "
}

function prompt {
    $origLastExitCode = $LASTEXITCODE
    Write-Host 'PS ' -ForegroundColor Darkcyan -nonewline
    Write-VcsStatus

    $maxPathLength = 30
    $curPath = $ExecutionContext.SessionState.Path.CurrentLocation.Path
    if ($curPath.Length -gt $maxPathLength) {
        $curPath = '~' + $curPath.SubString($curPath.Length - $maxPathLength + 3)
    }
    $curPath += " $Env:CONDA_PROMPT_MODIFIER"

    Write-Host $curPath -ForegroundColor White
    $LASTEXITCODE = $origLastExitCode
    "$('>' * ($nestedPromptLevel + 1))"
}

# Enable git support
Import-Module 'C:\Users\j.swannack\Software\posh-git\src\posh-git.psd1'
$GitPromptSettings.AfterStatus = "]> "

nal npp "C:\Program Files (x86)\Notepad++\notepad++.exe"

function e {
  explorer .
}

function trello {
  start https://trello.com/b/k7AcZFG9/day-to-day
}

function abrv {
  start "\\rocketlab.local\users\apc\j.swannack\Documents\Onboarding\Rocket-Lab-abbreviations-list.pdf"
}

function activate_anaconda {
  & 'C:\ProgramData\Anaconda3\shell\condabin\conda-hook.ps1' ; conda activate 'C:\ProgramData\Anaconda3'
}

function src {
  conda activate base
  cd "C:\Users\j.swannack\Source"
}

function al {
  conda activate analysislibrary
  cd "C:\Users\j.swannack\Source\analysislibrary"
}

function pro {
  atom $profile
}

function refresh_gitignore {
  git rm -r --cached .
  git add .
  git commit -m "fixing .gitignore"
}
