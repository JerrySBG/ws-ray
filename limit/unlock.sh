#!/bin/bash
red='\e[1;31m'
green='\e[1;32m'
BG_BLU="\033[44;1m" # BG BIRU
BlueCyan='\e[5;36m'
Xark='\e[0m'
GREN="\033[0;32m"
green() { echo -e "\\033[32;1m${*}\\033[0m"; }
red() { echo -e "\\033[31;1m${*}\\033[0m"; }
echo -e "\e[32mloading...\e[0m"
clear


yellow="\033[0;33m"
ungu="\033[0;35m"
Red="\033[91;1m"
Xark="\033[0m"
BlueCyan="\033[5;36m"
WhiteBe="\033[5;37m"
GreenBe="\033[5;32m"
YellowBe="\033[5;33m"
BlueBe="\033[5;34m"
# . Liner
function baris_panjang() {
  echo -e "${BlueCyan} ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${Xark}"
}
function Lunatic_Banner() {
clear
baris_panjang
echo -e       "${ungu}                  SBG-VPS By JERRY               ${Xark}"
baris_panjang
}

function Sc_Credit(){
sleep 1
baris_panjang
echo -e       "${ungu}          Gracias por usar       ${Xark}"
echo -e       "${ungu}         SCRIPT By JERRY-SBG       ${Xark}"
baris_panjang
exit 1
}

duration=6
frames=("██10%" "█████35%" "█████████65%" "█████████████80%" "█████████████████████90%" "█████████████████████████100%")

# Menghitung jumlah frame
num_frames=${#frames[@]}

# Menghitung jumlah iterasi
num_iterations=$((duration))

# Fungsi untuk menampilkan animasi loading berwarna

Loading_Animasi() {
    for ((i = 0; i < num_iterations; i++)); do
        clear
        index=$((i % num_frames))
        color_code=$((31 + i % 7))
echo ""
echo ""
echo ""
echo -e "\e[1;${color_code}m ${frames[$index]}\e[0m"
sleep 0.5
    done
}

# Menjalankan animasi loading

# Menampilkan pesan setelah animasi selesai
function Loading_Succes() {
clear
echo -e  "\033[5;32mSucces\033[0m"
sleep 1
clear
}



clear
echo -e "\033[5;36m┌──────────────────────────────────────────┐\033[0m"
echo "   USERNAME       EXP DATE         STATUS"
echo -e "\033[5;36m└──────────────────────────────────────────┘\033[0m"
echo -e "\033[5;36m┌──────────────────────────────────────────┐\033[0m"
while read expired
do
AKUN="$(echo $expired | cut -d: -f1)"
ID="$(echo $expired | grep -v nobody | cut -d: -f3)"
exp="$(chage -l $AKUN | grep "La Cuenta Expira" | awk -F": " '{print $2}')"
status="$(passwd -S $AKUN | awk '{print $2}' )"
if [[ $ID -ge 1000 ]]; then
if [[ "$status" = "L" ]]; then
 printf "%-17s %2s %-17s %2s \n" "  $AKUN" "$exp   " "LOCKED${NORMAL}"
else
 printf "%-17s %2s %-17s %2s \n" "  $AKUN" "$exp   " "UNLOCKED${NORMAL}"
fi
fi
done < /etc/passwd
JUMLAH="$(awk -F: '$3 >= 1000 && $1 != "nobody" {print $1}' /etc/passwd | wc -l)"
echo -e "\033[5;36m└──────────────────────────────────────────┘\033[0m"
echo -e "\033[5;36m┌──────────────────────────────────────────┐\033[0m"
echo "   Account number: $JUMLAH   user"
echo -e "\033[5;36m└──────────────────────────────────────────┘\033[0m"
echo " "
echo " "
read -p "Ingrese el nombre de usuario para desbloquear :   " username

Loading_Animasi
Loading_Succes

egrep "^$username" /etc/passwd >/dev/null
if [ $? -eq 0 ]; then
# proses mengganti passwordnya
passwd -u $username
clear
  Lunatic_Banner
  echo " "
  baris_panjang
  echo ""
  echo -e "${GreenBe} Exitosamente ${Xark}"
  echo ""
  echo -e "${Cyan} Username  : $username${Xark}"
  echo -e "${Cyan} Status    : Unlock ${Xark} "
  echo ""
  baris_panjang
  Sc_Credit

else
echo " "
echo -e "Usuario ${red}$username${NC} no encontrado en su servidor."
echo " "
        exit 1
fi
