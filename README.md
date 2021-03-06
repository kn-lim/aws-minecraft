# AWS Minecraft Server

Uses Terraform to create a Minecraft Server EC2 instance on AWS and adds a CNAME entry to Route53.

# Requirements

| Name      | Version  |
| --------- | -------- |
| terraform | >= 1.1.5 |
| aws       | >= 3.0   |

You will also need to provide the [Minecraft Server JAR Download URL](https://www.minecraft.net/en-us/download/server).

# Usage

## Variables

| Name            | Description                         |
| --------------- | ----------------------------------- |
| name            | Name of the Minecraft Server        |
| region          | AWS Region                          |
| private_key     | Path to Private Key                 |
| public_key      | Path to Public Key                  |
| ami             | AMI ID                              |
| instance_type   | Instance Type                       |
| route53_zone    | Route53 Zone                        |
| cname           | CNAME of the Minecraft Server       |
| personal_ip     | Personal IP to allow SSH Access     |
| personal_subnet | Personal Subnet to allow SSH Access |
| server_url      | URL to download Server JAR          |
| java_max_memory | Max Amount of Memory to Allocate    |

## Running

1. Create the following environment variables using the following commands and add in your AWS credentials:

```
export AWS_ACCESS_KEY_ID=""
export AWS_SECRET_ACCESS_KEY=""
export AWS_SESSION_TOKEN=""  <-- OPTIONAL
```

2. Create a SSH key to use to access the Minecraft instance.
3. Run `terraform init`.
4. Run `terraform apply`.

# Important Notes

## How to Start the Server

1. Remote into the instance by using the SSH key specified in `terraform.tfvars`.
2. Run `./run.sh`, preferably using `screen` or `tmux`.
3. Once the server starts up, shut it down and modify `server.properties`.
4. Re-run `./run.sh` to start the server.

## How to Get AWS Credentials

If MFA is enabled, run:

```
aws sts get-session-token --serial-number arn:aws:iam::[YOUR MFA ARN] --duration-seconds [DURATION TO ALLOW ACCESS] --token-code [YOUR MFA DIGITS]
```

If MFA is not enabled, the information is located in your security profile under IAM or already existing in your AWS CLI configuration.

## AWS Instance Types

- t3.small: 1 - 10 people
- t3.medium: < 20 people
- Depending on your server requirements, you may need to try different instance types to see what works best.
- RAM is the largest constraint when running a Minecraft server.

## Modified Minecraft Servers (Spigot, Paper, etc.)

As long as the download URL is provided in your `terraform.tfvars` file, all modified Minecraft servers should work.
