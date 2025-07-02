# 3.02 Enumeracja użytkowników

Enumeracja użytkowników pozwala na sprawdzenie, które konta mogą istnieć w organizacji. W tej lekcji poznajemy narzędzia uwg oraz o365enum, które umożliwiają masowe sprawdzanie adresów e-mail i identyfikację istniejących użytkowników w Microsoft 365. To istotny krok do przygotowania skutecznego password spray lub phishingu.

---

## 🛠️ Narzędzia użyte w lekcji

- 4sec_M365_Azure/uwg (Python)
- 4sec_M365_Azure/o365enum (Python) 

---

## 🔍 Polecenia

```bash
python3 /opt/4sec_M365_Azure/uwg/main.py -n "kurs m365" -d "pentestcloud.pl" -o "loginy_pentestcloud.txt"
cat loginy_pentestcloud.txt
python3 /opt/4sec_M365_Azure/o365enum/o365enum.py -u loginy_pentestcloud.txt -m office.com -n 1

```
## 📁 Skrypt pomocniczy
```bash
lekcja_3_2.sh

loginy_pentestcloud.txt
```



