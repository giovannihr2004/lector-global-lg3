# script_configurar_firebase_android_kts.ps1
# Última actualización: 2025-05-28 17:38 (GMT-5)

$ErrorActionPreference = "Stop"
$proyecto = "D:\Proyectos\lg3"
$appGradle = "$proyecto\android\app\build.gradle.kts"
$rootGradle = "$proyecto\android\build.gradle.kts"

# ✅ Modificar android/build.gradle.kts solo si hay bloque dependencies
$contentRoot = Get-Content $rootGradle
$depLine = $contentRoot | Select-String "^\s*dependencies\s*\{" | Select-Object -First 1
if ($depLine -ne $null -and $contentRoot -notmatch "classpath.*com.google.gms") {
    $insertIndex = $depLine.LineNumber
    $nuevoContenido = @()
    $nuevoContenido += $contentRoot[0..$insertIndex]
    $nuevoContenido += '        classpath("com.google.gms:google-services:4.4.0")'
    $nuevoContenido += $contentRoot[($insertIndex + 1)..($contentRoot.Count - 1)]
    $nuevoContenido | Set-Content $rootGradle -Encoding UTF8
    Write-Host "✅ build.gradle.kts (raíz) actualizado."
}

# ✅ Modificar android/app/build.gradle.kts
$contentApp = Get-Content $appGradle
$cambioHecho = $false

# plugins
if ($contentApp -notmatch "id.*com.google.gms.google-services") {
    $pluginsLine = $contentApp | Select-String "^plugins" | Select-Object -First 1
    if ($pluginsLine -ne $null) {
        $pluginsIndex = $pluginsLine.LineNumber - 1
        $nuevoContenidoApp = @()
        $nuevoContenidoApp += $contentApp[0..$pluginsIndex]
        $nuevoContenidoApp += '    id("com.google.gms.google-services")'
        $nuevoContenidoApp += $contentApp[($pluginsIndex + 1)..($contentApp.Count - 1)]
        $contentApp = $nuevoContenidoApp
        $cambioHecho = $true
    }
}

# apply plugin (por compatibilidad)
if ($contentApp -notmatch "com.google.gms.google-services") {
    $contentApp += ''
    $contentApp += 'apply(plugin = "com.google.gms.google-services")'
    $cambioHecho = $true
}

if ($cambioHecho) {
    $contentApp | Set-Content $appGradle -Encoding UTF8
    Write-Host "✅ build.gradle.kts (app) actualizado."
} else {
    Write-Host "✔️ build.gradle.kts (app) ya contiene la configuración."
}
