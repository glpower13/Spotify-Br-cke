# 🎧 Sprach-Playlist für Spotify

Sag per Sprache, worauf du Lust hast → die Playlist landet in deinem echten Spotify-Konto.
Läuft im Browser. **Keine App aus dem Store, kein Passwort bei uns.**

---

## Für Tester (Freunde, die es ausprobieren): einfach

1. **Link öffnen**, den du von mir bekommen hast (z. B. `https://glpower13.github.io/Spotify-Br-cke/`).
2. **„Mit Spotify anmelden"** klicken, bei Spotify zustimmen.
3. 🎤 drücken und sprechen — oder ins Feld tippen. **Fertig.**

*(In Chrome oder Edge funktioniert die Sprache am zuverlässigsten. Sonst einfach tippen.)*
*(Solange die App im „Development Mode" ist, muss dein Spotify-Konto vom Betreiber
freigeschaltet sein — max. 25 Tester.)*

---

## Für dich als Betreiber: einmal einrichten (~10 Min, kostenlos)

Du machst das **einmal**, danach ist es für alle nur noch ein Link.

### 1) Seite als Link ins Netz stellen (GitHub Pages)
1. Diese Dateien in dein GitHub-Repo bringen (ist bereits im Ordner `docs/`).
2. Im Repo → **Settings → Pages**.
3. Bei **Source**: „Deploy from a branch". Branch: **`main`**, Ordner: **`/docs`**. Speichern.
4. Nach ~1 Minute erscheint dort deine Adresse, z. B.
   `https://glpower13.github.io/Spotify-Br-cke/` — **das ist dein Link** (und deine Redirect-URI unten).

### 2) Spotify-App anlegen (für die Client-ID)
1. <https://developer.spotify.com/dashboard> → mit Spotify einloggen → **Create app**.
2. Ausfüllen:
   - **App name / description:** beliebig, z. B. „Sprach-Playlist".
   - **Redirect URI:** **exakt** deine Pages-Adresse aus Schritt 1 (mit `/` am Ende), z. B.
     `https://glpower13.github.io/Spotify-Br-cke/`
   - **APIs:** „Web API" ankreuzen.
3. Speichern → in **Settings** die **Client ID** kopieren.
   *(Das „Client Secret" brauchst du NICHT.)*

### 3) Client-ID eintragen
Öffne die Datei **`docs/config.js`** und trage deine Client-ID ein:
```js
window.SPOTIFY_CLIENT_ID = "HIER_DEINE_CLIENT_ID";
```
Speichern, committen, pushen. GitHub Pages aktualisiert sich automatisch.

### 4) Tester freischalten (im Development Mode Pflicht)
Im Spotify Dashboard deiner App → **User Management** → E-Mail-Adressen deiner Tester
(die ihres Spotify-Kontos) eintragen. Bis zu 25 Personen. Danach können sie den Link nutzen.

> Wenn du irgendwann öffentlich (>25 Nutzer) gehen willst, stellst du bei Spotify einen
> **Extended-Quota-Antrag**. Für die Testphase nicht nötig.

---

## Lokal testen ohne Hosting (optional)
Wer will, kann es auch offline auf dem eigenen Rechner starten:
- **Mac:** Doppelklick auf `start.command`  ·  **Windows:** Doppelklick auf `start-windows.bat`
- Oder im Terminal: `python3 -m http.server 8888` (im Ordner `docs`), dann <http://127.0.0.1:8888>
- Dann musst du zusätzlich `http://127.0.0.1:8888/` als Redirect-URI im Spotify-Dashboard eintragen.
- Ist noch keine Client-ID in `config.js`, fragt die Seite sie einmalig ab (und zeigt dir die exakte Redirect-URI zum Kopieren).

---

## Grenzen dieses Prototyps (bewusst einfach)
- **Songauswahl** kommt aus der Spotify-**Suche** zur eingesprochenen Beschreibung — solide,
  aber noch nicht „schlau". Die **LLM-Kuratierung** (Claude/GPT wählt Songs wie ein DJ) ist
  der geplante nächste Ausbauschritt.
- **Abspielen** direkt aus der Seite ist nicht drin (bräuchte Premium + mehr Rechte). Der
  Prototyp *erstellt* die Playlist — abspielen tust du in Spotify.

## Sicherheit
- **OAuth 2.0 Authorization Code + PKCE** — der für Browser-Apps vorgesehene sichere Weg,
  **ohne Client Secret**.
- Dein **Spotify-Passwort** gibst du nur bei Spotify ein, nie hier.
- Das Zugangs-Token liegt nur in der **Browser-Sitzung** und ist beim Schließen des Tabs weg.
- Rechte (Scopes) minimal: nur Playlists anlegen/ändern.
