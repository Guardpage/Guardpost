/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* */
/* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* */
/* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* */
$listener = [System.Net.Sockets.TcpListener]::new(1234)
$listener.Start()
$client = $listener.AcceptTcpClient()
$stream = $client.GetStream()
$reader = New-Object System.IO.StreamReader($stream)
$writer = New-object System.IO.StreamWriter($stream)
$writer.AutoFlush = $true
while ($client.Connected) {
	$command = Read-Host "Enter Command"
	if ($command -eq "exit") { break }
	$writer.WriteLine($command)
	$writer.Flush()

	While ($stream.DataAvailable) {
		$response = $reader.ReadLine()
		Write-Host $response
	}
}
$client.Close()
$listener.Stop()
