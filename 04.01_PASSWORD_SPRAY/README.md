# 04.01 Password Spray

Password spraying to technika, która polega na próbie logowania się na wiele kont przy użyciu jednym lub kilku popularnych haseł. W tej lekcji wykorzystujemy narzędzie Oh365UserFinder, aby przetestować konta z pliku i sprawdzić, czy któreś z nich działa z domyślnym lub słabym hasłem. Metoda ta pomaga w identyfikacji kont z niskim poziomem bezpieczeństwa.
### 
---

## 🛠️ Narzędzia użyte w lekcji

- Oh365UserFinder (Python)

---

## 🔍 Polecenia

```bash
python3 /opt/4sec_M365_Azure/Oh365UserFinder/oh365userfinder.py --help
nano email.txt
python3 /opt/4sec_M365_Azure/Oh365UserFinder/oh365userfinder.py -p Fola7123 --pwspray --elist emails.txt
```
## 📁 Skrypt pomocniczy
```bash
./lekcja4_1.sh
```
