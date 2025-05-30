# Install Terraform_Vault 

```
sudo snap install vault
```

## Start the service

```
vault server -dev
```






```
ubuntu@ip-172-31-12-39:~$ sudo apt update
sudo apt install -y unzip
wget https://releases.hashicorp.com/vault/1.14.3/vault_1.14.3_linux_amd64.zip
unzip vault_1.14.3_linux_amd64.zip
sudo mv vault /usr/local/bin/
Hit:1 http://ap-south-1.ec2.archive.ubuntu.com/ubuntu noble InRelease



ubuntu@ip-172-31-12-39:~$ vault -v
Vault v1.14.3 (56debfa71653e72433345f23cd26276bc90629ce), built 2023-09-11T21:23:55Z
ubuntu@ip-172-31-12-39:~$ vault server -dev &
[1] 1655
ubuntu@ip-172-31-12-39:~$ ==> Vault server configuration:

Administrative Namespace:
             Api Address: http://127.0.0.1:8200
                     Cgo: disabled
         Cluster Address: https://127.0.0.1:8201
   Environment Variables: DBUS_SESSION_BUS_ADDRESS, GODEBUG, HOME, LANG, LESSCLOSE, LESSOPEN, LOGNAME, LS_COLORS, PATH, PWD, SHELL, SHLVL, SSH_CLIENT, SSH_CONNECTION, SSH_TTY, TERM, USER, XDG_DATA_DIRS, XDG_RUNTIME_DIR, XDG_SESSION_CLASS, XDG_SESSION_ID, XDG_SESSION_TYPE, _
              Go Version: go1.20.8
              Listener 1: tcp (addr: "127.0.0.1:8200", cluster address: "127.0.0.1:8201", max_request_duration: "1m30s", max_request_size: "33554432", tls: "disabled")
               Log Level:
                   Mlock: supported: true, enabled: false
           Recovery Mode: false
                 Storage: inmem
                 Version: Vault v1.14.3, built 2023-09-11T21:23:55Z
             Version Sha: 56debfa71653e72433345f23cd26276bc90629ce

==> Vault server started! Log data will stream in below:



```













***********************************************************

```
sudo apt-get update && sudo apt-get install -y gnupg software-properties-common
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
```


# &

```
sudo apt-get update && sudo apt-get install -y gnupg software-properties-common curl
curl -fsSL https://apt.releases.hashicorp.com/gpg | gpg --dearmor -o hashicorp.gpg
sudo install -o root -g root -m 644 hashicorp.gpg /usr/share/keyrings/
echo "deb [signed-by=/usr/share/keyrings/hashicorp.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install terraform
terraform -v
```

## &

```
sudo apt install vault
vault -v
```

# & 

```
vault server -dev
```

# & 

```
export VAULT_ADDR='http://127.0.0.1:8200'
export VAULT_TOKEN='s.xxxxxxxxxxxxxxxxxxxx'  # paste your token
```

```
ubuntu@ip-172-31-4-217:~$ vault server -dev &
[1] 16075
ubuntu@ip-172-31-4-217:~$ Command 'vault' not found, but can be installed with:
sudo snap install vault

[1]+  Exit 127                vault server -dev
ubuntu@ip-172-31-4-217:~$ sudo snap install vault
vault (1.18/stable) 1.18.5 from Canonical✓ installed
ubuntu@ip-172-31-4-217:~$
```


## *************************************************** ##

```
# Update package lists
sudo apt update

# Install necessary tools (if not already present)
sudo apt install -y wget unzip

# Determine the latest Vault version (check the HashiCorp website: https://www.vaultproject.io/downloads)
# For example, let's assume the latest version is 1.17.0
VAULT_VERSION="1.17.0"

# Download the Vault binary for Linux (AMD64)
wget "https://releases.hashicorp.com/vault/${VAULT_VERSION}/vault_${VAULT_VERSION}_linux_amd64.zip"

# Unzip the downloaded file
unzip "vault_${VAULT_VERSION}_linux_amd64.zip"

# Move the vault binary to a directory in your system's PATH (e.g., /usr/local/bin)
sudo mv vault /usr/local/bin/

# Verify the installation
vault --version
```

```
vault server -dev &
```

```
export VAULT_ADDR='http://127.0.0.1:8200'
export VAULT_TOKEN='YOUR_ROOT_TOKEN' # Replace with the root token you saw in the previous step
```

```
vault secrets enable -path=aws kv-v2
```

```
ubuntu@ip-172-31-2-38:~$ vault secrets enable -path=aws kv-v2
2025-04-04T14:10:13.618Z [INFO]  core: successful mount: namespace="" path=aws/ type=kv version="v0.19.0+builtin"
Success! Enabled the kv-v2 secrets engine at: aws/
ubuntu@ip-172-31-2-38:~$ vault kv put aws/creds/my-aws-credentials \
    access_key="AKIAVQEVFHOTO4GPM4UU" \
    secret_key="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"
========== Secret Path ==========
aws/data/creds/my-aws-credentials

======= Metadata =======
Key                Value
---                -----
created_time       2025-04-04T14:10:22.382166516Z
custom_metadata    <nil>
deletion_time      n/a
destroyed          false
version            1
ubuntu@ip-172-31-2-38:~$ vault kv get aws/creds/my-aws-credentials
========== Secret Path ==========
aws/data/creds/my-aws-credentials

======= Metadata =======
Key                Value
---                -----
created_time       2025-04-04T14:10:22.382166516Z
custom_metadata    <nil>
deletion_time      n/a
destroyed          false
version            1

======= Data =======
Key           Value
---           -----
access_key    AKIAVQEVFHOTO4GPM4UU
secret_key    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
ubuntu@ip-172-31-2-38:~$
```

# Local

```
devops:dopadm:~/TERRAFORM_TUTORIAL/TERRAFORM_VAULT$vault write aws/config/root access_key=AKIAVQEVFHOTO4GPM4UU secret_key=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 region=ap-south-1
Success! Data written to: aws/config/root
devops:dopadm:~/TERRAFORM_TUTORIAL/TERRAFORM_VAULT$
```

```
devops:dopadm:~/TERRAFORM_TUTORIAL/TERRAFORM_VAULT$vault token lookup
Key                 Value
---                 -----
accessor            XMiXOK0Uw6ZEQiE4OatanRFe
creation_time       1743785695
creation_ttl        0s
display_name        root
entity_id           n/a
expire_time         <nil>
explicit_max_ttl    0s
id                  hvs.01H0LSzsWHXyqBrsLTZzW5Ho
meta                <nil>
num_uses            0
orphan              true
path                auth/token/root
policies            [root]
ttl                 0s
type                service
devops:dopadm:~/TERRAFORM_TUTORIAL/TERRAFORM_VAULT$vault secrets list
Path          Type         Accessor              Description
----          ----         --------              -----------
cubbyhole/    cubbyhole    cubbyhole_e07a62a9    per-token private secret storage
identity/     identity     identity_8e37827d     identity store
secret/       kv           kv_8ea468ed           key/value secret storage
sys/          system       system_fb023cff       system endpoints used for control, policy and debugging
devops:dopadm:~/TERRAFORM_TUTORIAL/TERRAFORM_VAULT$vault secrets enable -path=aws aws
2025-04-04T22:30:17.249+0530 [INFO]  secrets.aws.aws_23eef1a5: populating rotation queue
2025-04-04T22:30:17.249+0530 [INFO]  core: successful mount: namespace="" path=aws/ type=aws version="v1.18.5+builtin.vault"
Success! Enabled the aws secrets engine at: aws/

```