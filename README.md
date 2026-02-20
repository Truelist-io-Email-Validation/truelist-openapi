# Truelist OpenAPI Specification

The single source of truth for the [Truelist](https://truelist.io) email validation API.

This repository contains the OpenAPI 3.1 specification that describes every endpoint, schema, and error response. Use it to generate client SDKs, render interactive documentation, or validate API changes in CI.

## Quick Links

| Resource | URL |
|----------|-----|
| API Docs | [truelist.io/docs/api](https://truelist.io/docs/api) |
| Interactive Docs | [Swagger UI](#view-the-docs-locally) |
| Base URL | `https://api.truelist.io` |

## Endpoints

| Method | Path | Description |
|--------|------|-------------|
| `POST` | `/api/v1/form_verify` | Form-level email validation (frontend) |
| `POST` | `/api/v1/verify` | Server-side email validation (backend) |
| `GET`  | `/api/v1/account` | Account info and credit balance |

## View the Docs Locally

Render the spec with [Redocly](https://redocly.com/redocly-cli) or [Swagger UI](https://swagger.io/tools/swagger-ui/).

**Redocly (recommended):**

```bash
npx @redocly/cli preview-docs openapi.yaml
```

**Swagger UI via Docker:**

```bash
docker run -p 8080:8080 \
  -e SWAGGER_JSON=/spec/openapi.yaml \
  -v "$(pwd):/spec" \
  swaggerapi/swagger-ui
```

Then open [http://localhost:8080](http://localhost:8080).

## Validate the Spec

```bash
# With Redocly CLI
npx @redocly/cli lint openapi.yaml

# With Spectral
npx @stoplight/spectral-cli lint openapi.yaml
```

Both linters are run automatically in CI on every push (see `.github/workflows/validate.yml`).

## Generate Client SDKs

Use [OpenAPI Generator](https://openapi-generator.tech) to produce typed clients in any language:

```bash
# TypeScript (fetch)
npx @openapitools/openapi-generator-cli generate \
  -i openapi.yaml \
  -g typescript-fetch \
  -o clients/typescript

# Python
npx @openapitools/openapi-generator-cli generate \
  -i openapi.yaml \
  -g python \
  -o clients/python

# Ruby
npx @openapitools/openapi-generator-cli generate \
  -i openapi.yaml \
  -g ruby \
  -o clients/ruby
```

See the full list of generators at [openapi-generator.tech/docs/generators](https://openapi-generator.tech/docs/generators).

## Examples

The `examples/` directory contains ready-to-use samples:

- **`curl.sh`** — curl commands for every endpoint
- **`postman.json`** — Postman collection you can import directly

## File Structure

```
truelist-openapi/
├── openapi.yaml          # OpenAPI 3.1 spec (source of truth)
├── openapi.json          # JSON version of the spec
├── README.md
├── LICENSE
├── .gitignore
├── examples/
│   ├── curl.sh
│   └── postman.json
└── .github/
    └── workflows/
        └── validate.yml  # CI: lint the spec on every push
```

## License

This specification is released under the [MIT License](LICENSE).
