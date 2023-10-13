#!/bin/bash
#PINJEM DONG PUH SEPUH
CHATID="1117211252"
KEY="6654578153:AAEL08DFbdrgtirDqtBU6DkP_acq31uZPik"
export TIME="10"
export URL="https://api.telegram.org/bot$KEY/sendMessage"
clear
MYIP=$(wget -qO- ipinfo.io/ip);
echo -e "\e[32mloading...\e[0m"
clear
#apt install jq curl -y
#clear
#read -rp "Sub Domain (Contoh: Myrid): " subdomainmu
#	DOMAIN="wokszstore.com"
#	SUB=$(tr </dev/urandom -dc a-z0-9 | head -c7)
#	SUB_DOMAIN=${SUB}."wokszstore.com"
#NS_DOMAIN=ns.${SUB_DOMAIN}
#CF_ID=ahdanfullset@gmail.com
#CF_KEY=236cfc0307a41ec0c88016fb2ba2a3a32c27f
#tempe.bakar.sshweb.tech tempe.bakar
#DOMAIN=myridtunnel.my.id
#echo $subdomainmu > /root/cfku
#SUB_DOMAIN=${subdomainmu}.myridtunnel.my.id
#SUB_DOMAIN=${SUB}.myridtunnel.my.id
#SUB=$(</dev/urandom tr -dc a-z0-9 | head -c5)
#SUB=$(tr </dev/urandom -dc a-z0-9 | head -c7)
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
clear
red='\e[1;31m'
green='\e[0;32m'
yell='\e[1;33m'
tyblue='\e[1;36m'
NC='\e[0m'
red() { echo -e "\\033[32;1m${*}\\033[0m"; }
green() { echo -e "\\033[32;1m${*}\\033[0m"; }
yellow() { echo -e "\\033[33;1m${*}\\033[0m"; }
MYIP=$(wget -qO- ipinfo.io/ip);
echo -e "\e[32mloading...\e[0m"
apt install jq curl -y
clear
function subdomainsshweb() {
#SUB=microsoft.azure
#DOMAIN=ganteng.tech DOMAIN=yaddykakkoii.my.id #DOMAIN=sshweb.tech
echo "DOMAIN UTAMA ADALAH sshweb.tech"
echo "~~~~~~ petunjuk tentang custom subdomain ~~~~~~~~~"
echo "JIKA KAMU INPUT KATA: test ,maka hasilnya adalah test.sshweb.tech"
echo "JIKA KAMU INPUT KATA: custom ,maka hasilnya adalah custom.sshweb.tech"
echo "JIKA KAMU INPUT KATA: ainzoverlord ,maka hasilnya adalah ainzoverlord.sshweb.tech"
echo "JIKA KAMU INPUT KATA: sg3 ,maka hasilnya adalah sg3.sshweb.tech"
echo "JIKA KAMU INPUT KATA: memekpink ,maka hasilnya adalah memekpink.sshweb.tech"
echo ""
read -rp "silakan INPUT custom subdomain kamu : " -e SUB
echo ""
MYIP=$(wget -qO- icanhazip.com);
CF_ID=yadicakepp@gmail.com
CF_KEY=b22d286c2d7f6d3e5073325dd18b76ca4ddb2
DOMAIN=sshweb.tech
SUB_DOMAIN=${SUB}.${DOMAIN}
NS_DOMAIN=ns.${SUB_DOMAIN}
echo "DOMAIN kamu adalah : ${SUB_DOMAIN}"
sleep 3
echo "IP=${SUB_DOMAIN}" > /var/lib/yaddykakkoii/ipvps.conf
echo "IP=$SUB_DOMAIN" >> /var/lib/kyt/ipvps.conf

set -euo pipefail
#IP=$(wget -qO- ipinfo.io/ip);
IP=$(wget -qO- icanhazip.com);
echo "Updating DNS RECORD (DomainNameSystem) for ${SUB_DOMAIN} "
sleep 2
ZONE=$(curl -sLX GET "https://api.cloudflare.com/client/v4/zones?name=${DOMAIN}&status=active" \
    -H "X-Auth-Email: ${CF_ID}" \
    -H "X-Auth-Key: ${CF_KEY}" \
    -H "Content-Type: application/json" | jq -r .result[0].id)
RECORD=$(curl -sLX GET "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records?name=${SUB_DOMAIN}" \
    -H "X-Auth-Email: ${CF_ID}" \
    -H "X-Auth-Key: ${CF_KEY}" \
    -H "Content-Type: application/json" | jq -r .result[0].id)
    if [[ "${#RECORD}" -le 10 ]]; then
        RECORD=$(curl -sLX POST "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records" \
        -H "X-Auth-Email: ${CF_ID}" \
        -H "X-Auth-Key: ${CF_KEY}" \
        -H "Content-Type: application/json" \
        --data '{"type":"A","name":"'${SUB_DOMAIN}'","content":"'${IP}'","ttl":120,"proxied":false}' | jq -r .result.id)
    fi
RESULT=$(curl -sLX PUT "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records/${RECORD}" \
    -H "X-Auth-Email: ${CF_ID}" \
    -H "X-Auth-Key: ${CF_KEY}" \
    -H "Content-Type: application/json" \
    --data '{"type":"A","name":"'${SUB_DOMAIN}'","content":"'${IP}'","ttl":120,"proxied":false}')
# update nameserver mu
echo "Updating NS RECORD (NameServer) for ${NS_DOMAIN} "
ZONE=$(curl -sLX GET "https://api.cloudflare.com/client/v4/zones?name=${DOMAIN}&status=active" \
    -H "X-Auth-Email: ${CF_ID}" \
    -H "X-Auth-Key: ${CF_KEY}" \
    -H "Content-Type: application/json" | jq -r .result[0].id)
RECORD=$(curl -sLX GET "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records?name=${NS_DOMAIN}" \
    -H "X-Auth-Email: ${CF_ID}" \
    -H "X-Auth-Key: ${CF_KEY}" \
    -H "Content-Type: application/json" | jq -r .result[0].id)
    if [[ "${#RECORD}" -le 10 ]]; then
        RECORD=$(curl -sLX POST "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records" \
        -H "X-Auth-Email: ${CF_ID}" \
        -H "X-Auth-Key: ${CF_KEY}" \
        -H "Content-Type: application/json" \
        --data '{"type":"NS","name":"'${NS_DOMAIN}'","content":"'${SUB_DOMAIN}'","ttl":120,"proxied":false}' | jq -r .result.id)
    fi
RESULT=$(curl -sLX PUT "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records/${RECORD}" \
    -H "X-Auth-Email: ${CF_ID}" \
    -H "X-Auth-Key: ${CF_KEY}" \
    -H "Content-Type: application/json" \
    --data '{"type":"NS","name":"'${NS_DOMAIN}'","content":"'${SUB_DOMAIN}'","ttl":120,"proxied":false}')
echo "DOMAIN KAMU : $SUB_DOMAIN"
echo $SUB_DOMAIN > /etc/xray/domain
echo "NAMESERVER KAMU : $NS_DOMAIN"
echo $NS_DOMAIN > /etc/xray/nsdomain
echo $NS_DOMAIN > /etc/xray/dns

echo "IP=" >> /var/lib/kyt/ipvps.conf
echo $SUB_DOMAIN > /root/domain

sleep 3
cd /root
}

ridwan_ns_cloudflare() {

DOMAINX=myridtunnel.my.id
SUB_DOMAINX=${SUB}.${DOMAINX}
NS_DOMAINX=ns.${SUB_DOMAINX}
CF_IDX=ziexyuan@gmail.com
CF_KEYX=2fbf0739b65e1e4b6de396b11a9693fc6aa56

set -euo pipefail
IPX=$(wget -qO- ipinfo.io/ip);
echo "Record DNS for  ${SUB_DOMAINX}..."
ZONEX=$(curl -sLX GET "https://api.cloudflare.com/client/v4/zones?name=${DOMAINX}&status=active" \
     -H "X-Auth-Email: ${CF_IDX}" \
     -H "X-Auth-Key: ${CF_KEYX}" \
     -H "Content-Type: application/json" | jq -r .result[0].id)

RECORD=$(curl -sLX GET "https://api.cloudflare.com/client/v4/zones/${ZONEX}/dns_records?name=${SUB_DOMAINX}" \
     -H "X-Auth-Email: ${CF_IDX}" \
     -H "X-Auth-Key: ${CF_KEYX}" \
     -H "Content-Type: application/json" | jq -r .result[0].id)

if [[ "${#RECORD}" -le 10 ]]; then
     RECORD=$(curl -sLX POST "https://api.cloudflare.com/client/v4/zones/${ZONEX}/dns_records" \
     -H "X-Auth-Email: ${CF_IDX}" \
     -H "X-Auth-Key: ${CF_KEYX}" \
     -H "Content-Type: application/json" \
     --data '{"type":"A","name":"'${SUB_DOMAINX}'","content":"'${IPX}'","ttl":120,"proxied":false}' | jq -r .result.id)
fi

RESULT=$(curl -sLX PUT "https://api.cloudflare.com/client/v4/zones/${ZONEX}/dns_records/${RECORD}" \
     -H "X-Auth-Email: ${CF_IDX}" \
     -H "X-Auth-Key: ${CF_KEYX}" \
     -H "Content-Type: application/json" \
     --data '{"type":"A","name":"'${SUB_DOMAINX}'","content":"'${IPX}'","ttl":120,"proxied":false}')

echo "Alternate Host : $SUB_DOMAINX"

echo $SUB_DOMAINX > /root/domain1
echo $SUB_DOMAINX > /etc/xray/domain1

DOMAIN_PATHX=$(cat /etc/xray/domain1)
echo "Updating NameServer for ${NS_DOMAINX}..."
	ZONEXX=$(
		curl -sLX GET "https://api.cloudflare.com/client/v4/zones?name=${DOMAINX}&status=active" \
		-H "X-Auth-Email: ${CF_IDX}" \
		-H "X-Auth-Key: ${CF_KEYX}" \
		-H "Content-Type: application/json" | jq -r .result[0].id
	)

	RECORD=$(
		curl -sLX GET "https://api.cloudflare.com/client/v4/zones/${ZONEXX}/dns_records?name=${NS_DOMAINX}" \
		-H "X-Auth-Email: ${CF_IDX}" \
		-H "X-Auth-Key: ${CF_KEYX}" \
		-H "Content-Type: application/json" | jq -r .result[0].id
	)

	if [[ "${#RECORD}" -le 10 ]]; then
		RECORD=$(
			curl -sLX POST "https://api.cloudflare.com/client/v4/zones/${ZONEXX}/dns_records" \
			-H "X-Auth-Email: ${CF_IDX}" \
			-H "X-Auth-Key: ${CF_KEYX}" \
			-H "Content-Type: application/json" \
			--data '{"type":"NS","name":"'${NS_DOMAINX}'","content":"'${DOMAIN_PATHX}'","proxied":false}' | jq -r .result.id
		)
	fi

	RESULT=$(
		curl -sLX PUT "https://api.cloudflare.com/client/v4/zones/${ZONEXX}/dns_records/${RECORD}" \
		-H "X-Auth-Email: ${CF_IDX}" \
		-H "X-Auth-Key: ${CF_KEYX}" \
		-H "Content-Type: application/json" \
		--data '{"type":"NS","name":"'${NS_DOMAINX}'","content":"'${DOMAIN_PATHX}'","proxied":false}'
	)
	echo $NS_DOMAINX > /etc/xray/dns1
    echo $NS_DOMAINX > /etc/xray/nsdomain1
}

wokzcom_ns_cloudflare() {
#wokszxdstore.xyz
#wokszxdstore.net
DOMAINZ="wokszstore.com"
SUB_DOMAINZ=${SUB}.${DOMAINZ}
NS_DOMAINZ=ns.${SUB_DOMAINZ}
CF_IDZ=ahdanfullset@gmail.com
CF_KEYZ=236cfc0307a41ec0c88016fb2ba2a3a32c27f

set -euo pipefail
IPZ=$(wget -qO- ipinfo.io/ip);
echo "Record DNS for  ${SUB_DOMAINZ}..."
ZONEZ=$(curl -sLX GET "https://api.cloudflare.com/client/v4/zones?name=${DOMAINZ}&status=active" \
     -H "X-Auth-Email: ${CF_IDZ}" \
     -H "X-Auth-Key: ${CF_KEYZ}" \
     -H "Content-Type: application/json" | jq -r .result[0].id)

RECORD=$(curl -sLX GET "https://api.cloudflare.com/client/v4/zones/${ZONEZ}/dns_records?name=${SUB_DOMAINZ}" \
     -H "X-Auth-Email: ${CF_IDZ}" \
     -H "X-Auth-Key: ${CF_KEYZ}" \
     -H "Content-Type: application/json" | jq -r .result[0].id)

if [[ "${#RECORD}" -le 10 ]]; then
     RECORD=$(curl -sLX POST "https://api.cloudflare.com/client/v4/zones/${ZONEZ}/dns_records" \
     -H "X-Auth-Email: ${CF_IDZ}" \
     -H "X-Auth-Key: ${CF_KEYZ}" \
     -H "Content-Type: application/json" \
     --data '{"type":"A","name":"'${SUB_DOMAINZ}'","content":"'${IPZ}'","ttl":120,"proxied":false}' | jq -r .result.id)
fi

RESULT=$(curl -sLX PUT "https://api.cloudflare.com/client/v4/zones/${ZONEZ}/dns_records/${RECORD}" \
     -H "X-Auth-Email: ${CF_IDZ}" \
     -H "X-Auth-Key: ${CF_KEYZ}" \
     -H "Content-Type: application/json" \
     --data '{"type":"A","name":"'${SUB_DOMAINZ}'","content":"'${IPZ}'","ttl":120,"proxied":false}')

echo "Alternate Host : $SUB_DOMAINZ"

echo $SUB_DOMAINZ > /root/domain2
echo $SUB_DOMAINZ > /etc/xray/domain2

DOMAIN_PATHZ=$(cat /etc/xray/domain2)
echo "Updating NameServer for ${NS_DOMAINZ}..."
	ZONEZZ=$(
		curl -sLX GET "https://api.cloudflare.com/client/v4/zones?name=${DOMAINZ}&status=active" \
		-H "X-Auth-Email: ${CF_IDZ}" \
		-H "X-Auth-Key: ${CF_KEYZ}" \
		-H "Content-Type: application/json" | jq -r .result[0].id
	)

	RECORD=$(
		curl -sLX GET "https://api.cloudflare.com/client/v4/zones/${ZONEZZ}/dns_records?name=${NS_DOMAINZ}" \
		-H "X-Auth-Email: ${CF_IDZ}" \
		-H "X-Auth-Key: ${CF_KEYZ}" \
		-H "Content-Type: application/json" | jq -r .result[0].id
	)

	if [[ "${#RECORD}" -le 10 ]]; then
		RECORD=$(
			curl -sLX POST "https://api.cloudflare.com/client/v4/zones/${ZONEZZ}/dns_records" \
			-H "X-Auth-Email: ${CF_IDZ}" \
			-H "X-Auth-Key: ${CF_KEYZ}" \
			-H "Content-Type: application/json" \
			--data '{"type":"NS","name":"'${NS_DOMAINZ}'","content":"'${DOMAIN_PATHZ}'","proxied":false}' | jq -r .result.id
		)
	fi

	RESULT=$(
		curl -sLX PUT "https://api.cloudflare.com/client/v4/zones/${ZONEZZ}/dns_records/${RECORD}" \
		-H "X-Auth-Email: ${CF_IDZ}" \
		-H "X-Auth-Key: ${CF_KEYZ}" \
		-H "Content-Type: application/json" \
		--data '{"type":"NS","name":"'${NS_DOMAINZ}'","content":"'${DOMAIN_PATHZ}'","proxied":false}'
	)
	echo $NS_DOMAINZ > /etc/xray/dns2
    echo $NS_DOMAINZ > /etc/xray/nsdomain2
}
wokznet_ns_cloudflare() {
#wokszxdstore.xyz
DOMAINZ="wokszxdstore.net"
SUB_DOMAINZ=${SUB}.${DOMAINZ}
NS_DOMAINZ=ns.${SUB_DOMAINZ}
CF_IDZ=ahdanfullset@gmail.com
CF_KEYZ=236cfc0307a41ec0c88016fb2ba2a3a32c27f

set -euo pipefail
IPZ=$(wget -qO- ipinfo.io/ip);
echo "Record DNS for  ${SUB_DOMAINZ}..."
ZONEZ=$(curl -sLX GET "https://api.cloudflare.com/client/v4/zones?name=${DOMAINZ}&status=active" \
     -H "X-Auth-Email: ${CF_IDZ}" \
     -H "X-Auth-Key: ${CF_KEYZ}" \
     -H "Content-Type: application/json" | jq -r .result[0].id)

RECORD=$(curl -sLX GET "https://api.cloudflare.com/client/v4/zones/${ZONEZ}/dns_records?name=${SUB_DOMAINZ}" \
     -H "X-Auth-Email: ${CF_IDZ}" \
     -H "X-Auth-Key: ${CF_KEYZ}" \
     -H "Content-Type: application/json" | jq -r .result[0].id)

if [[ "${#RECORD}" -le 10 ]]; then
     RECORD=$(curl -sLX POST "https://api.cloudflare.com/client/v4/zones/${ZONEZ}/dns_records" \
     -H "X-Auth-Email: ${CF_IDZ}" \
     -H "X-Auth-Key: ${CF_KEYZ}" \
     -H "Content-Type: application/json" \
     --data '{"type":"A","name":"'${SUB_DOMAINZ}'","content":"'${IPZ}'","ttl":120,"proxied":false}' | jq -r .result.id)
fi

RESULT=$(curl -sLX PUT "https://api.cloudflare.com/client/v4/zones/${ZONEZ}/dns_records/${RECORD}" \
     -H "X-Auth-Email: ${CF_IDZ}" \
     -H "X-Auth-Key: ${CF_KEYZ}" \
     -H "Content-Type: application/json" \
     --data '{"type":"A","name":"'${SUB_DOMAINZ}'","content":"'${IPZ}'","ttl":120,"proxied":false}')

echo "Alternate Host : $SUB_DOMAINZ"

echo $SUB_DOMAINZ > /root/domain3
echo $SUB_DOMAINZ > /etc/xray/domain3

DOMAIN_PATHZ=$(cat /etc/xray/domain3)
echo "Updating NameServer for ${NS_DOMAINZ}..."
	ZONEZZ=$(
		curl -sLX GET "https://api.cloudflare.com/client/v4/zones?name=${DOMAINZ}&status=active" \
		-H "X-Auth-Email: ${CF_IDZ}" \
		-H "X-Auth-Key: ${CF_KEYZ}" \
		-H "Content-Type: application/json" | jq -r .result[0].id
	)

	RECORD=$(
		curl -sLX GET "https://api.cloudflare.com/client/v4/zones/${ZONEZZ}/dns_records?name=${NS_DOMAINZ}" \
		-H "X-Auth-Email: ${CF_IDZ}" \
		-H "X-Auth-Key: ${CF_KEYZ}" \
		-H "Content-Type: application/json" | jq -r .result[0].id
	)

	if [[ "${#RECORD}" -le 10 ]]; then
		RECORD=$(
			curl -sLX POST "https://api.cloudflare.com/client/v4/zones/${ZONEZZ}/dns_records" \
			-H "X-Auth-Email: ${CF_IDZ}" \
			-H "X-Auth-Key: ${CF_KEYZ}" \
			-H "Content-Type: application/json" \
			--data '{"type":"NS","name":"'${NS_DOMAINZ}'","content":"'${DOMAIN_PATHZ}'","proxied":false}' | jq -r .result.id
		)
	fi

	RESULT=$(
		curl -sLX PUT "https://api.cloudflare.com/client/v4/zones/${ZONEZZ}/dns_records/${RECORD}" \
		-H "X-Auth-Email: ${CF_IDZ}" \
		-H "X-Auth-Key: ${CF_KEYZ}" \
		-H "Content-Type: application/json" \
		--data '{"type":"NS","name":"'${NS_DOMAINZ}'","content":"'${DOMAIN_PATHZ}'","proxied":false}'
	)
	echo $NS_DOMAINZ > /etc/xray/dns3
    echo $NS_DOMAINZ > /etc/xray/nsdomain3
}

wokzxyz_ns_cloudflare() {
#wokszxdstore.xyz
#wokszxdstore.net
DOMAINZ="wokszxdstore.xyz"
SUB_DOMAINZ=${SUB}.${DOMAINZ}
NS_DOMAINZ=ns.${SUB_DOMAINZ}
CF_IDZ=ahdanfullset@gmail.com
CF_KEYZ=236cfc0307a41ec0c88016fb2ba2a3a32c27f

set -euo pipefail
IPZ=$(wget -qO- ipinfo.io/ip);
echo "Record DNS for  ${SUB_DOMAINZ}..."
ZONEZ=$(curl -sLX GET "https://api.cloudflare.com/client/v4/zones?name=${DOMAINZ}&status=active" \
     -H "X-Auth-Email: ${CF_IDZ}" \
     -H "X-Auth-Key: ${CF_KEYZ}" \
     -H "Content-Type: application/json" | jq -r .result[0].id)

RECORD=$(curl -sLX GET "https://api.cloudflare.com/client/v4/zones/${ZONEZ}/dns_records?name=${SUB_DOMAINZ}" \
     -H "X-Auth-Email: ${CF_IDZ}" \
     -H "X-Auth-Key: ${CF_KEYZ}" \
     -H "Content-Type: application/json" | jq -r .result[0].id)

if [[ "${#RECORD}" -le 10 ]]; then
     RECORD=$(curl -sLX POST "https://api.cloudflare.com/client/v4/zones/${ZONEZ}/dns_records" \
     -H "X-Auth-Email: ${CF_IDZ}" \
     -H "X-Auth-Key: ${CF_KEYZ}" \
     -H "Content-Type: application/json" \
     --data '{"type":"A","name":"'${SUB_DOMAINZ}'","content":"'${IPZ}'","ttl":120,"proxied":false}' | jq -r .result.id)
fi

RESULT=$(curl -sLX PUT "https://api.cloudflare.com/client/v4/zones/${ZONEZ}/dns_records/${RECORD}" \
     -H "X-Auth-Email: ${CF_IDZ}" \
     -H "X-Auth-Key: ${CF_KEYZ}" \
     -H "Content-Type: application/json" \
     --data '{"type":"A","name":"'${SUB_DOMAINZ}'","content":"'${IPZ}'","ttl":120,"proxied":false}')

echo "Alternate Host : $SUB_DOMAINZ"

echo $SUB_DOMAINZ > /root/domain4
echo $SUB_DOMAINZ > /etc/xray/domain4

DOMAIN_PATHZ=$(cat /etc/xray/domain4)
echo "Updating NameServer for ${NS_DOMAINZ}..."
	ZONEZZ=$(
		curl -sLX GET "https://api.cloudflare.com/client/v4/zones?name=${DOMAINZ}&status=active" \
		-H "X-Auth-Email: ${CF_IDZ}" \
		-H "X-Auth-Key: ${CF_KEYZ}" \
		-H "Content-Type: application/json" | jq -r .result[0].id
	)

	RECORD=$(
		curl -sLX GET "https://api.cloudflare.com/client/v4/zones/${ZONEZZ}/dns_records?name=${NS_DOMAINZ}" \
		-H "X-Auth-Email: ${CF_IDZ}" \
		-H "X-Auth-Key: ${CF_KEYZ}" \
		-H "Content-Type: application/json" | jq -r .result[0].id
	)

	if [[ "${#RECORD}" -le 10 ]]; then
		RECORD=$(
			curl -sLX POST "https://api.cloudflare.com/client/v4/zones/${ZONEZZ}/dns_records" \
			-H "X-Auth-Email: ${CF_IDZ}" \
			-H "X-Auth-Key: ${CF_KEYZ}" \
			-H "Content-Type: application/json" \
			--data '{"type":"NS","name":"'${NS_DOMAINZ}'","content":"'${DOMAIN_PATHZ}'","proxied":false}' | jq -r .result.id
		)
	fi

	RESULT=$(
		curl -sLX PUT "https://api.cloudflare.com/client/v4/zones/${ZONEZZ}/dns_records/${RECORD}" \
		-H "X-Auth-Email: ${CF_IDZ}" \
		-H "X-Auth-Key: ${CF_KEYZ}" \
		-H "Content-Type: application/json" \
		--data '{"type":"NS","name":"'${NS_DOMAINZ}'","content":"'${DOMAIN_PATHZ}'","proxied":false}'
	)
	echo $NS_DOMAINZ > /etc/xray/dns4
    echo $NS_DOMAINZ > /etc/xray/nsdomain4
}

function notif_addhost() {
green() { echo -e "\\033[32;1m${*}\\033[0m"; }
green "Notif AddHost Tele"
sleep 2
    CHATID="1117211252"
    KEY="6654578153:AAEL08DFbdrgtirDqtBU6DkP_acq31uZPik"
TIME="10"
TEXT="
<code>━━━━━━━━━━━━━━</code>
<b>     ADDHOST NOTIF</b>
<b>     Add Domain New</b>
<code>━━━━━━━━━━━━━━</code>
<b>IP VPS  :</b> <code>$MYIP </code>
<b>DOMAIN :</b> <code>$subdomainmu.$DOMAIN</code>
<b>NS  :</b> <code>$NS_DOMAIN</code>
<code>━━━━━━━━━━━━━━</code>
<code>NEW ADD DOMAIN $SUB_DOMAIN</code>
<code>BY BOT : @myridwan</code>
"
curl -s --max-time $TIME -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
}


function randomsubdomain() {
MYIP=$(wget -qO- icanhazip.com);
CF_ID=yadicakepp@gmail.com
CF_KEY=b22d286c2d7f6d3e5073325dd18b76ca4ddb2
SUB=$(</dev/urandom tr -dc a-z0-9 | head -c3)
DOMAIN=yaddykakkoii.my.id
SUB_DOMAIN=tensai.${SUB}.${DOMAIN}
NS_DOMAIN=ns.${SUB_DOMAIN}
echo "DOMAIN kamu adalah : ${SUB_DOMAIN}"
sleep 3
echo "IP=${SUB_DOMAIN}" > /var/lib/yaddykakkoii/ipvps.conf
set -euo pipefail
IP=$(wget -qO- icanhazip.com);
# update domain vps mu
echo "Updating DNS RECORD (DomainNameSystem) for ${SUB_DOMAIN} "
ZONE=$(curl -sLX GET "https://api.cloudflare.com/client/v4/zones?name=${DOMAIN}&status=active" \
     -H "X-Auth-Email: ${CF_ID}" \
     -H "X-Auth-Key: ${CF_KEY}" \
     -H "Content-Type: application/json" | jq -r .result[0].id)
RECORD=$(curl -sLX GET "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records?name=${SUB_DOMAIN}" \
     -H "X-Auth-Email: ${CF_ID}" \
     -H "X-Auth-Key: ${CF_KEY}" \
     -H "Content-Type: application/json" | jq -r .result[0].id)
if [[ "${#RECORD}" -le 10 ]]; then
     RECORD=$(curl -sLX POST "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records" \
     -H "X-Auth-Email: ${CF_ID}" \
     -H "X-Auth-Key: ${CF_KEY}" \
     -H "Content-Type: application/json" \
     --data '{"type":"A","name":"'${SUB_DOMAIN}'","content":"'${IP}'","ttl":120,"proxied":false}' | jq -r .result.id)
fi
RESULT=$(curl -sLX PUT "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records/${RECORD}" \
     -H "X-Auth-Email: ${CF_ID}" \
     -H "X-Auth-Key: ${CF_KEY}" \
     -H "Content-Type: application/json" \
     --data '{"type":"A","name":"'${SUB_DOMAIN}'","content":"'${IP}'","ttl":120,"proxied":false}')
# update nameserver mu
echo "Updating NS RECORD (NameServer) for ${NS_DOMAIN} "
ZONE=$(curl -sLX GET "https://api.cloudflare.com/client/v4/zones?name=${DOMAIN}&status=active" \
     -H "X-Auth-Email: ${CF_ID}" \
     -H "X-Auth-Key: ${CF_KEY}" \
     -H "Content-Type: application/json" | jq -r .result[0].id)
RECORD=$(curl -sLX GET "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records?name=${NS_DOMAIN}" \
     -H "X-Auth-Email: ${CF_ID}" \
     -H "X-Auth-Key: ${CF_KEY}" \
     -H "Content-Type: application/json" | jq -r .result[0].id)
if [[ "${#RECORD}" -le 10 ]]; then
     RECORD=$(curl -sLX POST "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records" \
     -H "X-Auth-Email: ${CF_ID}" \
     -H "X-Auth-Key: ${CF_KEY}" \
     -H "Content-Type: application/json" \
     --data '{"type":"NS","name":"'${NS_DOMAIN}'","content":"'${SUB_DOMAIN}'","ttl":120,"proxied":false}' | jq -r .result.id)
fi
RESULT=$(curl -sLX PUT "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records/${RECORD}" \
     -H "X-Auth-Email: ${CF_ID}" \
     -H "X-Auth-Key: ${CF_KEY}" \
     -H "Content-Type: application/json" \
     --data '{"type":"NS","name":"'${NS_DOMAIN}'","content":"'${SUB_DOMAIN}'","ttl":120,"proxied":false}')
echo "DOMAIN KAMU : $SUB_DOMAIN"
echo $SUB_DOMAIN > /etc/xray/domain
echo "NAMESERVER KAMU : $NS_DOMAIN"
echo $NS_DOMAIN > /etc/xray/nsdomain

echo "IP=" >> /var/lib/kyt/ipvps.conf
echo $SUB_DOMAIN > /root/domain


sleep 3
cd /root
}


function notif_addhost() {
Dom=$(cat etc/xray/domain)
Dom1=$(cat etc/xray/domain1)
Dom2=$(cat etc/xray/domain2)
Dom3=$(cat etc/xray/domain3)
Dom4=$(cat etc/xray/domain4)
    green "Notif AddHost Tele"
    sleep 2
    CHATID="1117211252"
    KEY="6654578153:AAEL08DFbdrgtirDqtBU6DkP_acq31uZPik"
    TIME="10"
TEXT="
<code>━━━━━━━━━━━━━━</code>
<b>     ADDHOST NOTIF</b>
<b>     Add Domain New</b>
<code>━━━━━━━━━━━━━━</code>
<b>IP VPS  :</b> <code>$MYIP </code>
<b>DOMAIN :</b> <code>$SUB_DOMAIN</code>
<b>NS  :</b> <code>$NS_DOMAIN</code>
<b>DOM ALT:</b> <code>$SUB_DOMAINX</code>
<b>NS ALT :</b> <code>$NS_DOMAINX</code>
<b>DOM ALTER :</b> <code>$SUB_DOMAINZ</code>
<b>NS ALTER :</b> <code>$NS_DOMAINZ</code>
<code>━━━━━━━━━━━━━━</code>
<code>NEW ADD DOMAIN $Dom $Dom1 $Dom2 $Dom3 $Dom4</code>
<code>BY BOT : @myridwan</code>
"
curl -s --max-time $TIME -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
}


function pointing(){

subdomainsshweb
ridwan_ns_cloudflare
wokzcom_ns_cloudflare
wokznet_ns_cloudflare
wokzxyz_ns_cloudflare
notif_addhost

echo -e "Done Record Domain Utama= ${SUB_DOMAIN} For your VPS"
echo -e "Done Record Alter Domain 1= ${SUB_DOMAINX} For your VPS"
echo -e "Done Record Alternate Domain 2= ${SUB_DOMAINZ} For your VPS"
sleep 1
}

function cekdomain(){
tempikpink(){
echo -e  "${tyblue}┌──────────────────────────────────────────┐${NC}"
echo -e  "${tyblue}│              \033[1;37mTERIMA KASIH                ${tyblue}│${NC}"
echo -e  "${tyblue}│         \033[1;37mSUDAH MENGGUNAKAN SCRIPT         ${tyblue}│${NC}"
echo -e  "${tyblue}│                \033[1;37mDARI YADDY TAMPAN MAX               ${tyblue}│${NC}"
echo -e  "${tyblue}└──────────────────────────────────────────┘${NC}"
echo ""
}
clear
apt install jq curl -y
currentdomain=$(cat /etc/xray/domain)
    if [ -f "/etc/xray/domain" ]; then
        echo "Domainmu saat ini adalah ${currentdomain} "
    else
        echo "Belum ada domain terpasang di vps ini "
    fi
echo ""
echo -e "\e[1;32m════════════════════════════════════════════════════════════\e[0m"
echo ""
echo "jika kamu sudah punya domain sendiri, pilih nomer 1"
echo "jika kamu mau nebeng domain ku ,secara custom , pilih nomer 2"
echo "jika ingin batal , skip , atau gak jadi pointing domain, pilih nomer 3"
echo "jika kamu mau nebeng domain ku ,dengan nama acak, pilih selain nomer 1 2 3 atau tekan enter"
echo ""
echo -e "   .----------------------------------."
echo -e "   |\e[1;32mPlease select a domain type below \e[0m|"
echo -e "   '----------------------------------'"
echo -e "     \e[1;32m1)\e[0m Enter your Subdomain"
echo -e "     \e[1;32m2)\e[0m Use a custom Subdomain"
echo -e "     \e[1;32m3)\e[0m Skip , Saya tidak ingin mengganti Subdomain yg sekarang"
echo -e "   ------------------------------------"
sleep 5
clear
echo -e ""
echo -e "${tyblue}┌──────────────────────────────────────────┐${NC}"
echo -e "${tyblue}│ \033[1;37mPlease select a your Choice to Set Domain${tyblue}│${NC}"
echo -e "${tyblue}└──────────────────────────────────────────┘${NC}"
echo -e "${tyblue}┌──────────────────────────────────────────┐${NC}"
echo -e "${tyblue}│  [ 1 ]  \033[1;37mGunakan Domain Sendiri/Domainmu       ${NC}"
echo -e "${tyblue}│  "                                        
echo -e "${tyblue}│  [ 2 ]  \033[1;37mGunakan Domain Dari Scriptnya      ${NC}"
echo -e "${tyblue}│     "                                     
echo -e "${tyblue}│  [ 3 ]  \033[1;37mSkip , Saya tidak ingin mengganti Subdomain yg sekarang"       ${NC}"
echo -e "${tyblue}│  "                                        
echo -e "${tyblue}└──────────────────────────────────────────┘${NC}"
read -p "   Please select numbers 1-2 or Any Button(Random) : " host
echo ""
    if [[ $host == "1" ]]; then
        echo -e "   \e[1;32mPlease Enter Your Subdomain $NC"
        read -rp "Input DOMAIN Kamu : " -e domainmu
        if [ -z ${domainmu} ]; then
            echo -e " Anda belum memasukkan domain! Then a random domain will be created"
            randomsubdomain
            notif_addhost
            rm -rf cf.sh
            tempikpink
        else
	        echo "$domainmu" > /etc/xray/domain
            echo "$domainmu" > /root/domain
            echo "IP=$domainmu" > /var/lib/yaddykakkoii/ipvps.conf
            echo "IP=$domainmu" >> /var/lib/kyt/ipvps.conf
            tempikpink
        fi
        clear
    elif [[ $host == "2" ]]; then
        pointing
        rm -rf cf.sh
        clear
        tempikpink
    elif [[ $host == "3" ]]; then
        echo " skipp gaess "
        rm -rf cf.sh
        clear
        tempikpink
    else
        echo -e "Random Subdomain/Domain is used"
        sleep 3
        randomsubdomain
        notif_addhost
        rm -rf cf.sh
        clear
        tempikpink
    fi
}
cekdomain
