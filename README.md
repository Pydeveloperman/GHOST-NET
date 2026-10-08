# 🥷 GHOST-NET: Kali Linux Professional Anonymity & MAC Spoofer

![GitHub License](https://shields.io)
![Bash Version](https://shields.io)
![Platform](https://shields.io)

**GHOST-NET** — bu Kali Linux va boshqa Debian asosidagi kiber-xavfsizlik distributivlarida to'liq anonimlikni ta'minlash, tarmoqdagi izlarni yashirish (MAC manzillarini niqoblash) hamda tizimdagi kesh va log fayllarini tozalash uchun mo'ljallangan avtomatlashtirilgan konsol vositasidir.

> [!WARNING]
> **Ogohlantirish:** Ushbu vosita kiber-xavfsizlik tadqiqotchilari va tizim administratorlarining shaxsiy daxlsizligi hamda xavfsizlik testlari uchun yaratilgan. Undan qonunga xilof ravishda foydalanish tavsiya etilmaydi.

---

## 🔥 Asosiy Imkoniyatlari (Features)

*   **Auto Interface Detection:** Tizimdagi faol tarmoq kartasini (`wlan0`, `wlp3s0`, `eth0`) avtomatic tarzda aniqlash.
*   **Random MAC Spoofer:** Istalgan tarmoq kartasining MAC manzilini bir lahzada butunlay tasodifiy qiymatga o'zgartirish.
*   **Custom MAC Cloning:** Tarmoqdagi boshqa biror aniq qurilmaning (masalan, oq ro'yxatdagi telefon yoki noutbukning) MAC manzilini nusxalab, uning nomi bilan niqoblanish.
*   **Factory Reset MAC:** O'zgartirilgan MAC manzilni osongina qurilmaning asl (zavod) holatiga qaytarish.
*   **Tor & ProxyChains Integrator:** Tizimga `Tor` va `ProxyChains4` xizmatlarini avtomat o'rnatish hamda internet trafigini shifrlangan zanjir orqali yo'naltirish.
*   **Secure Browsing:** Firefox brauzerini to'g'ridan-to'g'ri Tor tarmoq zanjiri ichida xavfsiz va IP manzilsiz ochish.
*   **Anti-Forensics Cleaner:** Tizim operatsiyalari yakunlangach, kiritilgan buyruqlar tarixi (`.bash_history`, `.zsh_history`), vaqtincha fayllar (`/tmp/*`) va chiqindixona keshlarini izsiz tozalash.

---

## 🛠️ O'rnatish va Ishga Tushirish (Installation)

Terminalingizni oching va quyidagi buyruqlarni ketma-ket kiriting:

```bash
# 1. Loyihani GitHub'dan yuklab oling
git clone https://github.com

# 2. Loyiha papkasiga o'ting
cd ghost-net

# 3. Skriptga ishga tushirish ruxsatini bering
chmod +x ghost_net.sh

# 4. Skriptni administrator (root) huquqi bilan ishga tushiring
sudo ./ghost_net.sh
```

---

## 📖 Skrinshotlar va Interfeys (UI)

Skript ishga tushganda sizni quyidagicha chiroyli ASCII banner va ixcham menyu qarshi oladi:

```text
   ██████╗ ██╗  ██╗ ██████╗ ███████╗████████╗
  ██╔════╝ ██║  ██║██╔═══██╗██╔════╝╚══██╔══╝
  ██║  ███╗███████║██║   ██║███████╗   ██║   
  ██║   ██║██╔══██║██║   ██║╚════██║   ██║   
  ╚██████╔╝██║  ██║╚██████╔╝███████║   ██║   
   ╚═════╝ ╚═╝  ╚═╝ ╚═════╝ ╚══════╝   ╚═╝   

        ███████╗██╗  ██╗ ██████╗ ███████╗████████╗
        ██╔════╝╚██╗██╔╝██╔═══██╗██╔════╝╚══██╔══╝
        █████╗   ╚███╔╝ ██║   ██║███████╗   ██║   
        ██╔══╝   ██╔██╗ ██║   ██║╚════██║   ██║   
        ███████╗██╔╝ ██╗╚██████╔╝███████║   ██║   
        ╚══════╝╚═╝  ╚═╝ ╚═════╝ ╚══════╝   ╚═╝   

====================================================
       GHOST-NET: ANONIMLIK VA TOZALASH TOOLS
====================================================
Aniqlangan tarmoq kartasi: wlan0
----------------------------------------------------
1) Tasodifiy MAC manzil o'rnatish
2) Aniq MAC manzil kiritish
3) MAC Manzilni tiklash
4) Tor & ProxyChains tizimini o'rnatish
5) Firefox brauzerini ochish
6) Tizimdagi loglarni tozalash
7) Chiqish
====================================================
```

---

## 💡 Tezkor Foydalanish Qo'llanmasi

1.  **MAC Manzilni o'zgartirish:** Menyudan `1` yoki `2` ni tanlang. Skript avtomatik ravishda tarmoq kartasini vaqtincha o'chiradi (`down`), MAC manzilni yangilaydi va qayta yoqadi (`up`).
2.  **Anonim Internetga kirish:** Avval `4`-band orqali barcha kerakli xizmatlarni o'rnating. So'ngra `5`-bandni tanlasangiz, Firefox brauzeri har qanday blokirovkalarni aylanib o'tuvchi anonim Tor zanjirida ishga tushadi.
3.  **Izlarni o'chirish:** Ishingiz tugagach `6`-bandni bosing. Skript terminalda yozgan maxfiy kalitlaringiz va loglaringizni butunlay o'chirib tashlaydi.

---

## 📜 Litsenziya (License)

Ushbu loyiha [MIT](LICENSE) litsenziyasi bo'yicha tarqatiladi. Uni o'zgartirish, shaxsiy loyihalarda qo'llash va ulashish mutlaqo bepul.

---
**👨‍💻 Dasturchi:** [@Pydeveloperman](https://github.com)  
Daxshatli kiber-qurollar yaratishda davom etamiz! Loyiha foydali bo'lgan bo'lsa, **Star (⭐️)** bosishni unutmang!
