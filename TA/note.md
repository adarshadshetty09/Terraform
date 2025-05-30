# 🛠️ Infrastructure as Code (IaC) & Terraform - Neat Notes

---

## 🌐 1. Why IaC?
- Avoids problems caused by **manual configuration**
- Enables **reliable**, **repeatable**, and **predictable** infrastructure changes
- Supports **versioning**, **auditing**, and **automation**

---

## 🧰 2. Popular IaC Tools

### ✅ Declarative Tools (Define *what* to achieve)
| Cloud Provider | Tool |
|----------------|------|
| **Azure**      | ARM Templates, Azure Blueprints |
| **AWS**        | AWS CloudFormation              |
| **GCP**        | Cloud Deployment Manager        |
| **Multi-Cloud**| **Terraform**                   |

### 🔁 Imperative Tools (Define *how* to achieve it)
- Prone to **misconfiguration**
- Often used with languages like **Python**, **Ruby**, **JavaScript**
- Examples:
  - **CDK** (AWS Cloud Development Kit)
  - **Pulumi** (AWS, Azure, GCP, Kubernetes)

---

## 🔄 3. Infrastructure Lifecycle (Managed by DevOps Engineers)
1. **Plan**
2. **Design**
3. **Build**
4. **Test**
5. **Deliver**
6. **Maintain**
7. **Retire**

---

## 🔁 4. Enhancing the Infrastructure Lifecycle

### ✔️ Reliability
- IaC makes infrastructure **idempotent**, **consistent**, and **predictable**
- Running code multiple times results in the **same expected state**

---

## 🧪 5. Idempotent vs Non-Idempotent

| Type           | Description |
|----------------|-------------|
| **Idempotent**     | Same input → same outcome every time |
| **Non-Idempotent** | Output may vary with each run        |

---

## 🔍 6. Provisioning vs Deployment vs Orchestration
- **Provisioning**: Creating infrastructure resources (e.g., VMs, storage)
- **Deployment**: Deploying applications to provisioned resources
- **Orchestration**: Managing multiple tasks (e.g., scaling, coordination)

---

## ⚠️ 7. Configuration Drift

### 📉 What is it?
When the actual infrastructure configuration **diverges** from the intended IaC configuration.

### ❗ Causes:
- Manual changes
- Malicious actions
- Untracked API/SDK/CLI interactions

### 🔎 How to Detect Drift:
- **Compliance Tools**: 
  - AWS Config
  - Azure Policies
  - GCP Security Health Analytics
- **Terraform Features**:
  - `terraform refresh`
  - `terraform plan`
  - State file tracking
- **Built-in Tools**: 
  - AWS CloudFormation Drift Detection

### 🛠️ How to Fix It:
- Auto-remediation with compliance tools
- Use Terraform refresh and plan
- Manually correct configurations
- Tear down and recreate infrastructure

---

## 🛡️ 8. Preventing Drift
- Use **immutable infrastructure** (e.g., blue-green deployments)
- Don’t modify servers after deployment
- Bake images using:
  - AWS Image Builder
  - Packer
  - GCP Cloud Run (for containers)
- Implement **GitOps**:
  - Version control IaC in Git
  - Automate deployments through CI/CD

---

## 🌿 9. Terraform Concepts Checklist

| Concept                                       | Status |
|----------------------------------------------|--------|
| Understand the IaC Concept                   | ✅     |
| Understand Terraform Basics                 | ✅     |
| Use the Terraform CLI (outside core workflow)| ✅     |
| Interact with Terraform Modules              | ✅     |
| Navigate Terraform Workflow                  | ✅     |
| Implement and Maintain State                 | ✅     |
| Read, Generate, and Modify Configuration     | ✅     |
| Understand Terraform Cloud & Enterprise      | ✅     |

---




# 🌐 Infrastructure Concepts & Terraform – Neat Notes

---

## 🔄 Mutable vs Immutable Infrastructure

### 🔧 Mutable Infrastructure
- A **VM is deployed** and then **configured** using a **Configuration Management (CM)** tool (e.g., Ansible, Chef).
- Configuration changes are made **on the running instance**.

### 🛡️ Immutable Infrastructure
- A **VM is launched, provisioned**, and then **converted into an image**.
- The **image is stored** in a repository.
- Any new deployment uses the **pre-baked image**.
- Ensures consistency and prevents drift.

---

## 🔁 What is GitOps?

- GitOps = **IaC + Git + Automation**
- All infrastructure changes are made via **Git pull requests**.
- Once reviewed and merged, they **automatically trigger deployments**.
- Ensures:
  - Traceability
  - Peer reviews
  - Automated delivery pipelines

---

## 💡 Immutable Infrastructure Guarantees

**Scenarios Handled:**
- EC2 instance **fails health check**
- Post-installation **script failure** due to package changes
- Need to **deploy in a hurry**

**Worst-case Scenarios:**
- **Accidental deletion**
- **Security compromise**
- **Region outage** → need to migrate infrastructure

---

## 🏢 HashiCorp Tools

| Tool     | Description |
|----------|-------------|
| **Boundary** | Secure remote access based on trusted identity |
| **Consul**   | Service discovery, service mesh, config storage |
| **Nomad**    | Cluster scheduler for workload deployment |
| **Packer**   | Create identical machine images for multiple platforms |
| **Terraform**| IaC tool to provision and manage infrastructure |
| **Terraform Cloud** | SaaS platform for Terraform collaboration |
| **Vagrant**  | Manage development environments using VMs |
| **Vault**    | Manage secrets and protect sensitive data |
| **Waypoint** | Build, deploy, and release automation workflow |

---

## 🌱 Notable Features of Terraform

1. **Installable modules** (reusable code blocks)
2. **Plan and predict** changes (`terraform plan`)
3. **Dependency graphing** (`terraform graph`)
4. **State management** (tracks current infra)
5. **Supports familiar languages** (via CDK)

---

## ☁️ Terraform Cloud – SaaS Features

- Remote **state storage**
- Git-based **version control integration**
- Support for **collaborative workflows**
- UI for managing and applying changes

---

## 🔄 Terraform Lifecycle

```plaintext
Write/Update .tf → terraform init → terraform plan → terraform validate → terraform apply → terraform destroy



# 🧱 Terraform Architecture & Best Practices – Notes

---

## 🔧 Terraform Logical Architecture

Terraform is logically split into **two main components**:

### 1. 🧠 Terraform Core
- Written in **Go**
- Responsible for:
  - **Reading** and **interpolating** configuration files
  - **Dependency graph** generation
  - Creating **execution plans**
  - Performing **state management**
- Uses **Remote Procedure Calls (RPC)** to communicate with plugins

### 2. 🔌 Terraform Plugins
- Also written in **Go**
- Responsible for:
  - Providing **implementations for providers** (e.g., AWS, Azure, GCP)
  - Managing **resources** and **provisioners**
- Include:
  - **Provider Plugins** (e.g., `terraform-provider-aws`)
  - **Provisioner Plugins** (e.g., `local-exec`, `remote-exec`)

---

## 🧭 Terraform Architecture Diagram

> 📌 **Visual Architecture**:  
> Terraform Core ↔ (via RPC) ↔ Terraform Plugins (Providers, Provisioners)  
> *(Refer to official Terraform documentation or book illustrations for a detailed diagram)*

---

## 📘 Recommended Reading

### 📚 **Terraform: Up & Running**
- Author: **Yevgeniy Brikman**
- Publisher: **O’Reilly**
- Widely considered the **best practical book** to learn Terraform
- Covers:
  - Real-world IaC use cases
  - Module design
  - Deployment strategies
  - Terraform Cloud & Workspaces

---

## ✅ Terraform Best Practices

1. **Use remote backend** to store Terraform state
2. **Modularize your configuration**
   - Reuse code with modules
3. **Keep secrets out of code**
   - Use `vault`, environment variables, or secret managers
4. **Use `terraform plan` before `apply`**
   - Always review changes
5. **Enable version pinning** for providers
6. **Use `terraform fmt` and `validate`**
   - Maintain consistency and catch syntax issues
7. **Use Workspaces** for environment segregation (dev, staging, prod)
8. **Lock state** using remote backends (like Terraform Cloud or S3 + DynamoDB)
9. **Use CI/CD pipelines** for infrastructure changes
10. **Document** all modules and environments

---

## ⚙️ Installing Terraform

### 🖥️ Steps to Install:

#### For Linux/macOS:
```bash
# Download the binary
wget https://releases.hashicorp.com/terraform/<version>/terraform_<version>_linux_amd64.zip

# Unzip the binary
unzip terraform_<version>_linux_amd64.zip

# Move to /usr/local/bin
sudo mv terraform /usr/local/bin/

# Verify installation
terraform -v




## Docker 


docker network create mongo-network

docker run -d --name mongo \
  --network mongo-network \
  -p 27017:27017 \
  mongo:latest


docker run -d --name mongo-express \
  --network mongo-network \
  -p 8081:8081 \
  -e ME_CONFIG_MONGODB_URL="mongodb://mongo:27017" \
  -e ME_CONFIG_BASICAUTH="false" \
  mongo-express:latest

localhost:27017