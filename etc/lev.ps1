# Get all second-level directories from the current location
$secondLevelDirs = Get-ChildItem -Directory | ForEach-Object { Get-ChildItem -Path $_.FullName -Directory }

$total = $secondLevelDirs.Count
$counter = 0

# Go through each second-level directory
foreach ($secondLevelDir in $secondLevelDirs) {
    $counter++
    $progress = [math]::Round(($counter / $total) * 100, 2)
    
    Write-Progress -Activity "Moving contents to parent folder..." -Status "$progress% Complete ($counter/$total)" -PercentComplete $progress
    
    # Move all the items from the second-level directories to their respective parent directory
    Get-ChildItem -Path $secondLevelDir.FullName | ForEach-Object {
        $destinationPath = $secondLevelDir.Parent.FullName
        $targetPath = Join-Path -Path $destinationPath -ChildPath $_.Name

        # Check if a file or folder with the same name already exists in the destination
        if (-Not (Test-Path $targetPath)) {
            # If no such file/folder exists, move the item
            Move-Item -Path $_.FullName -Destination $destinationPath
        } else {
            Write-Warning "Item $($_.Name) already exists in $destinationPath and will not be moved."
        }
    }
}
Write-Progress -Activity "Move Completed" -Completed

Write-Host "All contents have been moved to their respective parent folders."