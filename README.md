# Jukebox

Egy Delphi nyelven írt zenegép (jukebox) alkalmazás, amely lehetővé teszi zenék lejátszását, albumok és számok kezelését, valamint érmebedobás szimulációt.

## 🎵 Főbb funkciók

- **Zenelejátszás**: Winamp-pal való integráció az mp3 fájlok lejátszásához
- **Album és szám kezelés**: Albumok és zeneszámok böngészése, kezelése
- **Érmebedobás szimuláció**: 50 Ft és 100 Ft érmék szimulációja
- **Playlist kezelés**: Zeneszámok sorba állítása és automatikus lejátszás
- **Statisztikák**: Lejátszási statisztikák megtekintése
- **Testreszabható felület**: Háttérkép beállítása, LCD kijelző animációk
- **Adatbázis kezelés**: Album és szám adatok módosítása
- **Automatikus indítás**: Rendszerindításkor való automatikus elindulás opció
- **Mentés/visszaállítás**: Automatikus adatbázis mentés és helyreállítás

## 📁 Projekt struktúra

```
Jukebox/
├── Forras/          # Forráskód fájlok (Delphi)
│   ├── Jukebox.dpr  # Fő program fájl
│   ├── *.pas        # Pascal egységek
│   ├── *.dfm        # Form definíciók
│   ├── *.dbf        # Adatbázis fájlok
│   └── Mentesek/    # Adatbázis mentések
├── Setup/           # Telepítő fájlok
└── README.md        # Ez a fájl
```

## 🔧 Követelmények

- **Operációs rendszer**: Windows
- **Fejlesztői környezet**: Borland Delphi (7 vagy későbbi)
- **Külső szoftver**: Winamp zenelejátszó
- **Képernyő felbontás**: 800x600 (automatikusan beállítódik)

## ⌨️ Billentyűparancsok

### Vezérlő billentyűk (numerikus billentyűzet):
- **2**: Albumok között léptetés előre
- **8**: Albumok között léptetés hátra
- **3**: Számok között léptetés előre
- **9**: Számok között léptetés hátra
- **5**: Szám kiválasztása
- **0**: Playlist kiürítése
- **+**: Hangerő fel
- **-**: Hangerő le
- **7**: 50 Ft-ot dobtak be
- **4**: 100 Ft-ot dobtak be
- **\***: Kilépés a programból

### Funkció billentyűk:
- **F2**: Háttérkép kiválasztása és betöltése
- **F3**: Új album felvitele
- **F4**: Adatbázisok módosítása
- **F5**: Statisztikák
- **F8**: Beállítások

## 🚀 Telepítés és használat

1. Futtassa a `Setup/SETUP.EXE` telepítőt
2. Állítsa be a Winamp elérési útvonalát a Beállítások menüben (F8)
3. Indítsa el a programot
4. Az alkalmazás automatikusan 800x600-as felbontásra vált
5. Böngésszen az albumok és számok között a numerikus billentyűzettel
6. Válasszon ki számokat az 5-ös billentyűvel

## 💾 Adatbázis kezelés

- A program DBF formátumú adatbázisokat használ (`Albumok.dbf`, `Szamok.dbf`)
- Indításkor automatikusan másolja az adatbázisokat a `Mentesek` mappából
- Kilépéskor visszamenti az adatbázisokat
- Áramszünet esetén az adatbázisok védve vannak
- Ha a playlist nem üres, újraindítás után a lejátszás folytatódik

## ⚙️ Beállítások

- Automatikus indítás be/ki kapcsolása
- Winamp elérési útvonalának beállítása
- Gép automatikus lekapcsolása kilépés után (opcionális)
- Háttérkép választása

## 📊 Technikai részletek

- **Fejlesztői nyelv**: Object Pascal (Delphi)
- **Adatbázis**: dBASE (.dbf) formátum
- **Zenelejátszó integráció**: Winamp API használata
- **Grafika**: JPEG, GIF támogatás
- **UI elemek**: LCD kijelző szimuláció, animált GIF-ek

## 📝 Megjegyzések

- A program az mp3 fájlok ID3 tag-jait nem módosítja, csak felhasználja
- Az adatbázis módosítások csak a programon belül történnek
- Ha külső eszköz van csatlakoztatva, annak hangereje csökken lejátszáskor

## 📄 Licenc

MIT License - lásd a [LICENSE](LICENSE) fájlt a részletekért.

## 👤 Szerző

zmeszaros

---

**Verzió**: 1.3