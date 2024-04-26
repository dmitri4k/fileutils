# Define the parent directory from which to start
$parentDirectoryPath = "C:\Ulbi\zip"

# Get all second-level directories
$secondLevelDirs = Get-ChildItem -Path $parentDirectoryPath -Directory | ForEach-Object { Get-ChildItem -Path $_.FullName -Directory }

$totalDirs = $secondLevelDirs.Count
$dirsProcessed = 0

foreach ($dir in $secondLevelDirs) {
    $dirsProcessed++
    $percentComplete = ($dirsProcessed / $totalDirs) * 100

    # Update the progress bar
    Write-Progress -PercentComplete $percentComplete -Activity "Deleting empty second-level folders" -Status "Processing $($dir.FullName)"

    # Check if the directory is empty
    $isEmpty = !(Get-ChildItem -Path $dir.FullName)

    if ($isEmpty) {
        # Remove the directory if empty
        Remove-Item -Path $dir.FullName -Force
    }
}

Write-Progress -PercentComplete 100 -Activity "Deleting empty second-level folders" -Status "Completed" -Completed
Write-Host "Processed $dirsProcessed directories."