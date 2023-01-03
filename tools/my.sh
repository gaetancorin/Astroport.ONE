#shellcheck shell=sh disable=SC2034

Base32Normalize() {
    awk '{printf $0}' | basenc --base32 | Normalize
}

Normalize() {
    awk '{print tolower($1)}' | sed 's/\(_\|+\)/./g; s/=//g;'
}

Revert() {
    awk -F. '{for (i=NF; i>1; i--) printf("%s.",$i); print $1;}'
}

isLan() {
    local isLan=$(ip route |awk '$1 == "default" {print $3}' | grep -E "/(^127\.)|(^192\.168\.)|(^10\.)|(^172\.1[6-9]\.)|(^172\.2[0-9]\.)|(^172\.3[0-1]\.)|(^::1$)|(^[fF][cCdD])/" \
               || route -n |awk '$1 == "0.0.0.0" {print $2}' | grep -E "/(^127\.)|(^192\.168\.)|(^10\.)|(^172\.1[6-9]\.)|(^172\.2[0-9]\.)|(^172\.3[0-1]\.)|(^::1$)|(^[fF][cCdD])/" \
               || true)
    [ -n "$isLan" ] && echo "$isLan" || true
} 2>/dev/null

isPlayerLegal() {
    local isPlayerLegal=$(cat "$(myPlayerPath)"/.legal 2>/dev/null || true)
    [ -n "$isPlayerLegal" ] && echo "$isPlayerLegal" || true
}

myAstroFeedKey() {
    local myAstroFeedKey=$(ipfs --api "$(myIpfsApi)" key list -l | awk '$2 == "'"$(myPlayerFeed)"'" {print $1}')
    [ -n "$myAstroFeedKey" ] && echo "$myAstroFeedKey"
}

myAstroFeedKeyFile() {
    local myAstroFeedKeyFile="$(myIpfsKeyStore)/key_$(myPlayerFeed | Base32Normalize)"
    [ -f "$myAstroFeedKeyFile" ] && echo "$myAstroFeedKeyFile"
}

myAstroKey() {
    local myAstroKey=$(ipfs --api "$(myIpfsApi)" key list -l | awk '$2 == "'"$(myPlayer)"'" {print $1}')
    [ -n "$myAstroKey" ] && echo "$myAstroKey"
}

myAstroKeyFile() {
    local myAstroKeyFile="$(myIpfsKeyStore)/key_$(myPlayer | Base32Normalize)"
    [ -f "$myAstroKeyFile" ] && echo "$myAstroKeyFile"
}

myAstroPath() {
    local myAstroPath=$(cd ~/.zen/Astroport.ONE/ && pwd -P)
    [ -n "$myAstroPath" ] && echo "$myAstroPath"
}

myDate() {
    local myDate=$(date -u +"%Y%m%d%H%M%S%4N")
    [ -n "$myDate" ] && echo "$myDate"
}

myDomainName() {
    local myDomainName=$(domainname 2>/dev/null) && [ "$myDomainName" = "(none)" ] && myDomainName=$(hostname -d 2>/dev/null) && [ -z "$myDomainName" ] && myDomainName="localhost"
    [ -n "$myDomainName" ] && echo "$myDomainName"
}

myHttp() {
    [ -n "$(myHttpHeader)" ] \
     && local myHttp="$(myHttpHeader)

"    || local myHttp=""
    [ -n "$(myHttpContent)" ] && myHttp="${myHttp}$(myHttpContent)"
    [ -n "$myHttp" ] && echo "$myHttp"
}

myHttpContent() {
    [ -n "$(myIpfsHash)" ] \
     && local myHttpContent="<html><head><title>302 Found</title></head><body><h1>Found</h1>
<p>The document is <a href=\"ipfs/$(myIpfsHash)\">here</a> in IPFS.</p></body></html>" \
     && echo "$myHttpContent"
}

myHttpHeader() {
    [ -n "$(myIpfsHash)" ] \
     && local myHttpHeader="HTTP/1.0 302 Found
Content-Type: text/html; charset=UTF-8
Content-Length: $(myHttpContent |wc -c)
Date: $(date -R)
Location: ipfs/$(myIpfsHash)
Server: and" \
     && [ -n "$(myIpfsKey)" ] && myHttpHeader="${myHttpHeader}
set-cookie: AND=$(myIpfsKey); expires=$(date -R -d "+1 month"); path=/; domain=.$(myDomainName); Secure; SameSite=lax"
    [ -n "$myHttpHeader" ] && echo "$myHttpHeader"
}

myHome() {
    local myHome=$(cd ~ && pwd -P)
    [ -n "$myHome" ] && echo "$myHome"
}

myHostName() {
    local myHostName=$(hostname |sed 's/\.'"$(myDomainName)"'$//')
    [ -n "$(myDomainName)" ] && myHostName="${myHostName}.$(myDomainName)"
    [ -n "$myHostName" ] && echo "$myHostName"
}

myIp() {
    local myIp=$(hostname -I | awk '{print $1}' | head -n 1)
    [ -n "$myIp" ] && echo "$myIp" || echo "127.0.0.1"
}

myIpfs() {
    [ -n "$(myIpfsHash)" ] \
     && local myIpfs="${myIPFS}/ipfs/$(myIpfsHash)" \
     && echo "$myIpfs"
}

myIpfsApi() {
    ipfs --api "$(cat "$(myHome)"/.ipfs/api)" swarm peers >/dev/null 2>&1 \
     && local myIpfsApi=$(cat "$(myHome)"/.ipfs/api)
    [ -n "$myIpfsApi" ] && echo "$myIpfsApi"
}

myIpfsApiGw() {
    [ -n "$isLAN" ] \
     && local myIpfsApiGw="http://ipfs.localhost:5001" \
     || local myIpfsApiGw="https://ipfs.$(myHostName)/api"
    [ -n "$myIpfsApiGw" ] && echo "$myIpfsApiGw"
}

myIpfsBootstrapNode() {
    [ -n "$(myIpfsBootstrapNodes)" ] \
     && local myIpfsBootstrapNode=$(myIpfsBootstrapNodes | shuf | head -1)
    [ -n "$myIpfsBootstrapNode" ] && echo "$myIpfsBootstrapNode"
}

myIpfsBootstrapNodes() {
    [ -f "$(myAstroPath)/A_boostrap_nodes.txt" ] \
     && local myIpfsBootstrapNodes=$(awk -F/ '$6 != "" {print}' "$(myAstroPath)/A_boostrap_nodes.txt")
    [ -n "$myIpfsBootstrapNodes" ] && echo "$myIpfsBootstrapNodes"
}

myIpfsGw() {
    [ -f "$(myAstroPath)/A_boostrap_nodes.txt" ] \
     && local myIpfsGw=$(head -n2 "$(myAstroPath)/A_boostrap_nodes.txt" | tail -n 1 | cut -d ' ' -f 2)
    [ -n "$myIpfsGw" ] && echo "$myIpfsGw"
}

myIpfsHash() {
    [ -f "$(myPath)"/localhost/latest ] \
     && local myIpfsHash=$(cat "$(myPath)"/localhost/latest) \
     || local myIpfsHash=$(myHtml |ipfs add -q)
    [ ! -f "$(myPath)"/localhost/latest ] \
     && echo "$myIpfsHash" > "$(myPath)"/localhost/latest
    [ -n "$myIpfsHash" ] && echo "$myIpfsHash"
}

myIpfsKey() {
    local myIpfsKey=$(ipfs --api "$(myIpfsApi)" key list -l | awk '$2 == "self" {print $1}')
    [ -n "$myIpfsKey" ] && echo "$myIpfsKey"
}

myIpfsKeyStore() {
    local myIpfsKeyStore=$(cd "$(myHome)"/.ipfs/keystore && pwd -P)
    [ -n "$myIpfsKeyStore" ] && echo "$myIpfsKeyStore"
}

myIpfsPeerId() {
    local myIpfsPeerId=$(jq -r .Identity.PeerID "$(myHome)"/.ipfs/config)
    [ -n "$myIpfsPeerId" ] && echo "$myIpfsPeerId"
}

myIpns() {
    [ -n "$(myIpfsKey)" ] \
     && local myIpns="${myIPFS}/ipns/$(myIpfsKey)" \
     && echo "$myIpns"
}

myPath() {
    local myPath=$(cd ~/.zen/game/players/ && pwd -P)
    [ -n "$myPath" ] && echo "$myPath"
}

myPlayer() {
    local myPlayer=$(cat "$(myPath)"/.current/.player 2>/dev/null)
    [ -n "$myPlayer" ] && echo "$myPlayer"
}

myPlayerApi() {
    ipfs --api "$(cat "$(myPlayerPath)"/.ipfs/api )" swarm peers >/dev/null 2>&1 \
     && local myPlayerApi=$(cat "$(myPlayerPath)"/.ipfs/api)
    [ -n "$myPlayerApi" ] && echo "$myPlayerApi"
}

myPlayerApiGw() {
    [ -n "$(myReyalp)" ] \
     && { [ -n "$isLAN" ] \
       && local myPlayerApiGw="http://ipfs.$(myHostName):5001" \
       || local myPlayerApiGw="https://ipfs.$(myReyalp).$(myHostName)/api" \
     ;}
    [ -n "$myPlayerApiGw" ] && echo "$myPlayerApiGw"
}

myPlayerDomain() {
    echo "$(myPlayer)" | grep "@" >/dev/null \
     && local myPlayerDomain=$(echo "$(myPlayer)" | awk -F "@" '{print $2}' | Normalize)
    [ -n "$myPlayerDomain" ] && echo "$myPlayerDomain"
}

myPlayerFeed() {
    [ -n "$(myPlayer)" ] \
     && local myPlayerFeed="$(myPlayer)_feed"
    [ -n "$myPlayerFeed" ] && echo "$myPlayerFeed"
}

myPlayerFeedKey() {
    local myPlayerFeedKey=$(ipfs --api "$(myPlayerApi)" key list -l | awk '$2 == "'"$(myPlayerFeed)"'" {print $1}')
    [ -n "$myPlayerFeedKey" ] && echo "$myPlayerFeedKey"
}

myPlayerFeedKeyFile() {
    local myPlayerFeedKeyFile="$(myIpfsKeyStore)/key_$(myPlayerFeed | Base32Normalize)"
    [ -f "$myPlayerFeedKeyFile" ] && echo "$myPlayerFeedKeyFile"
}

myPlayerG1Pub() {
    local myPlayerG1Pub=$(cat "$(myPlayerPath)"/.g1pub 2>/dev/null)
    [ -n "$myPlayerG1Pub" ] && echo "$myPlayerG1Pub"
}

myPlayerHome() {
    echo "$(myPlayer)" | grep "@" >/dev/null \
     && local myPlayerHome=$(cd "$(dirname "$(myHome)")/$(myPlayer)" && pwd -P)
    [ -n "$myPlayerHome" ] && echo "$myPlayerHome"
}

myPlayerHost() {
    [ -n "$(myReyalp)" ] \
     && { [ -n "$isLAN" ] \
       && local myPlayerHost="$(myHostName)" \
       || local myPlayerHost="$(myReyalp).$(myHostName)" \
     ;}
    [ -n "$myPlayerHost" ] && echo "$myPlayerHost"
}

myPlayerKey() {
    local myPlayerKey=$(ipfs --api "$(myPlayerApi)" key list -l | awk '$2 == "'"$(myPlayer)"'" {print $1}')
    [ -n "$myPlayerKey" ] && echo "$myPlayerKey"
}

myPlayerKeyFile() {
    local myPlayerKeyFile="$(myPlayerKeyStore)/key_$(myPlayer | Base32Normalize)"
    [ -f "$myPlayerKeyFile" ] && echo "$myPlayerKeyFile"
}

myPlayerKeyStore() {
    local myPlayerKeyStore=$(cd "$(myPlayerPath)"/.ipfs/keystore && pwd -P)
    [ -n "$myPlayerKeyStore" ] && echo "$myPlayerKeyStore"
}

myPlayerNs() {
    local myPlayerNs=$(cat "$(myPlayerPath)"/.playerns 2>/dev/null)
    [ -n "$myPlayerNs" ] && echo "$myPlayerNs"
}

myPlayerPath() {
    [ -n "$(myPlayer)" ] \
     && local myPlayerPath=$(cd "$(myPath)"/"$(myPlayer)" && pwd -P)
    [ -n "$myPlayerPath" ] && echo "$myPlayerPath"
}

myPlayerPseudo() {
    local myPlayerPseudo=$(cat "$(myPlayerPath)"/.pseudo 2>/dev/null)
    [ -n "$myPlayerPseudo" ] && echo "$myPseudo"
}

myPlayerUser() {
    echo "$(myPlayer)" | grep "@" >/dev/null \
     && local myPlayerUser=$(echo "$(myPlayer)" | awk -F "@" '{print $1}' | Normalize)
    [ -n "$myPlayerUser" ] && echo "$myPlayerUser"
}

myPlayerUserDomain() {
    [ -n "$(myPlayerDomain)" ] \
     && local myPlayerUserDomain="$(myPlayerUser).$(myPlayerDomain)" \
     && echo "$myPlayerUserDomain"
}

myReyalp() {
    [ -n "$(myPlayerDomain)" ] \
     && local myReyalp="$(myPlayerUser).$(myPlayerDomain)" \
     && echo "$myReyalp" \
     || echo "$(myPlayer)"
}

myReyalpHome() {
    [ -n "$(myReyalpResuPath)" ] \
     && local myReyalpHome=$(cd "$(case ${RESU_HOME:-mail} in \
       dns) echo /dns/$(myReyalpResuPath) ;; \
       *) echo /home/$(myReyalpMail) ;; \
     esac)" && pwd -P)
    [ -n "$myReyalpHome" ] && echo "$myReyalpHome"
}

myReyalpMail() {
    [ -n "$(myPlayerDomain)" ] \
     && local myReyalpMail=$(echo "$(myPlayer)" | Normalize)
    [ -n "$myReyalpMail" ] && echo "$myReyalpMail"
}

myReyalpNiamod() {
    [ -n "$(myPlayerDomain)" ] \
     && local myReyalpNiamod=$(echo "$(myPlayerDomain)" | Revert)
    [ -n "$myReyalpNiamod" ] && echo "$myReyalpNiamod"
}

myReyalpResu() {
    [ -n "$(myPlayerUser)" ] \
     && local myReyalpResu=$(echo "$(myPlayerUser)" | Revert)
    [ -n "$myReyalpResu" ] && echo "$myReyalpResu"
}

myReyalpResuNiamod() {
    [ -n "$(myReyalpNiamod)" ] \
     && local myReyalpResuNiamod="$(myReyalpNiamod).$(myReyalpResu)" \
     && echo "$myReyalpResuNiamod"
}

myReyalpResuPath() {
    [ -n "$(myReyalpResuNiamod)" ] \
     && local myReyalpResuPath=$(echo "$(myReyalpResuNiamod)" | sed 's/\./\//g';)
    [ -n "$myReyalpResuPath" ] && echo "$myReyalpResuPath"
}

myHtml() {
    local myHtml=$($RUN sed \
        -e "s~\"http://127.0.0.1:1234\"~\"${myASTROPORT}\"~g" \
        -e "s~http://127.0.0.1:8080~${myIPFS}~g" \
        -e "s~http://127.0.0.1:12345~http://${myHOST}:12345~g" \
        -e "s~https://ipfs.copylaradio.com~${myIPFSGW}~g" \
        -e "s~_IPFSNODEID_~${IPFSNODEID}~g" \
        -e "s~_HOSTNAME_~$(hostname)~g" \
        -e "s~.000.~.$(printf '%03d' "$(seq 0 17 |shuf -n 1)").~g" \
      ~/.zen/Astroport.ONE/templates/register.html)
    [ -z "$isLAN" ] \
     || myHtml=$($RUN echo "$myHtml" | sed \
      -e "s~<input type='"'hidden'"' name='"'salt'"' value='"'0'"'>~<input name='"'salt'"' value='"''"'>~g" \
      -e "s~<input type='"'hidden'"' name='"'pepper'"' value='"'0'"'>~<input name='"'pepper'"' value='"''"'>~g")
    [ -n "$myHtml" ] && echo "$myHtml"
}

myTs() {
    local myTs=$(date +%s)
    [ -n "$myTs" ] && echo "$myTs"
}

myTube() {
    [ -f "$(myAstroPath)/A_boostrap_nodes.txt" ] \
     && local myTube=$(head -n2 "$(myAstroPath)/A_boostrap_nodes.txt" | tail -n 1 | cut -d ' ' -f 3)
    [ -n "$myTube" ] && echo "$myTube"
}

myAstroTube() {
    [ -f "$(myAstroPath)/A_boostrap_nodes.txt" ] \
     && local myAstroTube=$(head -n2 "$(myAstroPath)/A_boostrap_nodes.txt" | tail -n 1 | cut -d ' ' -f 3 | sed "s~ipfs~astroport~g")
    [ -n "$myAstroTube" ] && echo "$myAstroTube"
}

IPFSNODEID="$(myIpfsPeerId)"
MOATS="$(myDate)"
isLAN="$(isLan)"
myASTROPORT="http://astroport.$(myDomainName):1234"
myAPI="http://ipfs.$(myDomainName):5001"
myDATA="https://data.gchange.fr"
myGCHANGE="https://www.gchange.fr"
myHOST="astroport.$(myDomainName)"
myIP="$(myIp)"
myIPFS="http://ipfs.$(myDomainName):8080"
myIPFSGW="$(myIpfsGw)"
myTUBE="$(myTube)"
myASTROTUBE="https://$(myAstroTube)"

## WAN STATION
[ -z "$isLAN" ] \
 && myASTROPORT="https://astroport.$(myDomainName)" \
 && myAPI="https://ipfs.$(myHostName)" \
 && myIPFS="https://ipfs.$(myDomainName)" \
 && myHOST="astroport.$(myHostName)"