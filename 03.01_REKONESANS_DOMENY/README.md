# 03.01 Rekonesans domeny

Rekonesans to pierwszy krok podczas testów bezpieczeństwa usług chmurowych. W tej lekcji uczymy się, jak pozyskać informacje o domenie przy użyciu narzędzi takich jak `dig`, `nslookup` czy `dnsrecon`.

Dowiadujemy się, jak sprawdzić rekordy MX, TXT (SPF), CNAME oraz inne informacje DNS, które mogą ujawnić konfigurację usług i potencjalne punkty wejścia. Taka analiza pozwala zrozumieć architekturę domeny i przygotować się do kolejnych etapów ataku.

---

## 🛠️ Narzędzia użyte w lekcji

- AADInternals  
- PowerShell  
- dig  
- nslookup  
- dnsutils  
- dnsrecon  

---

## 🔍 Polecenia

```bash
sudo apt install dnsutils dnsrecon -y
nslookup -type=mx pentestcloud.pl
dig pentestcloud.pl ANY +noall +answer
dig pentestcloud.pl TXT | grep -E "v=spf1|include:spf.protection.outlook.com"
dig autodiscover.pentestcloud.pl CNAME
dig sharepoint.pentestcloud.pl CNAME
```
## 📁 Skrypt pomocniczy
```bash
./lekcja3_1.sh pentestcloud.pl
```
