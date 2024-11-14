#!/bin/bash
export RAILS_MASTER_KEY=seu_master_key_aqui

# Espera até que o banco de dados esteja pronto
until (echo > /dev/tcp/db/5432) >/dev/null 2>&1
do
  echo "Aguardando o banco de dados..."
  sleep 1
done

# Executa as migrações pendentes
rails db:migrate RAILS_ENV=development

# Inicializa o servidor Rails
rails server -b 0.0.0.0


### Ver se comentando esse codigo ele para de dar erro
# Ver se troc por isso 
#!/bin/bash
# set -e

#remove potentially pe-ex server.pid for rails
# rm -f /myapp/tmp/pids/server.pid

# then exec
#exec "$@"