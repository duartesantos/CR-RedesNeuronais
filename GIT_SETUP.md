# Guia de Configuração do Git

## ✅ Repositório Local Inicializado

O repositório Git local já foi inicializado e o commit inicial foi feito com sucesso!

## 🔗 Conectar a um Repositório Remoto

Para conectar o seu repositório local a um repositório remoto (GitHub, GitLab, etc.), siga estes passos:

### 1. Criar um Repositório Remoto

1. Aceda ao GitHub/GitLab/Bitbucket
2. Crie um novo repositório (não inicialize com README, .gitignore ou licença)
3. Copie a URL do repositório (ex: `https://github.com/seu-usuario/TPCR2425.git`)

### 2. Adicionar o Remote

Execute no terminal (no diretório do projeto):

```bash
git remote add origin https://github.com/seu-usuario/TPCR2425.git
```

Substitua `https://github.com/seu-usuario/TPCR2425.git` pela URL do seu repositório.

### 3. Verificar o Remote

```bash
git remote -v
```

### 4. Fazer Push do Código

```bash
git branch -M main
git push -u origin main
```

**Nota**: Se o seu repositório remoto usar `master` em vez de `main`, use:
```bash
git push -u origin master
```

## 📝 Comandos Git Úteis

### Verificar Status
```bash
git status
```

### Adicionar Ficheiros
```bash
git add .                    # Adiciona todos os ficheiros
git add ficheiro.m           # Adiciona um ficheiro específico
```

### Fazer Commit
```bash
git commit -m "Descrição das alterações"
```

### Fazer Push
```bash
git push                     # Envia commits para o remoto
git push origin main         # Especifica o branch
```

### Fazer Pull
```bash
git pull                     # Atualiza do remoto
```

### Ver Histórico
```bash
git log                      # Ver commits
git log --oneline            # Ver commits em formato compacto
```

## 🔄 Workflow Básico

1. **Fazer alterações** nos ficheiros
2. **Verificar** o que mudou: `git status`
3. **Adicionar** ficheiros: `git add .`
4. **Fazer commit**: `git commit -m "Descrição"`
5. **Fazer push**: `git push`

## ⚠️ Notas Importantes

- Os ficheiros `.mat` (modelos de rede) foram incluídos no commit. Se forem muito grandes, considere usar Git LFS (Large File Storage)
- Os ficheiros `.docx` e `.pdf` também foram incluídos. Se preferir não versioná-los, adicione ao `.gitignore`
- Os caminhos nos ficheiros `convertImage_*.m` foram corrigidos para serem relativos, funcionando em qualquer máquina

## 🚀 Próximos Passos

1. Conecte o repositório local a um remoto (GitHub/GitLab)
2. Faça push do código
3. Partilhe o repositório com colegas/professores se necessário

