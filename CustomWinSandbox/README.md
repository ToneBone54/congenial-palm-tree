## Custom Windows Sandbox

These are some files from something I did at work to automatically set up a custom Windows Sandbox environment with certain apps. I was investigating a phishing email attachment and needed something to view EML files and pull the attachment out. I messed around with getting WinGet installed on it but decided on Chocolatey for the V1 because it's a little better. The only issue is that, from everything I can find, you can't set a default WSB file which is kinda dumb but that's Microsoft.


MS article for more information: https://learn.microsoft.com/en-us/windows/security/application-security/application-isolation/windows-sandbox/windows-sandbox-configure-using-wsb-file

### NOTE:

The ZIP file currently contains older versions of the WSB file and the PS script as I did some editing to those without updating the ZIP. Not having these changes won't hurt functionality, I just added a "Setup Complete" message box to the PS script because the script runs silently with the updated WSB file.