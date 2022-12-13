ADMINACCOUNT: "superadmin"

ONPREM_INSTALL: true
NOKIALDAP_ENABLED: false


# On premise installation (only used when ONPREM_INSTALL=true)
LOCAL_INSTALLER_ENABLED: true
#LOCAL_INSTALLER_PASSWORD: "defined_later"
LOCAL_INSTALLER_EMAIL: "superadmin@nokia.com"

TESTLDAP_ENABLED: false

### BEGIN EKS PARAMETERS ###
EKS_INSTALL: true
NODES_CIDRS: ['10.15.1.0/24', '10.15.3.0/24', '10.15.5.0/24']
K8S_API_SERVER_ENDPOINT: "csfpops will automatically discover and inject through common_data.tpl"
ES_FLUENTD_DOCKER_CONTAINERS_PATH: "/var/lib/docker/"
CSKM:
  DISABLE_SA_ISS_VALIDATION: true
  DISABLE_LOCAL_CA_JWT: true

INJECTLOCALTIME: false
HELM3_ONLY: true
EKS_DASHBOARD_NAMESPACE: &k8s_dash "kube-system"
KUBE_DASHBOARD_NAMESPACE: *k8s_dash


HARBOR_PVC_SIZE: 400Gi
HARBOR: false
MULTITENANCY_WEBHOOK_ENABLED: false

### END EKS PARAMETERS ###

KUBE_STATE_METRICS_ENABLED: True
NODE_EXPORTER_ENABLED: True

AP_PROJECT_NAME: "afcore-project"

# DEFAULT_INGRESS_ISSUER_TLS_KEY and DEFAULT_INGRESS_ISSUER_TLS_CRT is used to generate certs for tenant's services
DEFAULT_INGRESS_ISSUER_TLS_KEY: {{ "./TLS-key.pem" | b64file }}
DEFAULT_INGRESS_ISSUER_TLS_CRT: {{ "./TLS-cert.pem" | b64file }}

{{ $trusted_ca_files := list "additional-trusted-ca.pem" "LB-ca.pem"}}
ADDITIONAL_TRUSTED_CERTIFICATES:
{{- range $trusted_ca_file := $trusted_ca_files }}
  {{- if fileExists $trusted_ca_file }}
  {{ $trusted_ca_file }}: {{ $trusted_ca_file | b64file }}
  {{- end }}
{{- end }}

CKEY_USER_MANAGEMENT_LITE_ENABLED: true

# CBUR
CBUR_BACKEND_TYPE: "LOCAL"
CEPHS3_BUCKET_PREFIX: ""
CEPHS3_ACCESS_KEY: ""
CEPHS3_ENDPOINT: ""
CEPHS3_SECRET_KEY: ""
CEPHS3_UID: ""

INSTALL_SPARK_OPERATOR_CRDS: true

# Force Upgrade when coming from N-2 version
LCM_UPGRADE_FLAG: "--timeout 3600"

# -=-=-=-=-=-=-
#  Post deploy
# -=-=-=-=-=-=-
#
ANSIBLE_VARS:
  K8S_CRD_INSTALL: true
  DASHBOARD_NAMESPACE: *k8s_dash
#
# -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

# -=-=-=-=-=-=-=-
#  Custom config
# -=-=-=-=-=-=-=-
#
{{ $cnot_config_file := "./cnot_configmap_values.config" }}
{{- if fileExists $cnot_config_file }}
CUSTOM_CNOT_CONFIGURATION: {{ $cnot_config_file | getfile | toYaml }}
{{- end }}
{{ $calm_config_file := "./calm_configmap_values.config" }}
{{- if fileExists $calm_config_file }}
CUSTOM_CALM_CONFIGURATION: {{ $calm_config_file | getfile | toYaml }}
{{- end }}
#
# -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-


RESOURCE_REQUEST_URL: ""

PSP_ENABLED: false

