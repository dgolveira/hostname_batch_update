Script de Configuração do Hostname
Este script verifica uma lista de domínios predefinida para encontrar um cujo IP corresponda ao IP externo do servidor em que está sendo executado. Uma vez encontrado, o script configura automaticamente o hostname do servidor para corresponder ao domínio encontrado.

Funcionalidades
Lista de DNS para Verificação: O script começa definindo uma lista de 14 grupos de domínios, gerando dinamicamente os nomes de domínio em três padrões diferentes e os adiciona a uma lista para verificação.

Obtenção do IP Externo: Utiliza o comando curl para consultar ifconfig.me, um serviço web que retorna o endereço IP externo do servidor.

Obtenção do IP de um DNS: Define uma função get_ip_from_dns que, dado um nome de domínio, utiliza o comando nslookup para encontrar seu endereço IP associado.

Comparação e Configuração do Hostname: Itera sobre a lista de domínios, verificando se algum deles corresponde ao IP externo do servidor. Caso positivo, extrai o nome do domínio (removendo um sufixo específico, se presente), e configura o hostname do servidor para este nome, utilizando hostnamectl com privilégios de superusuário.

Pré-requisitos
Bash shell
Acesso à internet
Privilégios de superusuário (para configurar o hostname)
Ferramentas curl, nslookup, e hostnamectl disponíveis no sistema
Como Usar
Salve o script em um arquivo, por exemplo, set_hostname.sh.
Dê permissão de execução ao arquivo: chmod +x set_hostname.sh.
Execute o script com privilégios de superusuário: sudo ./set_hostname.sh.
Notas Importantes
O script é projetado para sistemas que suportam o comando hostnamectl, comumente encontrado em distribuições Linux modernas como Ubuntu, Fedora, e CentOS.
A lista de domínios e o padrão de nomes podem ser modificados conforme necessário, adaptando-se ao ambiente específico onde o script será utilizado.
Esteja ciente de que a modificação do hostname pode afetar serviços e aplicações em execução no servidor. É recomendável utilizar este script em um ambiente controlado ou de teste antes de aplicá-lo em produção.