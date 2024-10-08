
# Documentação do Script de Exportação de Scripts do Genesys Cloud

## Descrição
Este script permite a exportação de todos os scripts de tela do Genesys Cloud, salvando as informações em arquivos JSON. É necessário ter o `gc CLI` instalado e configurado com o perfil padrão.

---

## Requisitos
- **gc CLI**: O CLI do Genesys Cloud deve estar instalado e configurado com o perfil padrão. Para mais informações sobre como instalar e configurar, consulte a [documentação oficial do Genesys Cloud](https://developer.genesys.cloud/).

## Passo a Passo

1. **Clone o repositório**
   ```bash
   git clone https://github.com/wagner-damiao/genesys_cloud_cli_scripts/tree/main/scripts/export
   cd <NOME_DA_PASTA_DO_REPOSITORIO>
   ```

2. **Crie um arquivo de script**
   Crie um arquivo de script com o nome `export_genesys_scripts.sh` e cole o código abaixo:

   ```bash
   #!/bin/bash

   # Diretório para salvar os arquivos exportados
   OUTPUT_DIR="./genesys_scripts_export"

   # Criar o diretório de saída se não existir
   mkdir -p "$OUTPUT_DIR"

   echo "Iniciando a exportação de todos os scripts de tela do Genesys Cloud..."

   # Obter a lista de scripts com um pagesize de 100 e salvar em um arquivo JSON
   gc scripts list --pageSize 100 > "$OUTPUT_DIR/scripts_raw_output.json"

   echo "JSON retornado salvo em $OUTPUT_DIR/scripts_raw_output.json para análise."

   # Extrair os IDs dos scripts do JSON e remover aspas
   cat "$OUTPUT_DIR/scripts_raw_output.json" | jq -r '.entities[] | .id' > "$OUTPUT_DIR/script_ids.txt"

   echo "IDs de scripts extraídos salvos em $OUTPUT_DIR/script_ids.txt."

   # Verificar se o arquivo script_ids.txt existe
   if [ ! -f "$OUTPUT_DIR/script_ids.txt" ]; then
     echo "Arquivo script_ids.txt não encontrado no diretório $OUTPUT_DIR."
     echo "Certifique-se de que a extração dos IDs foi executada corretamente."
     exit 1
   fi

   # Loop para exportar cada script usando os IDs do arquivo script_ids.txt
   while read -r scriptId; do
     echo "Exportando script com ID: $scriptId"
     gc scripts get "$scriptId" > "$OUTPUT_DIR/script_$scriptId.json"
   done < "$OUTPUT_DIR/script_ids.txt"

   echo "Exportação concluída! Todos os scripts foram salvos no diretório: $OUTPUT_DIR"
   ```

3. **Torne o script executável**
   ```bash
   chmod +x export_genesys_scripts.sh
   ```

4. **Execute o script**
   ```bash
   ./export_genesys_scripts.sh
   ```

5. **Verifique os arquivos exportados**
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
   git clone https://github.com/wagner-damiao/genesys_cloud_cli_scripts/tree/main/scripts/export
   cd <REPOSITORY_FOLDER_NAME>
   ```

2. **Create a script file**
   Create a script file named `export_genesys_scripts.sh` and paste the code below:

   ```bash
   #!/bin/bash

   # Directory to save the exported files
   OUTPUT_DIR="./genesys_scripts_export"

   # Create the output directory if it doesn't exist
   mkdir -p "$OUTPUT_DIR"

   echo "Starting the export of all Genesys Cloud screen scripts..."

   # Retrieve the list of scripts with a pagesize of 100 and save it to a JSON file
   gc scripts list --pageSize 100 > "$OUTPUT_DIR/scripts_raw_output.json"

   echo "Returned JSON saved to $OUTPUT_DIR/scripts_raw_output.json for analysis."

   # Extract script IDs from the JSON and remove quotes from the IDs
   cat "$OUTPUT_DIR/scripts_raw_output.json" | jq -r '.entities[] | .id' > "$OUTPUT_DIR/script_ids.txt"

   echo "Extracted script IDs saved to $OUTPUT_DIR/script_ids.txt."

   # Check if the script_ids.txt file exists
   if [ ! -f "$OUTPUT_DIR/script_ids.txt" ]; then
     echo "File script_ids.txt not found in directory $OUTPUT_DIR."
     echo "Please ensure that the ID extraction was executed correctly."
     exit 1
   fi

   # Loop to export each script using the IDs from the script_ids.txt file
   while read -r scriptId; do
     echo "Exporting script with ID: $scriptId"
     gc scripts get "$scriptId" > "$OUTPUT_DIR/script_$scriptId.json"
   done < "$OUTPUT_DIR/script_ids.txt"

   echo "Export completed! All scripts have been saved in the directory: $OUTPUT_DIR"
   ```

3. **Make the script executable**
   ```bash
   chmod +x export_genesys_scripts.sh
   ```

4. **Run the script**
   ```bash
   ./export_genesys_scripts.sh
   ```

5. **Check the exported files**
   The JSON files of the scripts will be located in the `genesys_scripts_export` directory.
