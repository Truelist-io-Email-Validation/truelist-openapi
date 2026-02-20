#!/usr/bin/env bash
# Truelist API — example curl commands
# Replace YOUR_API_KEY and YOUR_FORM_API_KEY with real keys.

set -euo pipefail

API_KEY="${TRUELIST_API_KEY:-YOUR_API_KEY}"
FORM_API_KEY="${TRUELIST_FORM_API_KEY:-YOUR_FORM_API_KEY}"
BASE_URL="https://api.truelist.io"

# ---------------------------------------------------------------------------
# 1. Form-level email validation (frontend use)
#    Auth: Form API Key
#    Rate limit: 60 req/min per form key
# ---------------------------------------------------------------------------
echo "=== POST /api/v1/form_verify ==="
curl -s -X POST "${BASE_URL}/api/v1/form_verify" \
  -H "Authorization: Bearer ${FORM_API_KEY}" \
  -H "Content-Type: application/json" \
  -d '{"email": "user@example.com"}' | python3 -m json.tool
echo

# ---------------------------------------------------------------------------
# 2. Server-side email validation (backend use)
#    Auth: API Key
#    Rate limit: 10 req/s
# ---------------------------------------------------------------------------
echo "=== POST /api/v1/verify ==="
curl -s -X POST "${BASE_URL}/api/v1/verify" \
  -H "Authorization: Bearer ${API_KEY}" \
  -H "Content-Type: application/json" \
  -d '{"email": "user@example.com"}' | python3 -m json.tool
echo

# ---------------------------------------------------------------------------
# 3. Account information
#    Auth: API Key
# ---------------------------------------------------------------------------
echo "=== GET /api/v1/account ==="
curl -s -X GET "${BASE_URL}/api/v1/account" \
  -H "Authorization: Bearer ${API_KEY}" | python3 -m json.tool
echo
