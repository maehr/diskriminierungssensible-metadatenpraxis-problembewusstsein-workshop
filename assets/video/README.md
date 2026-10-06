# Video des Inputs

`input.mp4` ist ein verlustfreier Schnitt aus der Zoom-Aufzeichnung vom 6. Oktober 2026 (`GMT20261006-161355_Recording_1512x948.mp4`, 17:50 Minuten). Die Rohaufzeichnung liegt nicht im Repository.

Der Input läuft in der Aufzeichnung von 2:44 bis 17:24. Ein verlustfreier Schnitt beginnt nur an einem Keyframe. Der Keyframe vor 2:44 liegt bei 2:41.12. Die Datei beginnt deshalb 2.88 Sekunden vor dem Input, auf der Titelfolie. Die Website startet die Wiedergabe bei 2.88 Sekunden (`input.mp4#t=2.88`).

```bash
ffmpeg -ss 161.12 -i GMT20261006-161355_Recording_1512x948.mp4 -t 882.88 \
  -map 0:v:0 -map 0:a:0 -c copy -map_metadata -1 -map_chapters -1 \
  -metadata title="Diskriminierungssensible Metadatenpraxis – Input" \
  -metadata:s:a:0 language=deu -movflags +faststart input.mp4
```

Die oberen 72 Pixel zeigen die Werkzeugleiste des Browsers und ihren Schatten. Die Website blendet sie mit CSS aus (`object-fit: cover` auf 1512 × 876 Pixel). In der Vollbildansicht und in der heruntergeladenen Datei bleibt sie sichtbar.

| Datei         | Inhalt                                                |
| :------------ | :---------------------------------------------------- |
| `input.mp4`   | H.264 1512 × 948, 25 fps; AAC 48 kHz stereo; 14:42.89 |
| `kapitel.vtt` | Kapitel nach den Abschnitten des Foliendecks (WebVTT) |
| `poster.jpg`  | Titelfolie bei 2.88 Sekunden, ohne Werkzeugleiste     |
