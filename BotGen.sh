#!/bin/bash
# -*- ENCODING: UTF-8 -*-
mkdir -m 777 -p /etc/drowkbot
CIDdir=/etc/drowkbot && [[ ! -d ${CIDdir} ]] && mkdir -m 777 -p ${CIDdir}
echo "ᎠꭱꮻꮃᏦᏀᏴꮻꭲ">$CIDdir/.botname

CIDimg=/etc/tokenIMG && [[ ! -d ${CIDimg} ]] && mkdir ${CIDimg}
SRC="${CIDdir}/code-bot" && [[ ! -d ${SRC} ]] && mkdir -m 777 -p ${SRC}
CID="${CIDdir}/User-ID" && [[ ! -e ${CID} ]] && echo > ${CID}
CIDRESS="${CIDdir}/RESSELLERS" && [[ ! -e ${CIDRESS} ]] &&  mkdir ${CIDRESS}
keytxt="${CIDdir}/keys" && [[ ! -d ${keytxt} ]] && mkdir ${keytxt}
timg="${CIDimg}/img" && [[ ! -d ${timg} ]] && mkdir ${timg}
[[ $(dpkg --get-selections|grep -w "jq"|head -1) ]] || apt-get install jq -y &>/dev/null
[[ ! -e "/bin/ShellBot.sh" ]] && wget -O /bin/ShellBot.sh https://raw.githubusercontent.com/NetVPS/Generador-BOT/main/Otros/ShellBot.sh &> /dev/null
[[ -e /etc/texto-bot ]] && rm /etc/texto-bot
LINE="   ••••••••••••••••••••••••••••••••••••••••••••••••••••••••••" && instal="𝕀𝕟𝕤𝕥𝕒𝕝𝕒𝕕𝕠𝕣: " && cgh="𝐂𝐡𝐮𝐦𝐨𝐆𝐇." && latam="𝐋𝐀𝐓𝐀𝐌." && casita="𝐋𝐚𝐂𝐚𝐬𝐢𝐭𝐚𝐌𝐗."
line="▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰" && botname="$(bash $(pwd)/.name)" && namebot="$(bash $(pwd)/.botname)"

# Importando API
source ShellBot.sh
source ${SRC}/menu
source ${SRC}/ayuda
source ${SRC}/cache
source ${SRC}/invalido
source ${SRC}/status
source ${SRC}/reinicio
source ${SRC}/myip
source ${SRC}/id
source ${SRC}/back_ID
source ${SRC}/listID
source ${SRC}/gerar_key
source ${SRC}/power
source ${SRC}/comandos
source ${SRC}/update
source ${SRC}/donar
source ${SRC}/costes
#source ${SRC}/kill_drop.sh

# Token del bot
bot_token="$(cat ${CIDdir}/token)"

# Inicializando el bot
ShellBot.init --token "$bot_token" --monitor --flush --return map
ShellBot.username
reply () {
	[[ ! -z ${callback_query_message_chat_id[$id]} ]] && var=${callback_query_message_chat_id[$id]} || var=${message_chat_id[$id]}

		 	 ShellBot.sendMessage	--chat_id  $var \
									--text "$comando" \
									--parse_mode html \
									--reply_markup "$(ShellBot.ForceReply)"
	[[ "${callback_query_data}" = /del || "${message_text}" = /del ]] && listID_src
	#[[ "${callback_query_data}" = /img || "${message_text}" = /img ]] && listID_src
	[[ "${callback_query_data}" = '/banIP' || "${message_text}" = '/banIP' ]] && list_IP
	
}




menu_print () {
[[ ! -z ${callback_query_message_chat_id[$id]} ]] && var=${callback_query_message_chat_id[$id]} || var=${message_chat_id[$id]}

	if [[ $(echo $permited|grep "${chatuser}") = "" ]]; then
				# ShellBot.sendMessage 	--chat_id ${message_chat_id[$id]} \
				ShellBot.sendMessage 	--chat_id $var \
										--text "<i>$(echo -e $bot_retorno)</i>" \
										--parse_mode html \
										--reply_markup "$(ShellBot.InlineKeyboardMarkup -b 'botao_user')"
	else
				# ShellBot.sendMessage 	--chat_id ${message_chat_id[$id]} \
				ShellBot.sendMessage 	--chat_id $var \
										--text "<i>$(echo -e $bot_retorno)</i>" \
										--parse_mode html \
										--reply_markup "$(ShellBot.InlineKeyboardMarkup -b 'botao_conf')"
	fi
}
inst_print () {
[[ ! -z ${callback_query_message_chat_id[$id]} ]] && var=${callback_query_message_chat_id[$id]} || var=${message_chat_id[$id]}

        if [[ $(echo $permited|grep "${chatuser}") = "" ]]; then
                                # ShellBot.sendMessage  --chat_id ${message_chat_id[$id]} \
                                ShellBot.sendMessage    --chat_id $var \
                                                                     --text "<i>$(echo -e $bot_retorno)</i>" \
                                                                     --parse_mode html \
                                                                     --reply_markup "$(ShellBot.InlineKeyboardMarkup -b 'botao_inst')"
        else
                                # ShellBot.sendMessage  --chat_id ${message_chat_id[$id]} \
                                ShellBot.sendMessage    --chat_id $var \
                                                                     --text "<i>$(echo -e $bot_retorno)</i>" \
                                                                     --parse_mode html \
                                                                     --reply_markup "$(ShellBot.InlineKeyboardMarkup -b 'botao_inst')"
        fi
}
menu_printSN () {
[[ ! -z ${callback_query_message_chat_id[$id]} ]] && var=${callback_query_message_chat_id[$id]} || var=${message_chat_id[$id]}

	if [[ $(echo $permited|grep "${chatuser}") = "" ]]; then
				ShellBot.sendMessage 	--chat_id $var \
				--text "<i>$(echo -e $bot_retorno)</i>" \
				--parse_mode html \
				--reply_markup "$(ShellBot.InlineKeyboardMarkup -b 'botao_send_id')"
	fi
}


download_file () {
# shellbot.sh editado linea 3986
user=User-ID
[[ -e ${CID} ]] && rm ${CID}
local file_id
          ShellBot.getFile --file_id ${message_document_file_id[$id]}
          ShellBot.downloadFile --file_path "${return[file_path]}" --dir "${CIDdir}"
		  [[ -e ${return[file_path]} ]] && mv ${return[file_path]} ${CID}
local bot_retorno="ID user botgen\n"
		bot_retorno+="$line\n"
		bot_retorno+="Se restauro con exito!!\n"
		bot_retorno+="$line\n"
		bot_retorno+=" FILE ${return[file_path]} \n"
		bot_retorno+="$line"
			ShellBot.sendMessage	--chat_id "${message_chat_id[$id]}" \
									--reply_to_message_id "${message_message_id[$id]}" \
									--text "<i>$(echo -e $bot_retorno)</i>" \
									--parse_mode html
return 0
}


msj_add () {
	      ShellBot.sendMessage --chat_id ${1} \
							--text "<i>$(echo -e $bot_retor)</i>" \
							--parse_mode html
}

upfile_fun () {
	[[ ! -z ${callback_query_message_chat_id[$id]} ]] && var=${callback_query_message_chat_id[$id]} || var=${message_chat_id[$id]}
          ShellBot.sendDocument --chat_id $var  \
                             --document @${1} \
                             #--caption  "$(echo -e "$bot_retorno")" \
                             #--parse_mode html \
                             #--reply_markup "$(ShellBot.ForceReply)"
							 #--reply_markup "$(ShellBot.InlineKeyboardMarkup -b "$2")"							 
}

upimg_fun () {
          ShellBot.sendDocument --chat_id $(cat ${CIDdir}/Admin-ID)  \
                             --document @${1} \
                             #--caption  "$(echo -e "$bot_retorno")" \
                             #--parse_mode html \
                             #--reply_markup "$(ShellBot.ForceReply)"
							 #--reply_markup "$(ShellBot.InlineKeyboardMarkup -b "$2")"							 
}
redes_print(){
[[ ! -z ${callback_query_message_chat_id[$id]} ]] && var=${callback_query_message_chat_id[$id]} || var=${message_chat_id[$id]}

        if [[ $(echo $permited|grep "${chatuser}") = "" ]]; then
                                # ShellBot.sendMessage  --chat_id ${message_chat_id[$id]} \
                                ShellBot.sendMessage    --chat_id $var \
                                                                     --text "<i>$(echo -e $bot_retorno)</i>" \
                                                                     --parse_mode html \
                                                                     --reply_markup "$(ShellBot.InlineKeyboardMarkup -b 'botao_redes')"
        else
                                # ShellBot.sendMessage  --chat_id ${message_chat_id[$id]} \
                                ShellBot.sendMessage    --chat_id $var \
                                                                     --text "<i>$(echo -e $bot_retorno)</i>" \
                                                                     --parse_mode html \
                                                                     --reply_markup "$(ShellBot.InlineKeyboardMarkup -b 'botao_redes')"
        fi
}
keys_print(){
[[ ! -z ${callback_query_message_chat_id[$id]} ]] && var=${callback_query_message_chat_id[$id]} || var=${message_chat_id[$id]}

        if [[ $(echo $permited|grep "${chatuser}") = "" ]]; then
                                # ShellBot.sendMessage  --chat_id ${message_chat_id[$id]} \
                                ShellBot.sendMessage    --chat_id $var \
                                                                     --text "<i>$(echo -e $bot_retorno)</i>" \
                                                                     --parse_mode html \
                                                                     --reply_markup "$(ShellBot.InlineKeyboardMarkup -b 'botao_keys')"
        else
                                # ShellBot.sendMessage  --chat_id ${message_chat_id[$id]} \
                                ShellBot.sendMessage    --chat_id $var \
                                                                     --text "<i>$(echo -e $bot_retorno)</i>" \
                                                                     --parse_mode html \
                                                                     --reply_markup "$(ShellBot.InlineKeyboardMarkup -b 'botao_keys')"
        fi
}
menu_key(){
local bot_retorno="$namebot\n$line"
bot_retorno+="SCRIPTS：🚀😎\n $line\n"
keys_print
}


invalido_fun () {
MSG_id=$((${message_message_id} + 1 ))
	[[ ! -z ${callback_query_message_chat_id[$id]} ]] && var=${callback_query_message_chat_id[$id]} || var=${message_chat_id[$id]}
	local bot_retorno="  $botname   \n"
		bot_retorno+="$line\n"
        bot_retorno+=" COMANDO NO PERMITIDO !!\n Quizas debes usar este /keygen \n O Posiblemente no estas Autorizado, clic aqui /prices o \n Contacta a $(cat < /etc/drowkbot/code-bot/resell) y adquiere una subscripcion \n Toca aqui para ayuda /ayuda \n"
        bot_retorno+="$line\n"
	    ShellBot.sendMessage --chat_id $var \
							--text "<i>$(echo -e $bot_retorno)</i>" \
							--parse_mode html
		sleep 5s
		msj_del ${message_message_id}
		msj_del ${MSG_id}
							return 0	
}


send_admin(){

	local bot_retorno2="$line\n"
	bot_retorno2+="🚀 Solicitud de autorizacion 🚀\n"
	bot_retorno2+="$line\n"
	bot_retorno2+="<u>Nombre</u>: ${callback_query_from_first_name}\n"
	[[ ! -z ${callback_query_from_username} ]] && bot_retorno2+="<u>Alias</u>: @${callback_query_from_username}\n"
	bot_retorno2+="<u>ID</u>: <code>${callback_query_from_id}</code>\n"
	bot_retorno2+="$line"

	bot_retorno="$line\n"
	bot_retorno+="     🚀| 𝔾𝕖𝕟𝕖𝕣𝕒𝕕𝕠𝕣 𝕕𝕖 𝕜𝕖𝕪𝕤 |🚀\n"
	bot_retorno+="           ⚜ by @drowkid01 ⚜\n"
	bot_retorno+="$line\n"
	bot_retorno+="      📨 𝑰𝑫 𝒆𝒏𝒗𝒊𝒂𝒅𝒐 𝒆𝒙𝒊𝒕𝒐𝒔𝒂𝒎𝒆𝒏𝒕𝒆. 📨\n"
	bot_retorno+="$line"
	comand_boton "volver"

	saveID "${callback_query_from_id}"
	var=$(cat < ${CIDdir}/Admin-ID)
	ShellBot.sendMessage 	--chat_id $var \
							--text "$(echo -e "$bot_retorno2")" \
							--parse_mode html \
							--reply_markup "$(ShellBot.InlineKeyboardMarkup -b 'botao_save_id')"

	return 0
}


msj_fun () {
	[[ ! -z ${callback_query_message_chat_id[$id]} ]] && var=${callback_query_message_chat_id[$id]} || var=${message_chat_id[$id]}
		      ShellBot.sendMessage --chat_id $var \
							--text "<i>$(echo -e "$bot_retorno")</i>" \
							--parse_mode html
	return 0
}

msj_del () {
	[[ ! -z ${callback_query_message_chat_id[$id]} ]] && var=${callback_query_message_chat_id[$id]} || var=${message_chat_id[$id]}
		      ShellBot.deleteMessage --chat_id $var --message_id $1 			  
	return 0
}
instaladores_dk(){
bot_retorno="${namebot}\n${line}\n"
bot_retorno+="		🚀 𝗘𝗹𝗶𝗷𝗮 𝗲𝗹 𝘀𝗰𝗿𝗶𝗽𝘁: 🚀\n $line \n"
inst_print
}
msj_img () {
#${timg}/id_${usrLOP}.png
local file_id
          ShellBot.getFile --file_id "$1"
          #ShellBot.downloadFile --file_path "${return[file_path]}" --dir "${timg}/id_${usrLOP}.png"
		  #[[ -e ${return[file_path]} ]] && mv ${return[file_path]} "${timg}/id_${usrLOP}.png1"

	#[[ ! -z ${callback_query_message_chat_id[$id]} ]] && var=${callback_query_message_chat_id[$id]} || var=${message_chat_id[$id]}
		      #ShellBot.sendPhoto --chat_id $var --photo @${timg}/id_${usrLOP}.png
			  #ShellBot.deleteMessage --chat_id $var --message_id $1
			  upimg_fun
local bot_retorno="ID user botgen\n"
		bot_retorno+="$line\n"
		bot_retorno+="Se restauro con exito!!\n"
		bot_retorno+="$line\n"
		bot_retorno+=" FILE ${return[file_path]} \n"
		bot_retorno+="$line"
			ShellBot.sendMessage	--chat_id "${message_chat_id[$id]}" \
									--reply_to_message_id "${message_message_id[$id]}" \
									--text "<i>$(echo -e $bot_retorno)</i>" \
									--parse_mode html	
	
	return 0
}

msj_chat () {
	[[ ! -z ${callback_query_message_chat_id[$id]} ]] && var=${callback_query_message_chat_id[$id]} || var=${message_chat_id[$id]}
		      ShellBot.sendChatAction --chat_id $var --action typing
			  #ShellBot.deleteMessage --chat_id $var --message_id $1 
	return 0
}

msj_donar () {
	[[ ! -z ${callback_query_message_chat_id[$id]} ]] && var=${callback_query_message_chat_id[$id]} || var=${message_chat_id[$id]}
	      ShellBot.sendMessage --chat_id $var \
							--text "<i>$(echo -e "$bot_retorno")</i>" \
							--parse_mode html \
							--reply_markup "$(ShellBot.InlineKeyboardMarkup -b 'botao_donar')"
	return 0
}
instalatam_rep(){
	bot_retorno="$namebot\n$line\n"
	bot_retorno+="<code>wget https://raw.githubusercontent.com/drowkid01/LATAM/main/LATAM && chmod +x LATAM && ./LATAM --start</code>\n"
	bot_retorno+="$line\n"
inst_print
}
instalchumo_rep () {
bot_retorno="$namebot\n$line\n"
bot_retorno+="<code> apt update -y; apt upgrade -y; wget -q https://raw.githubusercontent.com/drowkid01/modcgh/main/setup; chmod 777 setup; ./setup --ADMcgh</code>\n"
bot_retorno+="$line"
inst_print
}
instalcasita_rep () {
bot_retorno="$namebot\n$line\n"
bot_retorno+="<code>wget https://raw.githubusercontent.com/drowkid01/LACASITA/main/LACASITA.sh;chmod 777 LACASITA.sh;./LACASITA.sh</code>\n"
bot_retorno+="$line"
inst_print
}
saveID(){
	unset botao_save_id
	botao_save_id=''
	ShellBot.InlineKeyboardButton 	--button 'botao_save_id' --line 1 --text "Autorizar ID" --callback_data "/saveid $1"
}


botao_conf=''
botao_user=''
botao_donar=''
unset botao_send_id
botao_send_id=''
botao_keys=''
botao_redes=''
botao_inst=''
ShellBot.InlineKeyboardButton --button 'botao_send_id' --line 1 --text " 📨 SOLICITAR ACCESO 📨 " --callback_data '/menu_src'
ShellBot.InlineKeyboardButton --button 'botao_send_id' --line 1 --text ' 💲PRECIOS 💲' --callback_data '/priceson'
ShellBot.InlineKeyboardButton --button 'botao_send_id' --line 2 --text ' 👥VER GRUPO👥' --callback_data '1' --url "https://t.me/drowkid01"
ShellBot.InlineKeyboardButton --button 'botao_send_id' --line 2 --text '💬 CONTACTAR AL ADMIN 💬' --callback_data '1' --url "https://t.me/drowkid01"
ShellBot.InlineKeyboardButton --button 'botao_send_id' --line 3 --text ' 🔑 KEY FREE 🔑' --callback_data '1' --url "https://t.me/drowkid01"

ShellBot.InlineKeyboardButton --button 'botao_conf' --line 1 --text 'NEW ID' --callback_data '/add'
ShellBot.InlineKeyboardButton --button 'botao_conf' --line 1 --text 'QUITAR 🗑' --callback_data '/del'
ShellBot.InlineKeyboardButton --button 'botao_conf' --line 1 --text 'LISTAR 📋' --callback_data '/list'
ShellBot.InlineKeyboardButton --button 'botao_conf' --line 1 --text ' 🔎 ID' --callback_data '/buscar'

ShellBot.InlineKeyboardButton --button 'botao_conf' --line 2 --text ' ⚡𝙤𝙣/𝙤𝙛𝙛 ⚡ ' --callback_data '/power'
ShellBot.InlineKeyboardButton --button 'botao_conf' --line 2 --text '💎 𝙢𝙚𝙣𝙪 💎' --callback_data '/menu_src'

ShellBot.InlineKeyboardButton --button 'botao_conf' --line 3 --text '🔑 𝙠𝙚𝙮𝙜𝙚𝙣 🔑' --callback_data '/keygen'
ShellBot.InlineKeyboardButton --button 'botao_user' --line 1 --text '🔑 𝙠𝙚𝙮𝙜𝙚𝙣 🔑' --callback_data '/keygen'
ShellBot.InlineKeyboardButton --button 'botao_user' --line 2 --text ' 🧿 Ban|IP 📲' --callback_data "/banIP" '1' --url "https://t.me/$(cat < /etc/drowkbot/code-bot/resell)"
ShellBot.InlineKeyboardButton --button 'botao_user' --line 3 --text ' 💎 𝙢𝙚𝙣𝙪 💎 ' --callback_data '/menu_src'
# instaladores
ShellBot.InlineKeyboardButton --button 'botao_inst' --line 1 --text ' ⬅️️ Volver al menú anterior ⬅️ ' --callback_data '/menu_src'
ShellBot.InlineKeyboardButton --button 'botao_inst' --line 2 --text ' 🚀 𝐿𝐴𝑇𝐴𝑀 🚀 ' --callback_data '/ilatam'
ShellBot.InlineKeyboardButton --button 'botao_inst' --line 2 --text '🚀 𝐶ℎ𝑢𝑚𝑜𝐺𝐻 🚀' --callback_data '/instalchumo'
ShellBot.InlineKeyboardButton --button 'botao_inst' --line 3 --text '🚀 𝐿𝑎𝐶𝑎𝑠𝑖𝑡𝑎𝑀𝑋 🚀' --callback_data '/instalcasita'

# keys
ShellBot.InlineKeyboardButton --button 'botao_keys' --line 1 --text ' ⬅️ Volver al menú anterior ⬅️ ' --callback_data '/menu'
ShellBot.InlineKeyboardButton --button 'botao_keys' --line 2 --text ' 🔑 𝐿𝐴𝑇𝐴𝑀 🔑' --callback_data '/gerar_latam'
ShellBot.InlineKeyboardButton --button 'botao_keys' --line 2 --text ' 🔑 𝐶ℎ𝑢𝑚𝑜𝐺𝐻 🔑' --callback_data '/gerar_chumo'
ShellBot.InlineKeyboardButton --button 'botao_keys' --line 3 --text ' 🔑 ADMRufu 🔑 ' --callback_data '/gerar_rufu'
ShellBot.InlineKeyboardButton --button 'botao_keys' --line 3 --text ' 🔑 𝐶𝑎𝑠𝑖𝑡𝑎 🔑' --callback_data '/gerar_casita'

# redes

# Ejecutando escucha del bot
while true; do
    ShellBot.getUpdates --limit 100 --offset $(ShellBot.OffsetNext) --timeout 30
    for id in $(ShellBot.ListUpdates); do
	    chatuser="$(echo ${message_chat_id[$id]}|cut -d'-' -f2)"
	    [[ -z $chatuser ]] && chatuser="$(echo ${callback_query_from_id[$id]}|cut -d'-' -f2)"
	    echo $chatuser >&2
	    #echo "user id $chatuser"

	    comando=(${message_text[$id]})
	    [[ -z $comando ]] && comando=(${callback_query_data[$id]})
	    #echo "comando $comando"

	    [[ ! -e "${CIDdir}/Admin-ID" ]] && echo "null" > ${CIDdir}/Admin-ID
	    permited=$(cat ${CIDdir}/Admin-ID | awk '{print $1}')
	    comand
    done
done
