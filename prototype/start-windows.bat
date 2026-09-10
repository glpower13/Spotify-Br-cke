@echo off
REM Doppelklick auf diese Datei (Windows) startet den Prototyp.
REM Oeffnet die Seite unter http://127.0.0.1:8888
cd /d "%~dp0"
echo Starte Sprach-Playlist unter http://127.0.0.1:8888 ...
echo Zum Beenden dieses Fenster schliessen oder Strg+C druecken.
start "" "http://127.0.0.1:8888"
python -m http.server 8888
pause
