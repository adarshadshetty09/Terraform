# EFS - Elastic File System

### 1. Create EFS and EC2 machine within the same VPC

### 2. Create Custom VPC with different Subnet

### 3.  Enable HostName DNS in VPC

## Commands to Mount the EFS to EC2 Machine

#### For Linux Machine

#### 1. Go to root directory and create file for mount

```
sudo bash
```

```
sudo mkdir -p efs-1a
```

### 2. Upgrade the machine

```
yum update
yup upgrade -y 
```

### 3. To check the file system

```
df -h
```

### Install nc

```
yum install nc -y 
```

### Install mount utilit

```
sudo yum install -y amazon-efs-utils nfs-utils
```

### Two way to Mount

##### 1. Using IP

```

```

#### 2. Using EFS DNS

# Create a large file to simulate storage usage



```
dd if=/dev/zero of=/efs-1b/largefile bs=1M count=1024
```

```
du -h largefile
```
