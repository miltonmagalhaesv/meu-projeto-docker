# Meu projeto: site Apache em container Debian

Projeto didático baseado no material de apoio `Docker.pdf`. O container parte da imagem `debian:trixie-slim`, instala Apache, desempacota `meu_site.tar` em `/var/www/html` e serve a página na porta 80.

## Estrutura

```text
meu_projeto/
├── Dockerfile
├── meu_site.tar
├── README.md
├── evidencias/
│   ├── verificacao.txt
│   └── Dockerfile.txt
└── site/
    └── index.html
```

## Construir e executar

Na pasta `meu_projeto`:

```bash
docker build -t meu-site:1.0 .
docker run -d --name meu-site -p 8080:80 meu-site:1.0
```

Acesse <http://localhost:8080>. Para conferir o container e os logs:

```bash
docker ps
docker logs meu-site
```

Para parar e remover:

```bash
docker rm -f meu-site
```

## Recriar o TAR

O material menciona `tar -czt`, que gera um TAR comprimido com gzip. Para produzir o arquivo solicitado com extensão `.tar` (TAR sem compressão), a partir da raiz do projeto:

```bash
tar -cf meu_site.tar -C site .
```

Se preferir gzip, use `tar -czf meu_site.tar.gz -C site .` e atualize o `COPY` no Dockerfile para o novo nome.

## Repositório

Este diretório é um repositório Git local. Para publicar no GitHub, crie um repositório vazio na sua conta e configure o remoto:

```bash
git remote add origin https://github.com/SEU_USUARIO/meu-projeto-docker.git
git push -u origin main
```

## Evidência e limitação do ambiente

`evidencias/verificacao.txt` registra o que foi realmente verificado neste ambiente. Docker não está instalado aqui; por isso, a imagem/container não puderam ser construídos/executados nem foi possível produzir uma captura real de `docker ps`. Execute os comandos acima em uma máquina com Docker Engine para gerar a evidência final do container.
