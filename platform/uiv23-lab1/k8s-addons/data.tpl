# K8S Metrics server
KUBE_STATE_METRICS_ENABLED: True

# K8S Dashboard
K8S_DASHBOARD_NAMESPACE: kube-system

# CBUR
CBUR_BACKEND_TYPE: "AWSS3"


# CertIssuer
CA_ISSUER_ENABLED: true
{{ if fileExists "./TLS-key.pem" }}
ADDONS_DEFAULT_ISSUER_TLS_KEY: {{ "./TLS-key.pem" | b64file }}
{{ end }}
{{ if fileExists "./TLS-cert.pem" }}
ADDONS_DEFAULT_ISSUER_TLS_CRT: {{ "./TLS-cert.pem" | b64file }}
{{ end }}
