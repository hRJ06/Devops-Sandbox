# EKS Cluster – Configuration Overview

This document explains the key parts of the Terraform setup for creating an Amazon EKS cluster with managed nodes and necessary add-ons.

---

## 🔧 Cluster Configuration

```hcl
  cluster_name                   = local.name
```
Sets the name of the EKS cluster using a local variable (`local.name`). This name will appear in the AWS Console and is used in resource naming.

```hcl
  cluster_endpoint_public_access = true
```
Enables public access to the Kubernetes API server.  
✅ Makes it easier to use `kubectl` from your laptop.  
⚠️ In production, you may want to restrict access for security reasons.

---

## 🌐 Networking Configuration

```hcl
  vpc_id                   = module.vpc.vpc_id
```
Specifies the VPC where the EKS cluster will be deployed. The value comes from another VPC module.

```hcl
  subnet_ids               = module.vpc.private_subnets
```
Private subnets used to host the EKS worker nodes (EC2 instances).  
✅ Keeps your nodes secure by preventing direct internet access.

```hcl
  control_plane_subnet_ids = module.vpc.intra_subnets
```
Specifies subnets used by the EKS control plane (API server, etcd).  
✅ Usually isolated for improved security and not connected to the internet.

---

## 🔌 EKS Add-ons

```hcl
  cluster_addons = {
    vpc-cni = {
      most-recent = true
    }
    kube-proxy = {
      most-recent = true
    }
    coredns = {
      most-recent = true
    }
  }
```

This block installs **essential Kubernetes networking components** that EKS requires to function properly.

| Add-on     | Purpose |
|------------|---------|
| **`vpc-cni`** | AWS VPC CNI plugin. Gives each pod a native VPC IP. Enables Kubernetes pods to directly communicate over the VPC network. |
| **`kube-proxy`** | Manages Kubernetes networking rules (iptables/ipvs) on nodes. Routes traffic to services and pods. |
| **`coredns`** | Internal DNS for the cluster. Lets pods resolve service names (like `my-service.default.svc.cluster.local`). |

🆕 All are installed with `most-recent = true` to ensure the latest stable and AWS-supported versions are used.

---

## 🧰 Node Group Defaults

```hcl
  eks_managed_node_group_defaults = {
    instance_types                        = ["t2.medium"]
    attach_cluster_primary_security_group = true
  }
```

These settings apply to **all node groups** unless overridden:

- `instance_types = ["t2.medium"]`: Default EC2 type for worker nodes. Suitable for light workloads.
- `attach_cluster_primary_security_group = true`: Links the cluster’s primary security group to the nodes, enabling internal cluster communication.

---

## 👷 Managed Node Group

```hcl
  eks_managed_node_groups = {
    hindol-cluster-ng = {
      instance_types = ["t2.medium"]

      min_size     = 2
      max_size     = 3
      desired_size = 2

      capacity_type = "SPOT"
    }
  }
```

Defines a **named node group** (`hindol-cluster-ng`) with the following configuration:

| Field          | Description |
|----------------|-------------|
| `instance_types` | Uses `t2.medium` EC2 instances for the worker nodes. |
| `min_size`       | Minimum number of nodes (auto-scaling lower bound). |
| `max_size`       | Maximum number of nodes (auto-scaling upper bound). |
| `desired_size`   | Number of nodes to create initially. |
| `capacity_type`  | `SPOT` uses cheaper, interruptible spot instances to reduce cost. |

✅ This group will be used to run your Kubernetes workloads.

---

## 🏷 Tags

```hcl
  tags = {
    Environment = local.env
    Terraform   = "true"
  }
```

Adds useful metadata to the resources:

- `Environment`: Uses `local.env` to tag the deployment environment (`dev`, `stage`, `prod`, etc.).
- `Terraform`: Marks that these resources are managed by Terraform.

---

## 🧾 Summary Table

| Section                        | Description |
|-------------------------------|-------------|
| `cluster_name`                | Sets cluster name |
| `cluster_endpoint_public_access` | Enables public access to API |
| `vpc_id`                      | VPC for EKS cluster |
| `subnet_ids`                  | Private subnets for worker nodes |
| `control_plane_subnet_ids`    | Subnets for EKS control plane |
| `cluster_addons`              | Installs networking & DNS plugins |
| `eks_managed_node_group_defaults` | Default settings for node groups |
| `eks_managed_node_groups`     | EC2 node groups to run Kubernetes workloads |
| `tags`                        | AWS resource metadata |

