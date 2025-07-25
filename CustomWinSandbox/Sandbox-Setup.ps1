# Install Chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

choco install thunderbird sharex -y

# Set up presentation type to display message boxes
Add-Type -AssemblyName PresentationCore,PresentationFramework
[System.Windows.MessageBox]::Show('Sandbox Setup complete!', 'Sandbox Setup', 'OK', 'Information')