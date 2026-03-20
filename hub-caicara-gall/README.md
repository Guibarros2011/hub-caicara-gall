# Hub Caicara Gall — Parceria Gall × New Energy

Site privado de apresentação e negociação da parceria.

---

## 🚀 Deploy automático

**Cada push na `main` publica automaticamente no Cloudflare Pages em ~30 segundos.**

### Configuração única (apenas uma vez)

**1. Cloudflare — criar token:**
- dash.cloudflare.com → My Profile → API Tokens → Create Token
- Permissão: `Cloudflare Pages — Edit`
- Copie o **API Token** e o **Account ID** (sidebar direita do dashboard)

**2. GitHub — adicionar secrets:**

Settings → Secrets and variables → Actions → New repository secret:

| Nome | Valor |
|------|-------|
| `CLOUDFLARE_API_TOKEN` | token do passo 1 |
| `CLOUDFLARE_ACCOUNT_ID` | account ID do passo 1 |

**3. Cloudflare Pages — criar projeto (apenas na primeira vez):**
- Pages → Create a project → Connect to Git → `hub-caicara-gall`
- Build output: `public` | Build command: *(vazio)*
- Clique Deploy

Pronto. A partir daí, o agente cuida de tudo automaticamente.

---

## Como atualizar após edições

```bash
# Opção 1 — script automático (recomendado)
./push.sh "descreva o que mudou"

# Opção 2 — git manual
git add .
git commit -m "sua mensagem"
git push origin main
```

O GitHub Actions detecta o push, chama a API do Cloudflare e publica.
Você recebe e-mail de confirmação (configurável em GitHub → Settings → Notifications).

---

## Estrutura

```
public/
  index.html                        ← site completo (dark theme + logo)
  logo.jpg                          ← identidade visual Hub Caicara Gall
  Contrato_Gall_NewEnergy_v5.docx   ← contrato para download

.github/workflows/deploy.yml        ← agente de deploy automático
push.sh                             ← script de push com uma linha
wrangler.toml                       ← configuração Cloudflare Pages
README.md                           ← este arquivo
```

---

## Fluxo completo de uso

```
1. Edite qualquer arquivo em public/
2. Execute: ./push.sh "o que mudou"
3. GitHub Actions dispara o deploy (~30s)
4. Site atualizado em hub-caicara-gall.pages.dev
5. Compartilhe o link com sócios da Gall e New Energy
6. Partes preenchem avaliações na seção "Avaliações"
7. Fotos reais do local são adicionadas pelo site
8. Contrato revisado por advogado → assinatura digital
```
