$inkscape = "C:\Program Files\inkscape\inkscape.com"
$localrepository = [Environment]::GetFolderPath("mydocuments") + "\GitHub\MappingSymbology\"
$svgdir = "SVG\"
$pngdir = "PNG\"

$colours = @{
    'watermelon'= 'c4004b';
    'teal' = '218fa3';
    'warmgrey' = 'b5b0a9';
    'charcoal' = '484545';
}

$pngdimensions = @(20,30,40)

<# Create all SVG colours #>

$fileregex = '(^.+)(' + ($colours.keys -join '|') + ').svg'

$processed = @()

ls (($localrepository + $svgdir) + "*.svg") | ?{$_.name -match $fileregex -and $processed -notcontains $_.name} | %{
    $filename = $_.name;
    Write-Host 'Processing' $filename

    $completefilepath = ($localrepository + $svgdir) + $filename;
    $identifier = $matches[1];
    $colourname = $matches[2];
    $colourcode = $colours[$matches[2]];

    $processed += ($identifier + $colourname)

    $colours.keys | ?{$_ -ne $colourname} | %{
        $newcolourname = $_
        $newfile = $completefilepath.Replace($colourname+'.svg',$newcolourname+'.svg')
        if((Test-Path $newfile) -eq $false) {
           Write-Host 'Creating' $_
           $newcolourcode = $colours[$_];
           (Get-Content $completefilepath).Replace([string]$colourcode,[string]$newcolourcode) | Set-Content $newfile
        }
        $processed += ($identifier + $newcolourname)
    }
}

<# Create all PNG files #>

# Based on https://gallery.technet.microsoft.com/scriptcenter/Convert-SVG-to-PNG-e759387c
ls (($localrepository + $svgdir) + "*.svg") | %{
    $completefilepath = $_.FullName;
    $pngdimensions | %{
        $newfile = $completefilepath.Replace($svgdir,$pngdir).Replace('.svg','-'+$_+'.png');

        if((Test-Path $newfile) -eq $false) {
            $command = "& `"$inkscape`" -z -e `"$newfile`" -w `"$_`" `"$completefilepath`"";  
            Invoke-Expression $command; 
        }
    }
}

<# TODO: README markup generation #>
