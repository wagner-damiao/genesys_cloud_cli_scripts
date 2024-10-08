
# Documentação do Script de Exportação de Scripts do Genesys Cloud

## Descrição
Este script permite a exportação de todos os scripts de tela do Genesys Cloud, salvando as informações em arquivos JSON. É necessário ter o `gc CLI` instalado e configurado com o perfil padrão.

---

## Requisitos
- **gc CLI**: O CLI do Genesys Cloud deve estar instalado e configurado com o perfil padrão. Para mais informações sobre como instalar e configurar, consulte a [documentação oficial do Genesys Cloud](https://developer.genesys.cloud/).

## Passo a Passo

1. **Clone o repositório**
   ```bash
   git clone https://github.com/wagner-damiao/genesys_cloud_cli_scripts.git
      ```

2. **Torne o script executável**
   ```bash
   chmod +x export_genesys_scripts.sh
   ```

3. **Execute o script**
   ```bash
   ./export_genesys_scripts.sh
   ```

4. **Verifique os arquivos exportados**
   Os arquivos JSON dos scripts estarão localizados no diretório `genesys_scripts_export`.

---

# Documentation for the Genesys Cloud Script Export

## Description
This script allows the export of all screen scripts from Genesys Cloud, saving the information in JSON files. It is necessary to have the `gc CLI` installed and configured with the default profile.

---

## Requirements
- **gc CLI**: The Genesys Cloud CLI must be installed and configured with the default profile. For more information on how to install and configure, see the [official Genesys Cloud documentation](https://developer.genesys.cloud/).

## Step-by-Step Guide

1. **Clone the repository**
   ```bash
  git clone https://github.com/wagner-damiao/genesys_cloud_cli_scripts.git
   
   ```

2. **Make the script executable**
   ```bash
   chmod +x export_genesys_scripts.sh
   ```

3. **Run the script**
   ```bash
   ./export_genesys_scripts.sh
   ```

4. **Check the exported files**
   The JSON files of the scripts will be located in the `genesys_scripts_export` directory.
