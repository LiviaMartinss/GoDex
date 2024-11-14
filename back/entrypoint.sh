#!/bin/bash
export RAILS_MASTER_KEY=seu_master_key_aqui
#!/bin/bash

# Configurar número máximo de tentativas e intervalo entre elas
MAX_RETRIES=30
RETRY_COUNT=0

echo "Aguardando o banco de dados..."

# Tentar conectar ao banco de dados
until nc -z -v -w30 db 5432 || [ $RETRY_COUNT -eq $MAX_RETRIES ]; do
  echo "Tentativa de conexão ao banco de dados ($RETRY_COUNT/$MAX_RETRIES)"
  sleep 1
  RETRY_COUNT=$((RETRY_COUNT+1))
done

if [ $RETRY_COUNT -eq $MAX_RETRIES ]; then
  echo "Não foi possível conectar ao banco de dados após várias tentativas."
  exit 1
fi

echo "Banco de dados conectado com sucesso!"

# Executar as migrações e iniciar o servidor
rails db:migrate RAILS_ENV=production
rails server -b 0.0.0.0
