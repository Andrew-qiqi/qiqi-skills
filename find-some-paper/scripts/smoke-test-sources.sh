#!/usr/bin/env bash
set -u

pass=0
warn=0
fail=0

ok() {
  printf 'PASS %s\n' "$1"
  pass=$((pass + 1))
}

note() {
  printf 'WARN %s\n' "$1"
  warn=$((warn + 1))
}

bad() {
  printf 'FAIL %s\n' "$1"
  fail=$((fail + 1))
}

have() {
  command -v "$1" >/dev/null 2>&1
}

check_env() {
  name="$1"
  if [ -n "${!name:-}" ]; then
    ok "$name configured"
  else
    note "$name not configured"
  fi
}

if have curl; then
  ok "curl available"
else
  bad "curl missing"
fi

if have python3; then
  ok "python3 available"
else
  note "python3 missing"
fi

if have curl; then
  if curl -fsS --max-time 10 "https://api.openalex.org/works?search=machine%20learning&per-page=1" >/dev/null; then
    ok "OpenAlex reachable"
  else
    note "OpenAlex unreachable"
  fi

  if curl -fsS --max-time 10 "https://api.crossref.org/works?query.title=machine%20learning&rows=1" >/dev/null; then
    ok "Crossref reachable"
  else
    note "Crossref unreachable"
  fi

  if curl -fsS --max-time 10 "https://export.arxiv.org/api/query?search_query=all:machine%20learning&start=0&max_results=1" >/dev/null; then
    ok "arXiv reachable"
  else
    note "arXiv unreachable"
  fi

  if curl -fsS --max-time 10 "https://api.semanticscholar.org/graph/v1/paper/search?query=machine%20learning&limit=1&fields=title,year" >/dev/null; then
    ok "Semantic Scholar anonymous reachable"
  else
    note "Semantic Scholar anonymous unreachable or rate-limited"
  fi

  if curl -fsS --max-time 10 "https://pubmed.ncbi.nlm.nih.gov/" >/dev/null; then
    ok "PubMed web reachable"
  else
    note "PubMed web unreachable"
  fi
fi

check_env "EXA_API_KEY"
check_env "SERPAPI_API_KEY"
check_env "SERPER_API_KEY"
check_env "S2_API_KEY"
check_env "SEMANTIC_SCHOLAR_API_KEY"
check_env "NCBI_EMAIL"
check_env "NCBI_API_KEY"
check_env "UNPAYWALL_EMAIL"
check_env "CORE_API_KEY"

printf 'Summary: pass=%s warn=%s fail=%s\n' "$pass" "$warn" "$fail"

if [ "$fail" -gt 0 ]; then
  exit 1
fi

exit 0
