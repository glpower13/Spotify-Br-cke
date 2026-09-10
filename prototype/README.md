# 🎧 Sprach-Playlist für Spotify — Prototyp

Sag per Sprache, worauf du Lust hast → die Playlist landet in deinem echten Spotify-Konto.
Läuft komplett im Browser. **Keine App aus dem Store, kein Server, kein Passwort bei uns.**

---

## Was du einmalig brauchst (~3 Minuten, kostenlos)

Damit die Seite bei Spotify anfragen darf, brauchst du eine **Client-ID**. Die holst du dir so:

1. Öffne das **Spotify Developer Dashboard**: <https://developer.spotify.com/dashboard>
   (mit deinem normalen Spotify-Konto einloggen).
2. **„Create app"** klicken. Ausfüllen:
   - **App name / description:** irgendwas, z. B. „Sprach-Playlist".
   - **Redirect URI:** genau eintragen → `http://127.0.0.1:8888/`
     *(muss exakt so lauten, mit dem Schrägstrich am Ende — sonst klappt die Anmeldung nicht.)*
   - **Which API/SDKs …:** „Web API" ankreuzen.
3. Speichern. Danach in den **Settings** der App die **Client ID** kopieren.
   *(Das „Client Secret" brauchst du NICHT — dieser Prototyp arbeitet ohne Secret.)*

Die Client-ID trägst du beim ersten Start einmal auf der Seite ein — fertig.

> **Hinweis:** Neue Spotify-Apps starten im *Development Mode* und funktionieren nur für
> dich und bis zu 25 manuell freigeschaltete Nutzer. Für dich zum Ausprobieren reicht das.

---

## Starten

**Mac:** Doppelklick auf `start.command`
*(Falls „nicht erlaubt": Rechtsklick → Öffnen → Öffnen. Einmalig.)*

**Windows:** Doppelklick auf `start-windows.bat`

**Alternativ (jedes System) im Terminal:**
```
cd prototype
python3 -m http.server 8888
```
Dann im Browser öffnen: <http://127.0.0.1:8888>

> Voraussetzung: **Python 3** ist installiert (auf Mac/Linux meist schon da; für Windows:
> <https://www.python.org/downloads/> — beim Installieren „Add to PATH" ankreuzen).
> Für die **Spracherkennung** am besten **Chrome oder Edge** benutzen. In anderen Browsern
> kannst du stattdessen einfach ins Textfeld tippen.

---

## Benutzen

1. Client-ID eintragen → **„Speichern & mit Spotify anmelden"**.
2. Bei Spotify zustimmen (einmalig).
3. 🎤-Knopf drücken und sprechen, z. B. *„entspannte Klaviermusik zum Lernen"*
   — oder einfach ins Feld tippen.
4. **„Playlist erstellen"** → Link „In Spotify öffnen" erscheint.

---

## Grenzen dieses Prototyps (bewusst einfach gehalten)

- **Songauswahl** kommt aus der Spotify-**Suche** zur eingesprochenen Beschreibung.
  Das ist absichtlich schlicht: es nutzt nur *stabile*, nicht abgekündigte API-Endpunkte.
  Die „schlaue" Kuratierung per LLM (Claude/GPT) ist der **nächste Ausbauschritt**.
- **Abspielen direkt aus der Seite** ist hier nicht drin (bräuchte Spotify Premium +
  weitere Rechte). Der Prototyp *erstellt* die Playlist — abspielen tust du in Spotify.
- Läuft lokal auf `127.0.0.1`. Fürs Öffentlich-Machen später: auf HTTPS-Domain hosten und
  die Redirect-URI dort anpassen.

---

## Sicherheit

- Anmeldung über **OAuth 2.0 Authorization Code + PKCE** (der von Spotify für Browser-Apps
  vorgesehene, sichere Weg — **ohne Client Secret**).
- Dein **Spotify-Passwort** gibst du nur bei Spotify selbst ein, nie hier.
- Das Zugangs-Token liegt nur in deiner **Browser-Sitzung** (`sessionStorage`) und ist beim
  Schließen des Tabs wieder weg.
- Angefragte Rechte (Scopes) sind minimal: nur Playlists anlegen/ändern.
