param(
    [Parameter(Mandatory=$false)]
    [string]$Path = ".\builds\PNSZ_Toolbox_v1.0.0.exe"
)

$resolved = Resolve-Path $Path -ErrorAction Stop
$signature = Get-AuthenticodeSignature -FilePath $resolved
$hash = Get-FileHash -Algorithm SHA256 -Path $resolved

[PSCustomObject]@{
    File = $resolved.Path
    SHA256 = $hash.Hash
    Status = $signature.Status
    StatusMessage = $signature.StatusMessage
    Subject = if ($signature.SignerCertificate) { $signature.SignerCertificate.Subject } else { $null }
    Thumbprint = if ($signature.SignerCertificate) { $signature.SignerCertificate.Thumbprint } else { $null }
} | Format-List
