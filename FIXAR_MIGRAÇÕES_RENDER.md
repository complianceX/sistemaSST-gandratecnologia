# Fixar Migrações no Render — Guia Rápido

## Problema
- ❌ Tabela `rdo_audit_events` não existe
- ❌ `user_sessions.company_id` é NULL (violação de constraint)
- **Causa:** Migrações não estão rodando no deploy

## Solução Implementada
✅ Adicionado serviço cron `sgs-migrations` no `render.yaml`
- Roda `npm run migration:run` a cada 10 minutos
- Executa todas as migrações pendentes automaticamente
- Não bloqueia o startup do web service

## Próximos Passos

### 1. Trigger Manual no Render (Imediato)
Se seu Docker está ligado e você quer forçar agora:
```bash
# SSH no Render ou via dashboard:
# Services → sgs-migrations → "Run" botão

# OU via API Render:
curl -X POST https://api.render.com/v1/services/{service-id}/deploys \
  -H "Authorization: Bearer YOUR_RENDER_API_KEY"
```

### 2. Verificar Status das Migrações
```bash
# No seu Docker/local:
npm run migration:run

# Deve outputar:
# QueryRunnerAlreadyReleasedError ou
# ✓ Migration 1709000000105 executed
```

### 3. Validar no Banco
```sql
-- Supabase SQL editor:
SELECT name FROM migrations WHERE name LIKE '%1709000000105%';
SELECT COUNT(*) FROM rdo_audit_events;
SELECT COUNT(*) FROM user_sessions WHERE company_id IS NULL;
```

## O que foi deployado:
- `c1ef90d` — render.yaml com novo serviço cron

## Impacto
- ✅ Aplicação continuará rodando (REQUIRE_NO_PENDING_MIGRATIONS=false)
- ✅ Migrações executarão automaticamente a cada 10 min
- ✅ Nenhum downtime
- ✅ RDOs e sessions voltam a funcionar assim que migrações passam
