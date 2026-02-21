#!/usr/bin/env bash
# Truelist API — example curl commands
# Replace YOUR_API_KEY with your real API key.

set -euo pipefail

API_KEY="${TRUELIST_API_KEY:-YOUR_API_KEY}"
BASE_URL="https://api.truelist.io"

# ---------------------------------------------------------------------------
# 1. Inline email validation (single email, synchronous)
#    Email is passed as a query parameter. No request body.
# ---------------------------------------------------------------------------
echo "=== POST /api/v1/verify_inline ==="
curl -s -X POST "${BASE_URL}/api/v1/verify_inline?email=user@example.com" \
  -H "Authorization: Bearer ${API_KEY}" | python3 -m json.tool
echo

# ---------------------------------------------------------------------------
# 2. Batch email verification (list upload, async)
#    Accepts a JSON array of emails for background processing.
# ---------------------------------------------------------------------------
echo "=== POST /api/v1/verify ==="
curl -s -X POST "${BASE_URL}/api/v1/verify" \
  -H "Authorization: Bearer ${API_KEY}" \
  -H "Content-Type: application/json" \
  -d '{"emails": ["user1@example.com", "user2@example.com"]}' | python3 -m json.tool
echo

# ---------------------------------------------------------------------------
# 3. Account information
# ---------------------------------------------------------------------------
echo "=== GET /me ==="
curl -s -X GET "${BASE_URL}/me" \
  -H "Authorization: Bearer ${API_KEY}" | python3 -m json.tool
echo
