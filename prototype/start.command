#!/bin/bash
# Doppelklick auf diese Datei (Mac) startet den Prototyp.
# Öffnet die Seite unter http://127.0.0.1:8888
cd "$(dirname "$0")"
echo "Starte Sprach-Playlist unter http://127.0.0.1:8888 ..."
echo "Zum Beenden dieses Fenster schließen oder Strg+C drücken."
( sleep 1; open "http://127.0.0.1:8888" ) &
python3 -m http.server 8888
