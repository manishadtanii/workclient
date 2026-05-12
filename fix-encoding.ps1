$base = "c:\Users\Admin\Desktop\eleware\themeforest-dpPYWW28-exrox-accounting-management-consulting-html-template\exrox\"
$pages = @("index.html", "about-us.html", "services.html", "appointment.html", "contact.html")

# UTF-8 garbled sequences -> correct HTML entities
$replacements = @(
    @{ From = [char]0xC3 + [char]0xA2 + [char]0xE2 + [char]0x80 + [char]0x94; To = "&mdash;" },   # â€" em dash
    @{ From = [char]0xC3 + [char]0xA2 + [char]0xE2 + [char]0x80 + [char]0x93; To = "&ndash;" },   # â€" en dash  
    @{ From = [char]0xC3 + [char]0xA2 + [char]0xE2 + [char]0x80 + [char]0x99; To = "&rsquo;" },   # â€™ right quote
    @{ From = [char]0xC3 + [char]0xA2 + [char]0xE2 + [char]0x80 + [char]0x9C; To = "&ldquo;" },   # â€œ left dquote
    @{ From = [char]0xC3 + [char]0xA2 + [char]0xE2 + [char]0x80 + [char]0x9D; To = "&rdquo;" }    # â€ right dquote
)

foreach ($p in $pages) {
    $path = $base + $p
    if (-not (Test-Path $path)) { Write-Host "SKIP: $p not found"; continue }
    
    $bytes = [System.IO.File]::ReadAllBytes($path)
    $c = [System.Text.Encoding]::UTF8.GetString($bytes)
    
    # Direct string replacements using char codes to avoid terminal encoding issues
    $emDash   = [System.Text.Encoding]::UTF8.GetString([byte[]]@(0xE2, 0x80, 0x94))  # —
    $enDash   = [System.Text.Encoding]::UTF8.GetString([byte[]]@(0xE2, 0x80, 0x93))  # –
    $rsquo    = [System.Text.Encoding]::UTF8.GetString([byte[]]@(0xE2, 0x80, 0x99))  # '
    $ldquo    = [System.Text.Encoding]::UTF8.GetString([byte[]]@(0xE2, 0x80, 0x9C))  # "
    $rdquo    = [System.Text.Encoding]::UTF8.GetString([byte[]]@(0xE2, 0x80, 0x9D))  # "
    $rupee    = [System.Text.Encoding]::UTF8.GetString([byte[]]@(0xE2, 0x82, 0xB9))  # ₹

    $before = $c.Length
    $c = $c.Replace($emDash, "&mdash;")
    $c = $c.Replace($enDash, "&ndash;")
    $c = $c.Replace($rsquo,  "&rsquo;")
    $c = $c.Replace($ldquo,  "&ldquo;")
    $c = $c.Replace($rdquo,  "&rdquo;")
    $c = $c.Replace($rupee,  "&#8377;")

    [System.IO.File]::WriteAllText($path, $c, [System.Text.Encoding]::UTF8)
    Write-Host "${p}: done (size diff: $($before - $c.Length) chars)"
}
Write-Host "`nAll done! Search 'ae' or garbled text in browser - should be gone now."
