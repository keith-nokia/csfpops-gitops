# File Creation Date 18-10-2022 07:29:17

# This generated file is for UIV22 FP2206 release
# Give a space after : when adding values. Example PRODUCT_NAME:abc is wrong, PRODUCT_NAME: abc is correct

################  SECTION 1 - VALUES NOT DERIVED FROM BOM 
################  SECTION 1 - FILL FOR EMPTY PARAMETERS. CAN BE REVIEWED AND CHANGED IF REQUIRED FOR FILLED VALUES. 

# Environment / Platform where UIV is to be installed
# Note: Supported Values - CSFP, OCP ; DEFAULT value: CSFP.
UIV_ENV: CSFP

PRODUCT_NAME: "Digital Operations Center"

# CSFP / OCP Project where UIV is to be installed
PROJECT: nbn-project

# Kubernetes namespace where UIV is to be installed
# Note: PROJECT & NAMESPACE will be same for OCP deployments
NAMESPACE: nbn-uiv

# Note: DEFAULT value for CPRO_NAMESPACE in CSFP is paas.
# Note: CHANGE CPRO_NAMESPACE for OCP deployments accordingly.
CPRO_NAMESPACE: paas

################  START OF OCP SPECIFIC PARAMS. 
# Note: CHANGE VALUES IF REQUIRED
# OCP Lab Name.
LAB_NAME: 
# OCP Domain Name.
DOMAIN_NAME: 
# Kubernetes namespace for Common Services Deployment
# Note: DEFAULT value for COMMON_SVC_NAMESPACE in OCP is doc-common-svc
COMMON_SVC_NAMESPACE: doc-common-svc
# base64 encoded values to be set for Web SSO master realm user. CHANGE VALUES WHEN CREATE_REALM: true
KEYCLOAK_MASTER_REALM_USR: CHANGE_THIS
# base64 encoded values to be set for Web SSO master realm user password. CHANGE VALUES WHEN CREATE_REALM: true
KEYCLOAK_MASTER_REALM_PWD: CHANGE_THIS
################  END OF OCP SPECIFIC PARAMS.

# Docker registry to pull or push images.
# In CSFP, specify the value as "HARBOR"
# In OCP, specify docker registry path.
DOCKER_REGISTRY: HARBOR

# Kong 5.x configuration
# This parameter should be false if UIV is deployed on CSFP FP3. Default is true.
KONG5_ENABLED: true

# Kong URL of the cluster
# Set it as - https://<FQDN>/apigw (donot put / at the end)
# In OCP, <FQDN> can be obtained from 'ckng-route' using 'oc get routes -n <common_svc_namespace>' command
KONG_URL: https://nokia-lab.csfp.dev.software.nokia.com/apigw

# Keycloak URL of the cluster
# Set it as - https://<FQDN>/auth (donot put / at the end)
# In OCP, <FQDN> can be obtained from 'ckey-route' using 'oc get routes -n <common_svc_namespace>' command
KEYCLOAK_URL: https://nokia-lab.csfp.dev.software.nokia.com/auth

# Set all UIV pods Timezone. CHANGE IF REQUIRED
UIV_TIMEZONE: Asia/Kolkata

# Set to true if KEYCLOAK_REALM is to be created by UIV installation
# When CREATE_REALM: true, realm with given name, admin user and password will be created. CHANGE VALUES IF REQUIRED
# When CREATE_REALM: false, name of an existing realm, realm admin username and realm admin password must be provided. CHANGE VALUES IF REQUIRED
CREATE_REALM: true
KEYCLOAK_REALM: ap-core
# base64 encoded values to be set for keycloak admin user. CHANGE VALUES IF REQUIRED
KEYCLOAK_ADMIN_USR: dWl2dXNlcjE=
# Keycloak Admin Secret
# Set it as - <NAMESPACE>-keycloak-config-csf-ckey-realm WHEN CREATE_REALM: true
# Set it to REALM CREDENTIALS secret name WHEN CREATE_REALM: false
KEYCLOAK_ADMIN_SECRET: nbn-uiv-keycloak-config-csf-ckey-realm
# Keycloak admin secret user key. CHANGE VALUES WHEN CREATE_REALM: false
# NOTE: DO NOT MODIFY THIS PARAMETER WHEN CREATE_REALM: true
KEYCLOAK_ADMIN_USR_KEY: 'user'
# Keycloak admin secret password key. CHANGE VALUES WHEN CREATE_REALM: false
# NOTE: DO NOT MODIFY THIS PARAMETER WHEN CREATE_REALM: true
KEYCLOAK_ADMIN_PWD_KEY: 'password'

# Set to true if KEYCLOAK_REALM is to be deleted by UIV un-installation
# NOTE: APPLICABLE ONLY FOR UIV UN-INSTALLATION IN OCP ENVIRONMENT
DELETE_REALM: false

# NEO4J PASSWORD: to be given in base64 encoded format. DEFAULT CREDENTIALS. CAN BE CHANGED IF REQUIRED
NEO4J_PASSWORD: 

# CMDB/MARIADB ROOT USER PASSWORD: to be given in base64 encoded format. DEFAULT CREDENTIALS. CAN BE CHANGED IF REQUIRED
MARIADB_PASSWORD: 

# MINIO USERNAME AND PASSWORD: to be given in base64 encoded format. DEFAULT CREDENTIALS. CAN BE CHANGED IF REQUIRED
MINIO_ACCESS_KEY: 
MINIO_SECRET_KEY: 

# IGNITE SERVER USERNAME AND PASSWORD:  to be given in base64 encoded format. DEFAULT CREDENTIALS. CAN BE CHANGED IF REQUIRED
IGNITE_SERVER_USERNAME: 
IGNITE_SERVER_PASSWORD: 

# ENABLE/DISABLE API DOCUMENTATION FOR UIV. CAN BE CHANGED IF REQUIRED. BOOLEAN VALUES true/false
SWAGGER_ENABLED: true

# UIV Backup-restore parameters. By default, Disabled in NON-HA MODE, enabled in HA MODE. CAN BE CHANGED IF REQUIRED
BACKUP_ENABLED: false

# Below three parameters are considered only when backup is enabled - BACKUP_ENABLED: true
# BACKUP_TYPE CAN BE local, AWS, Netbackup etc. Please check CBUR guide for supported backup providers
BACKUP_TYPE: local
# Run at 12 am everyday. CAN BE CHANGED IF REQUIRED
BACKUP_SCHEDULE: "0 0 * * *"
# No of previous backup copies to keep. CAN BE CHANGED IF REQUIRED
BACKUP_COPIES_MAX: 3


###### KAFKA EXTERNAL ACCESS CONFIG
# To expose kafka broker service outside CSFP cluster, update the below section
# set KAFKA_EXTERNAL_ACCESS value to 'true' to enable
# Please make sure 3 consecuitive ports  from the START_PORT_RANGE_ON_EDGE_NODE are available for use in all Edge Nodes
# Pre-requisite for this feature, user is expected to install the citm ingress controller.
# And provide the configmap prefix name which the citm controller monitor
# For eg: if the configmap naming convention is 'citmrelease-citm-ingress-tcp'
# in CITM_RELEASE_NAME 'citmrelease-citm-ingress' needs to be provided
# KEYCLOAK_INSTALLED_NAMESPACE should be the name of namespace where the Keycloak is installed. For eg: 'paas'
KAFKA_EXTERNAL_ACCESS: true
CITM_RELEASE_NAME: citm-compaas
KEYCLOAK_INSTALLED_NAMESPACE: paas
START_PORT_RANGE_ON_EDGE_NODE: 11800


###### KAFKA LOG RETENTION CONFIGS
LogRetentionHours: "168"
LogRetentionBytes: "1024000"
LogRetentionCheckIntervalMs: "300000"

##### RDA CONFIGS. CAN BE UPDATED BASED ON REQUIREMENT #####
RdaReconActionProcessorThread: 5
RDA_AUDIT_ENABLED: true

##### CRPT (JASPERSOFT REPORTING ENGINE) CONFIGS. CAN BE UPDATED BASED ON REQUIREMENT #####
# Ingress certificate secret created in the CSFP environment. By default a secret with this name 'ingress-tls-certificate' is available in UIV namespace in CSFP.
INGRESS_CERTIFICATE_NAME: ingress-tls-certificate

# Keycloak Certificate file name to create below KEYCLOAK_CERTIFICATE_SECRET_NAME. 
# By default a secret with this name 'ingress-tls-certificate' has the certificate file name as 'ca.crt' in UIV namespace in CSFP.
KEYCLOAK_CERTIFICATE_FILE_NAME: ca.crt

# Keycloak Certificate Secret name used for CRPT Tomcat to connect keycloak.
# By default 'ingress-tls-certificate' secret has the secret for conecting to keycloak in UIV namespace in CSFP.So same secret 'ingress-tls-certificate' can be used for below.
KEYCLOAK_CERTIFICATE_SECRET_NAME: ingress-tls-certificate

# If re-using a datastore from a previous install then you need the keystore from that install.
# Do not chnage this values unless we are upgrading from  previous deployment.
JRS_KEYS_FOR_UPGRADE: false

##### IHUB CONFIGS. CAN BE UPDATED BASED ON REQUIREMENT #####
IHUB_UIV_CACHE_EXP_TIME: 1800000
REFRESH_INTERVAL: 60000

##### NEO4J CONFIGS. CAN BE UPDATED BASED ON REQUIREMENT #####
NEO4J_CONNECTION_POOL_SIZE: 200
NEO4J_dbms_checkpoint_interval_time: 300s
NEO4J_dbms_checkpoint_interval_tx: "50000"
NEO4J_dbms_checkpoint_iops_limit: "900"

##### NEO4J MAIN DATA DISK PARAMETER #####
##### VALUE SHOULD BE NAME OF STORAGE CLASS. #####
###### NOTE: CAN BE CHECKED FROM CSFP GUI -> MONITORING -> STORAGE CLASSES ######
##### IF PARAM IS COMMENTED, USES DEFAULT STORAGE CLASS NAME. #####
##### IMPORTANT: STORAGE CLASS SHOULD BE OF TYPE READWRITEONCE #####
NEO4J_DATA_DISK_STORAGE_CLASS: aws-ebs

##### Below parameter to be filled only if backup enabled - CBUR_ENABLED: true #####
##### NEO4J BACKUP DISK PARAMETERS #####
##### VALUE SHOULD BE NAME OF STORAGE CLASS.  #####
###### NOTE: CAN BE CHECKED FROM CSFP GUI -> MONITORING -> STORAGE CLASSES ######
##### IF PARAM IS COMMENTED, USES DEFAULT STORAGE CLASS NAME. #####
##### IMPORTANT: STORAGE CLASS FOR BACKUP SHOULD BE OF TYPE READWRITEONCE #####
NEO4J_BACKUP_DISK_STORAGE_CLASS: 
NEO4J_BACKUP_DISK_STORAGE_CLASS_TYPE: ReadWriteOnce
##### MARIADB BACKUP DISK PARAMETERS #####
MARIADB_BACKUP_DISK_SIZE: 50Gi 
MARIADB_PRESERVE_PVC: true

##### ENABLE DR POLICY (requirement of NAC team) #####
#Note: if this is set to true, UIV needs to be installed with superadmin user
# DRPolicy is a custom resource definition to configure disaster and recovery operations. Currently used for Replica synchronization.
# Enable only if drpolicy custom resource eveloped by NAC team is supported. otherwise keep false
DRPOLICY_ENABLED: false

IGNITE_PERSISTENCE_ENABLED: true


################  SECTION 2 - VALUES DERIVED FROM BOM
################  SECTION 2 - NOT REQUIRED TO BE CHANGED

# UIV to be installed in HA (production) or standalone mode (non production)
UIV_HA_ENABLED: false

# Enable/Disable D & R components
RDA_ENABLED: true

# Enable/Disable UIV Number Management solution
UIV_NUM_MANAGEMENT_ENABLED: true

IGNITE_ENABLED: true

MARIADB_ENABLED: true

# Enable/Disable UIV CRPT (JASPERSOFT REPORTING ENGINE)
CRPT_ENABLED: false

ONBOARDING_MANAGER_ENABLED: true

KAFKA_ENABLED: true

# Enable/Disable IHUB UI
IHUB_ENABLED: true

# Enable/Disable Geo Map view
CMAP_ENABLED: false

UIV_DM_REST_POD_CPU_CORES_REQ: 1
UIV_DM_REST_POD_CPU_CORES_LIM: 1
UIV_DM_REST_POD_MEMORY_SIZE_REQ: 0.85Gi
UIV_DM_REST_POD_MEMORY_SIZE_LIM: 1Gi
UIV_DM_REST_POD_HEAP_MEMORY: "-Xms512m -Xmx717m"
UIV_DM_REST_REPLICAS: 1

UIV_RDA_POD_CPU_CORES_REQ: 0.5
UIV_RDA_POD_CPU_CORES_LIM: 4
UIV_RDA_POD_MEMORY_SIZE_REQ: 7Gi
UIV_RDA_POD_MEMORY_SIZE_LIM: 9Gi
UIV_RDA_POD_HEAP_MEMORY: "-Xms4608m -Xmx7373m"
UIV_RDA_REPLICAS: 1

UIV_FLOE_EVENTPROCESSOR_POD_CPU_CORES_REQ: 1
UIV_FLOE_EVENTPROCESSOR_POD_CPU_CORES_LIM: 2
UIV_FLOE_EVENTPROCESSOR_POD_MEMORY_SIZE_REQ: 1Gi
UIV_FLOE_EVENTPROCESSOR_POD_MEMORY_SIZE_LIM: 2Gi
UIV_FLOE_EVENTPROCESSOR_DATA_DISK_SIZE: 4Gi
UIV_FLOE_EVENTPROCESSOR_POD_HEAP_MEMORY: "-Xms1024m -Xmx1434m"
UIV_FLOE_EVENTPROCESSOR_REPLICAS: 1

UIV_FLOE_FLOEPROCESSOR_POD_CPU_CORES_REQ: 1
UIV_FLOE_FLOEPROCESSOR_POD_CPU_CORES_LIM: 2
UIV_FLOE_FLOEPROCESSOR_POD_MEMORY_SIZE_REQ: 3.25Gi
UIV_FLOE_FLOEPROCESSOR_POD_MEMORY_SIZE_LIM: 6.5Gi
UIV_FLOE_FLOEPROCESSOR_DATA_DISK_SIZE: 20Gi
UIV_FLOE_FLOEPROCESSOR_POD_HEAP_MEMORY: "-Xms3328m -Xmx5824m"
UIV_FLOE_FLOEPROCESSOR_REPLICAS: 1

UIV_RDA_DATALAKEPROCESSOR_POD_CPU_CORES_REQ: 0.5
UIV_RDA_DATALAKEPROCESSOR_POD_CPU_CORES_LIM: 1
UIV_RDA_DATALAKEPROCESSOR_POD_MEMORY_SIZE_REQ: 1Gi
UIV_RDA_DATALAKEPROCESSOR_POD_MEMORY_SIZE_LIM: 1.5Gi
UIV_RDA_DATALAKEPROCESSOR_POD_HEAP_MEMORY: "-Xms768m -Xmx1229m"
UIV_RDA_DATALAKEPROCESSOR_REPLICAS: 1

UIV_TECH_TEMP_POD_CPU_CORES_REQ: 1
UIV_TECH_TEMP_POD_CPU_CORES_LIM: 1.5
UIV_TECH_TEMP_POD_MEMORY_SIZE_REQ: 1Gi
UIV_TECH_TEMP_POD_MEMORY_SIZE_LIM: 2Gi
UIV_TECH_TEMP_POD_HEAP_MEMORY: "-Xms1024m -Xmx1434m"
UIV_TECH_TEMP_REPLICAS: 1

UIV_NUM_MGMT_POD_CPU_CORES_REQ: 0.5
UIV_NUM_MGMT_POD_CPU_CORES_LIM: 1.5
UIV_NUM_MGMT_POD_MEMORY_SIZE_REQ: 1Gi
UIV_NUM_MGMT_POD_MEMORY_SIZE_LIM: 2Gi
UIV_NUM_MGMT_POD_HEAP_MEMORY: "-Xms1024m -Xmx1434m"
UIV_NUM_MGMT_REPLICAS: 1

UIV_UAM_POD_CPU_CORES_REQ: 0.3
UIV_UAM_POD_CPU_CORES_LIM: 1
UIV_UAM_POD_MEMORY_SIZE_REQ: 0.75Gi
UIV_UAM_POD_MEMORY_SIZE_LIM: 1Gi
UIV_UAM_POD_HEAP_MEMORY: "-Xms410m -Xmx717m"
UIV_UAM_REPLICAS: 1

UIV_AUDIT_LOGGER_POD_CPU_CORES_REQ: 0.5
UIV_AUDIT_LOGGER_POD_CPU_CORES_LIM: 1
UIV_AUDIT_LOGGER_POD_MEMORY_SIZE_REQ: 0.75Gi
UIV_AUDIT_LOGGER_POD_MEMORY_SIZE_LIM: 1Gi
UIV_AUDIT_LOGGER_POD_HEAP_MEMORY: "-Xms512m -Xmx820m"
UIV_AUDIT_LOGGER_REPLICAS: 1

IHUB_UI_POD_CPU_CORES_REQ: 0.5
IHUB_UI_POD_CPU_CORES_LIM: 0.5
IHUB_UI_POD_MEMORY_SIZE_REQ: 0.5Gi
IHUB_UI_POD_MEMORY_SIZE_LIM: 0.5Gi
IHUB_UI_REPLICAS: 1

IHUB_REST_POD_CPU_CORES_REQ: 0.5
IHUB_REST_POD_CPU_CORES_LIM: 1
IHUB_REST_POD_MEMORY_SIZE_REQ: 1Gi
IHUB_REST_POD_MEMORY_SIZE_LIM: 1Gi
IHUB_REST_POD_HEAP_MEMORY: "-Xms512m -Xmx615m"
IHUB_REST_REPLICAS: 1

NEO4J_POD_CPU_CORES_REQ: 1
NEO4J_POD_CPU_CORES_LIM: 3
NEO4J_POD_MEMORY_SIZE_REQ: 6Gi
NEO4J_POD_MEMORY_SIZE_LIM: 6Gi
NEO4J_DATA_DISK_SIZE: 10Gi
# HEAP_SIZE_INIT AND HEAP_SIZE_MAX CAN BE SAME VALUE. HEAP MAX + NEO4J_PAGECACHE_SIZE SHOULD BE LESSER THAN NEO4J_POD_MEMORY_SIZE_LIMIT
NEO4J_PAGECACHE_SIZE: 2458m
NEO4J_HEAP_SIZE_INIT: 2458m
NEO4J_HEAP_SIZE_MAX: 2458m

KAFKA_BROKER_POD_CPU_CORES_REQ: 0.5
KAFKA_BROKER_POD_CPU_CORES_LIM: 1
KAFKA_BROKER_POD_MEMORY_SIZE_REQ: 1Gi
KAFKA_BROKER_POD_MEMORY_SIZE_LIM: 1Gi
KAFKA_BROKER_DATA_DISK_SIZE: 10Gi
KAFKA_BROKER_LOG_DISK_SIZE: 3Gi
KAFKA_BROKER_POD_HEAP_MEMORY: "-Xms512m -Xmx820m"
KAFKA_BROKER_REPLICAS: 1

KAFKA_ZK_POD_CPU_CORES_REQ: 0.5
KAFKA_ZK_POD_CPU_CORES_LIM: 0.6
KAFKA_ZK_POD_MEMORY_SIZE_REQ: 0.75Gi
KAFKA_ZK_POD_MEMORY_SIZE_LIM: 1.5Gi
KAFKA_ZK_DATA_DISK_SIZE: 5Gi
KAFKA_ZK_LOG_DISK_SIZE: 2.5Gi
KAFKA_ZK_HEAP_SIZE: 0.75Gi

MARIADB_POD_CPU_CORES_REQ: 0.5
MARIADB_POD_CPU_CORES_LIM: 1
MARIADB_POD_MEMORY_SIZE_REQ: 1Gi
MARIADB_POD_MEMORY_SIZE_LIM: 1Gi
MARIADB_DATA_DISK_SIZE: 20Gi

ETCD_POD_CPU_CORES_REQ: 0.2
ETCD_POD_CPU_CORES_LIM: 0.5
ETCD_POD_MEMORY_SIZE_REQ: 2Gi
ETCD_POD_MEMORY_SIZE_LIM: 2Gi
ETCD_DATA_DISK_SIZE: 5Gi

VAULT_POD_CPU_CORES_REQ: 0.25
VAULT_POD_CPU_CORES_LIM: 0.5
VAULT_POD_MEMORY_SIZE_REQ: 1Gi
VAULT_POD_MEMORY_SIZE_LIM: 1Gi

MINIO_POD_CPU_CORES_REQ: 0.2
MINIO_POD_CPU_CORES_LIM: 0.5
MINIO_POD_MEMORY_SIZE_REQ: 0.5Gi
MINIO_POD_MEMORY_SIZE_LIM: 0.5Gi
MINIO_DATA_DISK_SIZE: 50Gi

IGNITE_POD_CPU_CORES_REQ: 0.5
IGNITE_POD_CPU_CORES_LIM: 1
IGNITE_POD_MEMORY_SIZE_REQ: 2.5Gi
IGNITE_POD_MEMORY_SIZE_LIM: 2.5Gi
IGNITE_PERSISTENCE_STORAGE_SIZE: 20Gi
IGNITE_WAL_STORAGE_SIZE: 7Gi
IGNITE_DEFAULT_REGION_INITIAL_SIZE: "#{205 * 1024 * 1024}"
IGNITE_DEFAULT_REGION_MAX_SIZE: "#{1L * 1024 * 1024 * 1024}"
IGNITE_REPLICAS: 1


UIV_ONBOARDING_MANAGER_POD_CPU_CORES_REQ: 0.2
UIV_ONBOARDING_MANAGER_POD_CPU_CORES_LIM: 1
UIV_ONBOARDING_MANAGER_POD_MEMORY_SIZE_REQ: 1Gi
UIV_ONBOARDING_MANAGER_POD_MEMORY_SIZE_LIM: 2Gi
UIV_ONBOARDING_MANAGER_POD_HEAP_MEMORY: "-Xms820m -Xmx1434m"
UIV_ONBOARDING_MANAGER_REPLICAS: 1

