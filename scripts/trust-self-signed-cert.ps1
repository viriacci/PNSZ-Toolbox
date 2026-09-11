param(
    [Parameter(Mandatory=$false)]
    [string]$CertificatePath = ".\certs\PNSZ_Toolbox_SelfSigned_CodeSigning.cer"
)

$cert = Resolve-Path $CertificatePath -ErrorAction Stop
Write-Host "Ten skrypt doda publiczny certyfikat PNSZ Toolbox do magazynów bieżącego użytkownika."
Write-Host "Rób to tylko dla certyfikatu pobranego z zaufanego źródła."
$answer = Read-Host "Wpisz TAK, aby kontynuować"
if ($answer -cne "TAK") {
    Write-Host "Anulowano."
    exit 1
}

Import-Certificate -FilePath $cert -CertStoreLocation "Cert:\CurrentUser\TrustedPeople" | Out-Null
Import-Certificate -FilePath $cert -CertStoreLocation "Cert:\CurrentUser\TrustedPublisher" | Out-Null
Write-Host "Certyfikat dodany do TrustedPeople i TrustedPublisher bieżącego użytkownika."
