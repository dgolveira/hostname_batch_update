#!/bin/bash
#Douglas Oliveira new

# Lista de DNS para verificar
TOTAL_DNS_LIST=14

DNS_LIST=()
for i in $(seq 1 $TOTAL_DNS_LIST); do
    DNS_LIST+=("dominio-a$i.com.br")
    DNS_LIST+=("doninio-b$i.srv.br")
    DNS_LIST+=("dominio-c$i.com")
done

# Obtém o endereço IP externo do servidor atual
external_ip=$(curl -s ifconfig.me)

# Função para obter o IP de um DNS
get_ip_from_dns() {
    nslookup $1 | grep 'Address:' | tail -n1 | awk '{print $2}'
}

# Loop através da lista de DNS
for dns in "${DNS_LIST[@]}"; do
    dns_ip=$(get_ip_from_dns "$dns")

    # Compara o IP do DNS com o IP externo do servidor
    if [ "$dns_ip" == "$external_ip" ]; then
        # Configura o hostname removendo a parte '.ip.tv'
        new_hostname=${dns%.ip.tv}

        # Configura o hostname do servidor (requer privilégios de superusuário)
        sudo hostnamectl set-hostname "$new_hostname"
        echo "Hostname configurado para: $new_hostname"
        break
    fi
done
