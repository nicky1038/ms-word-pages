param (
	[Parameter(Mandatory=$true)]
	[int]$from = $null,
	
	[Parameter(Mandatory=$true)]
	[int]$to = $null,
	
	[Parameter(Mandatory=$true)]
	[int]$step = $null
)

if ($from -ge $to) {
    Write-Host "from is greater than to"
    exit 1
}

if ($step -le 0) {
    Write-Host "step is less than 0"
    exit 1
}

$intervals = @()

for ($i=$from; $i -le $to; $i+=($step*2)) {
    $intervalEnd = [math]::min($i + $step - 1, $to)

    if ($i -eq $intervalEnd) {
        $intervals += "$($i)"
    } else {
        $intervals += "$($i)-$($intervalEnd)"
    }
}

if ($intervals.Length -eq 0) {
    Write-Host "Nothing to print"
    exit 0
}

$result = [String]::Join(',', $intervals);
Write-Host $result
exit 0