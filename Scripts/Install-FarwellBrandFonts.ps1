# Folder in the GitHub repo for the Prompt font
$promptUri = 'https://github.com/google/fonts/raw/refs/heads/main/ofl/prompt/'

$geologicaUri = 'https://github.com/google/fonts/raw/refs/heads/main/ofl/geologica/'

# Create directory that the TTF files are downloaded to
$fontDest = "C:\font_out\"
Write-Host "Creating temporary font destination..."
mkdir $fontDest | out-null

# Array defining params for the Invoke-WebRequest sequence that tells it which URL to look for and the output destination
# A better explanation is that this sets multiple inputs for the -Uri and -OutFile parameters. 
$files = @(
    @{
        Uri = "$promptUri/Prompt-Black.ttf"
        OutFile = "$fontDest\Prompt-Black.ttf"
    },
    @{
        Uri = "$promptUri/Prompt-BlackItalic.ttf"
        OutFile = "$fontDest\Prompt-BlackItalic.ttf"
    },
    @{
        Uri = "$promptUri/Prompt-Bold.ttf"
        OutFile = "$fontDest\Prompt-Bold.ttf"
    },
    @{
        Uri = "$promptUri/Prompt-BoldItalic.ttf"
        OutFile = "$fontDest\Prompt-BoldItalic.ttf"
    },
    @{
        Uri = "$promptUri/Prompt-ExtraBold.ttf"
        OutFile = "$fontDest\Prompt-ExtraBold.ttf"
    },
    @{
        Uri = "$promptUri/Prompt-ExtraBoldItalic.ttf"
        OutFile = "$fontDest\Prompt-ExtraBoldItalic.ttf"
    },
    @{
        Uri = "$promptUri/Prompt-ExtraLight.ttf"
        OutFile = "$fontDest\Prompt-ExtraLight.ttf"
    },
    @{
        Uri = "$promptUri/Prompt-ExtraLightItalic.ttf"
        OutFile = "$fontDest\Prompt-ExtraLightItalic.ttf"
    },
    @{
        Uri = "$promptUri/Prompt-Italic.ttf"
        OutFile = "$fontDest\Prompt-Italic.ttf"
    },
    @{
        Uri = "$promptUri/Prompt-Light.ttf"
        OutFile = "$fontDest\Prompt-Light.ttf"
    },
    @{
        Uri = "$promptUri/Prompt-LightItalic.ttf"
        OutFile = "$fontDest\Prompt-LightItalic.ttf"
    },
    @{
        Uri = "$promptUri/Prompt-Medium.ttf"
        OutFile = "$fontDest\Prompt-Medium.ttf"
    },
    @{
        Uri = "$promptUri/Prompt-MediumItalic.ttf"
        OutFile = "$fontDest\Prompt-MediumItalic.ttf"
    },
    @{
        Uri = "$promptUri/Prompt-Regular.ttf"
        OutFile = "$fontDest\Prompt-Regular.ttf"
    },
    @{
        Uri = "$promptUri/Prompt-SemiBold.ttf"
        OutFile = "$fontDest\Prompt-SemiBold.ttf"
    },
    @{
        Uri = "$promptUri/Prompt-SemiBoldItalic.ttf"
        OutFile = "$fontDest\Prompt-SemiBoldItalic.ttf"
    },
    @{
        Uri = "$promptUri/Prompt-Thin.ttf"
        OutFile = "$fontDest\Prompt-Thin.ttf"
    },
    @{
        Uri = "$promptUri/Prompt-ThinItalic.ttf"
        OutFile = "$fontDest\Prompt-ThinItalic.ttf"
    },
    @{
        Uri = "$geologicaUri/Geologica[CRSV,SHRP,slnt,wght].ttf"
        OutFile = "$fontDest\Geologica-CRSV,SHRP,slnt,wght.ttf"
    }
)

# Stores the download jobs
$jobs = @()

# Starts background jobs for each file in the $files array
foreach ($file in $files){
    $jobs += start-job -name $file.OutFile -ScriptBlock {
        $params = $Using:file     # Uses an entry in the $files array as the parameters for Invoke-WebRequest
        Invoke-WebRequest @params
    }
}


# Notes what's happening and waits for the jobs to finish
Write-Host "Downloading Prompt and Geologica fonts..."
Wait-Job -Job $jobs

# Collect job results and reports any errors
foreach ($job in $jobs){
    Receive-Job -Job $job
}

# Stores the list of font files
$fonts = Get-ChildItem -Path $fontDest -Include '*.ttf' -recurse

# Set location for the Windows Fonts folder
$winfonts = "C:\Windows\Fonts"

# Registry location for fonts
$fontReg = "HKLM:\Software\Microsoft\Windows NT\CurrentVersion\Fonts"

foreach ($font in $fonts) {
    try {
        Copy-Item $font "$winfonts"
        New-ItemProperty -Name $font.BaseName -Path "$fontReg" -PropertyType string -Value $font.name -Force | Out-Null
    }

    catch {
        Write-Output "Couldn't install fonts! Check if they're already installed."
        Exit
    }
}

# Clean up downloads folder
Write-Host "Cleaning up temporary fonts directory..."
Remove-Item -Path "$fontDest" -Recurse -Force | Out-Null