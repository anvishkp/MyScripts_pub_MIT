oh-my-posh init pwsh --config 'https://github.com/JanDeDobbeleer/oh-my-posh/blob/main/themes/dracula.omp.json' | Invoke-Expression
Write-Host "Tip: Currently loaded dracula theme !!" -ForegroundColor Cyan
Write-Host "Tip: Use the command 'anvitheme' to select your oh-my-posh theme." -ForegroundColor Cyan
function anvitheme {
    $themes = @(
        @{Name='tokyo'; Url='https://github.com/JanDeDobbeleer/oh-my-posh/blob/main/themes/tokyo.omp.json'}
        @{Name='atomicBit'; Url='https://github.com/JanDeDobbeleer/oh-my-posh/blob/main/themes/atomicBit.omp.json'}
        @{Name='1_shell'; Url='https://github.com/JanDeDobbeleer/oh-my-posh/blob/main/themes/1_shell.omp.json'}
        @{Name='dracula'; Url='https://github.com/JanDeDobbeleer/oh-my-posh/blob/main/themes/dracula.omp.json'}
        # Add more themes here as needed
    )

    Write-Host "Select a theme:"
    for ($i = 0; $i -lt $themes.Count; $i++) {
        Write-Host "$($i+1). $($themes[$i].Name)"
    }

    $selection = Read-Host "Enter number"
    if ($selection -ge 1 -and $selection -le $themes.Count) {
        $themeUrl = $themes[$selection - 1].Url
        oh-my-posh init pwsh --config $themeUrl | Invoke-Expression  *>$null | Out-Null
        Write-Host "Theme '$($themes[$selection - 1].Name)' applied."
    }
    else {
        Write-Host "Invalid selection."
    }
}
