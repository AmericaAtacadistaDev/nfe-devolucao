# Sistema de Devolução NF-e v2.0 — Lazarus/FPC

[![Build EXE](https://github.com/SEU_USUARIO/SEU_REPOSITORIO/actions/workflows/build.yml/badge.svg)](https://github.com/SEU_USUARIO/SEU_REPOSITORIO/actions/workflows/build.yml)

Sistema completo para registro e acompanhamento de notas fiscais de devolução (NF-e 4.0), com suporte à Reforma Tributária 2026 (CBS/IBS).

## Como obter o .exe (sem instalar nada)

### Passo 1 — Criar o repositório no GitHub

1. Acesse **https://github.com** e faça login (ou crie uma conta gratuita)
2. Clique em **New repository** (botão verde no canto superior direito)
3. Dê um nome: `nfe-devolucao`
4. Marque **Public** (necessário para Actions gratuito)
5. Clique em **Create repository**

### Passo 2 — Fazer upload dos arquivos

#### Opção A — Pelo site do GitHub (mais simples)
1. Na página do repositório, clique em **uploading an existing file**
2. Arraste todos os arquivos e pastas deste projeto
3. Clique em **Commit changes**

#### Opção B — Pelo Git (linha de comando)
```bash
git init
git add .
git commit -m "Sistema NF-e v2.0"
git branch -M main
git remote add origin https://github.com/SEU_USUARIO/nfe-devolucao.git
git push -u origin main
```

### Passo 3 — Acompanhar a compilação

1. No GitHub, clique na aba **Actions**
2. Você verá o workflow **Build NFe Devolucao EXE** rodando
3. Aguarde ~3-5 minutos até o status ficar verde ✅

### Passo 4 — Baixar o .exe

**Opção A — Via Artifacts (disponível por 30 dias):**
1. Clique no workflow concluído
2. Role até a seção **Artifacts**
3. Clique em **NFeDevolucao-Windows-EXE** para baixar o `.zip` com o `.exe`

**Opção B — Via Release (permanente):**
1. Clique em **Releases** na barra lateral direita do repositório
2. Baixe `NFeDevolucao.exe` da release mais recente

### Passo 5 — Executar

1. Extraia o `.exe` do `.zip` baixado
2. Baixe o `sqlite3.dll` em: https://www.sqlite.org/download.html
   - Seção: *Precompiled Binaries for Windows*
   - Arquivo: `sqlite-dll-win32-x86-*.zip`
3. Coloque `NFeDevolucao.exe` e `sqlite3.dll` na **mesma pasta**
4. Execute `NFeDevolucao.exe`
5. Na primeira execução, será solicitado criar o usuário administrador

---

## Estrutura do projeto

```
NFeDevolucao/
├── NFeDevolucao.lpr          # Projeto principal (Lazarus)
├── README.md
├── .github/
│   └── workflows/
│       └── build.yml         # GitHub Actions — compila o .exe
└── src/
    ├── uConstantes.pas       # Constantes, cores, tipos
    ├── uSeguranca.pas        # SHA-256 + salt (FPC nativo)
    ├── uBancoDados.pas       # SQLite3 (FPC nativo)
    ├── uXmlNFe.pas           # Parser XML NF-e 4.0
    ├── uJson.pas             # JSON (fpjson nativo do FPC)
    ├── frmLogin.pas          # Login, Primeiro Acesso, Alterar Senha
    └── frmMain.pas           # Janela principal (3 abas)
```

## Funcionalidades

- **Importar XML NF-e** — lê arquivos XML NF-e 4.0 automaticamente
- **Formulário completo** — 11 seções com todos os campos da NF-e
- **Reforma Tributária** — campos CBS, IBS e IS já incluídos
- **Calculadora fiscal** — calcula ICMS, IPI, PIS, COFINS, CBS, IBS
- **Registro e acompanhamento** — lista todas as devoluções com busca
- **Exportar JSON** — salva dados da NF-e em formato JSON
- **Sistema de usuários** — login com SHA-256 + salt, perfis admin/operador
- **Logout seguro** — botão no header, rodapé e atalho Ctrl+Q

## Dependências

| Componente | Tipo | Uso |
|---|---|---|
| Free Pascal (FPC) | Nativo | Compilador |
| LCL | Nativo | Interface gráfica |
| SQLite3 | DLL externa | Banco de dados |
| fpjson | Nativo FPC | JSON |
| SHA2 | Nativo FPC | Hash de senhas |
| DOM/XMLRead | Nativo FPC | Parser XML |

**Nenhum componente de terceiros necessário** — tudo usa unidades nativas do FPC/Lazarus.

## Requisitos do sistema

- Windows 7 ou superior (32-bit ou 64-bit)
- sqlite3.dll na mesma pasta do executável
- ~2MB de espaço em disco

---

*Sistema convertido de Python/Tkinter para Lazarus/FPC*
