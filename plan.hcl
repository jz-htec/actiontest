<details>
<summary>Plan details:</summary>
<br>

Note: Objects have changed outside of Terraformd

Terraform detected the following changes made outside of Terraform since the
last "terraform apply":

  # aws_iam_policy.credentials_selfservice has changed
  ~ resource "aws_iam_policy" "credentials_selfservice" {
        id          = "arn:aws:iam::502706403852:policy/IamUserCredentialsSelfService"
        name        = "IamUserCredentialsSelfService"
      ~ policy      = jsonencode( # whitespace changes
            {
                Statement = [
                    {
                        Action   = [
                            "iam:GetAccountPasswordPolicy",
                            "iam:GetAccountSummary",
                        ]
                        Effect   = "Allow"
                        Resource = "*"
                        Sid      = "AllowViewAccountInfo"
                    },
                    {
                        Action   = [
                            "iam:ChangePassword",
                            "iam:GetUser",
                        ]
                        Effect   = "Allow"
                        Resource = "arn:aws:iam::*:user/${aws:username}"
                        Sid      = "AllowManageOwnPasswords"
                    },
                    {
                        Action   = [
                            "iam:CreateAccessKey",
                            "iam:DeleteAccessKey",
                            "iam:ListAccessKeys",
                            "iam:UpdateAccessKey",
                        ]
                        Effect   = "Allow"
                        Resource = "arn:aws:iam::*:user/${aws:username}"
                        Sid      = "AllowManageOwnAccessKeys"
                    },
                    {
                        Action   = [
                            "iam:DeleteSSHPublicKey",
                            "iam:GetSSHPublicKey",
                            "iam:ListSSHPublicKeys",
                            "iam:UpdateSSHPublicKey",
                            "iam:UploadSSHPublicKey",
                        ]
                        Effect   = "Allow"
                        Resource = "arn:aws:iam::*:user/${aws:username}"
                        Sid      = "AllowManageOwnSSHPublicKeys"
                    },
                    {
                        Action   = [
                            "iam:DeactivateMFADevice",
                            "iam:DeleteVirtualMFADevice",
                            "iam:EnableMFADevice",
                            "iam:ResyncMFADevice",
                            "iam:CreateVirtualMFADevice",
                            "iam:ListMFADevices",
                        ]
                        Effect   = "Allow"
                        Resource = [
                            "arn:aws:iam::*:user/${aws:username}",
                            "arn:aws:iam::*:mfa/${aws:username}",
                        ]
                        Sid      = "AllowManageOwnMfaDevice"
                    },
                    {
                        Action   = [
                            "iam:CreateServiceSpecificCredential",
                            "iam:UpdateServiceSpecificCredential",
                            "iam:ResetServiceSpecificCredential",
                            "iam:ListServiceSpecificCredentials",
                            "iam:DeleteServiceSpecificCredential",
                            "iam:UploadSigningCertificate",
                            "iam:DeleteSigningCertificate",
                            "iam:UpdateSigningCertificate",
                            "iam:ListSigningCertificates",
                        ]
                        Effect   = "Allow"
                        Resource = "arn:aws:iam::*:user/${aws:username}"
                        Sid      = "AllowCodeCommitAndSigningCerts"
                    },
                ]
                Version   = "2012-10-17"
            }
        )
        tags        = {}
        # (5 unchanged attributes hidden)
    }

  # aws_iam_role.this["Auditors"] has changed
  ~ resource "aws_iam_role" "this" {
      ~ assume_role_policy    = jsonencode(
          ~ {
              ~ Statement = [
                  ~ {
                      ~ Principal = {
                          ~ AWS = [
                              - "arn:aws:iam::336020864752:root",
                                "arn:aws:iam::502706403852:root",
                              + "arn:aws:iam::336020864752:root",
                            ]
                        }
                        # (2 unchanged elements hidden)
                    },
                ]
                # (1 unchanged element hidden)
            }
        )
        id                    = "Auditors"
        name                  = "Auditors"
        tags                  = {}
        # (8 unchanged attributes hidden)

        # (1 unchanged block hidden)
    }

  # aws_iam_role.this["BackendTeam"] has changed
  ~ resource "aws_iam_role" "this" {
        id                    = "BackendTeam"
        name                  = "BackendTeam"
        tags                  = {}
        # (9 unchanged attributes hidden)

      - inline_policy {}
      + inline_policy {
          + name   = "SSMFullAccess"
          + policy = jsonencode(
                {
                  + Statement = [
                      + {
                          + Action   = [
                              + "ssm:PutParameter",
                              + "ssm:DescribeParameters",
                              + "ssm:GetParameterHistory",
                              + "ssm:GetParametersByPath",
                              + "ssm:GetParameters",
                              + "ssm:GetParameter",
                            ]
                          + Effect   = "Allow"
                          + Resource = "*"
                          + Sid      = "VisualEditor0"
                        },
                    ]
                  + Version   = "2012-10-17"
                }
            )
        }
    }

  # aws_iam_role.this["FrontendTeam"] has changed
  ~ resource "aws_iam_role" "this" {
        id                    = "FrontendTeam"
        name                  = "FrontendTeam"
        tags                  = {}
        # (9 unchanged attributes hidden)

        # (1 unchanged block hidden)
    }

  # aws_iam_role.this["Observers"] has changed
  ~ resource "aws_iam_role" "this" {
        id                    = "Observers"
        name                  = "Observers"
        tags                  = {}
        # (9 unchanged attributes hidden)

        # (1 unchanged block hidden)
    }

  # aws_iam_role.this["QATeam"] has changed
  ~ resource "aws_iam_role" "this" {
      ~ assume_role_policy    = jsonencode(
          ~ {
              ~ Statement = [
                  ~ {
                      ~ Principal = {
                          ~ AWS = [
                              - "arn:aws:iam::336020864752:root",
                                "arn:aws:iam::502706403852:root",
                              + "arn:aws:iam::336020864752:root",
                            ]
                        }
                        # (2 unchanged elements hidden)
                    },
                ]
                # (1 unchanged element hidden)
            }
        )
        id                    = "QATeam"
      ~ managed_policy_arns   = [
          + "arn:aws:iam::502706403852:policy/SecretsManagerReadOnly",
            # (3 unchanged elements hidden)
        ]
        name                  = "QATeam"
        tags                  = {}
        # (7 unchanged attributes hidden)

        # (1 unchanged block hidden)
    }

  # aws_iam_role.this["SuperAdmins"] has changed
  ~ resource "aws_iam_role" "this" {
        id                    = "SuperAdmins"
        name                  = "SuperAdmins"
        tags                  = {}
        # (9 unchanged attributes hidden)

        # (1 unchanged block hidden)
    }

  # aws_kms_alias.terraform_state has changed
  ~ resource "aws_kms_alias" "terraform_state" {
        id             = "alias/devops-cryptography-key-master"
        name           = "alias/devops-cryptography-key-master"
        # (3 unchanged attributes hidden)
    }

  # aws_kms_key.terraform_state has changed
  ~ resource "aws_kms_key" "terraform_state" {
        id                       = "0a214ab8-2cb7-4aa1-97cd-4db80775dc72"
      + multi_region             = false
      ~ policy                   = jsonencode(
          ~ {
              ~ Statement = [
                    # (1 unchanged element hidden)
                    {
                        Action    = [
                            "kms:Create*",
                            "kms:Describe*",
                            "kms:Enable*",
                            "kms:List*",
                            "kms:Put*",
                            "kms:Update*",
                            "kms:Revoke*",
                            "kms:Disable*",
                            "kms:Get*",
                            "kms:Delete*",
                            "kms:TagResource",
                            "kms:UntagResource",
                            "kms:ScheduleKeyDeletion",
                            "kms:CancelKeyDeletion",
                        ]
                        Effect    = "Allow"
                        Principal = {
                            AWS = [
                                "arn:aws:iam::502706403852:user/mike.pignataro",
                                "arn:aws:iam::502706403852:role/SuperAdmins",
                                "arn:aws:iam::502706403852:role/OrganizationAccountAccessRole",
                            ]
                        }
                        Resource  = "*"
                        Sid       = "Allow access for Key Administrators"
                    },
                  ~ {
                      ~ Action    = [
                            # (4 unchanged elements hidden)
                            "kms:DescribeKey",
                          + "kms:GetKeyPolicy",
                          + "kms:GetKeyRotationStatus",
                          + "kms:ListResourceTags",
                          + "kms:ListAliases",
                        ]
                      ~ Principal = {
                          ~ AWS = [
                              - "arn:aws:iam::502706403852:user/mike.pignataro",
                              - "arn:aws:iam::502706403852:role/SuperAdmins",
                              + "arn:aws:iam::502706403852:role/GitHubIaC",
                                "arn:aws:iam::502706403852:role/OrganizationAccountAccessRole",
                            ]
                        }
                        # (3 unchanged elements hidden)
                    },
                    {
                        Action    = [
                            "kms:CreateGrant",
                            "kms:ListGrants",
                            "kms:RevokeGrant",
                        ]
                        Condition = {
                            Bool = {
                                kms:GrantIsForAWSResource = "true"
                            }
                        }
                        Effect    = "Allow"
                        Principal = {
                            AWS = [
                                "arn:aws:iam::502706403852:user/mike.pignataro",
                                "arn:aws:iam::502706403852:role/SuperAdmins",
                                "arn:aws:iam::502706403852:role/OrganizationAccountAccessRole",
                            ]
                        }
                        Resource  = "*"
                        Sid       = "Allow attachment of persistent resources"
                    },
                ]
                # (2 unchanged elements hidden)
            }
        )
        tags                     = {
            "CostCenter" = "DevOps"
            "Name"       = "DevOpsCryptographyKey"
        }
        # (8 unchanged attributes hidden)
    }

  # aws_s3_bucket_policy.terraform_state has changed
  ~ resource "aws_s3_bucket_policy" "terraform_state" {
        id     = "orbitmi-master-terraform-state"
      ~ policy = jsonencode(
          ~ {
              ~ Statement = [
                  ~ {
                      ~ Condition = {
                          ~ StringNotEquals = {
                              ~ aws:PrincipalArn = [
                                  - "arn:aws:iam::502706403852:user/mike.pignataro",
                                    "arn:aws:iam::502706403852:role/OrganizationAccountAccessRole",
                                  - "arn:aws:iam::502706403852:role/SuperAdmins",
                                  + "arn:aws:iam::502706403852:role/GitHubIaC",
                                ]
                            }
                          + StringNotLike   = {
                              + aws:userId = "*:jovica.zlatanovic"
                            }
                        }
                        # (5 unchanged elements hidden)
                    },
                ]
                # (1 unchanged element hidden)
            }
        )
        # (1 unchanged attribute hidden)
    }


Unless you have made equivalent changes to your configuration, or ignored the
relevant attributes using ignore_changes, the following plan may include
actions to undo or respond to these changes.

─────────────────────────────────────────────────────────────────────────────

Terraform used the selected providers to generate the following execution
plan. Resource actions are indicated with the following symbols:
  ~ update in-place

Terraform will perform the following actions:

  # aws_kms_key.terraform_state will be updated in-place
  ~ resource "aws_kms_key" "terraform_state" {
      + bypass_policy_lockout_safety_check = false
        id                                 = "0a214ab8-2cb7-4aa1-97cd-4db80775dc72"
      ~ policy                             = jsonencode(
          ~ {
              ~ Statement = [
                    {
                        Action    = "kms:*"
                        Effect    = "Allow"
                        Principal = {
                            AWS = "arn:aws:iam::502706403852:root"
                        }
                        Resource  = "*"
                        Sid       = "Enable IAM User Permissions"
                    },
                  ~ {
                      ~ Principal = {
                          ~ AWS = [
                              - "arn:aws:iam::502706403852:user/mike.pignataro",
                              - "arn:aws:iam::502706403852:role/SuperAdmins",
                              + "arn:aws:iam::502706403852:role/GitHubIaC",
                                "arn:aws:iam::502706403852:role/OrganizationAccountAccessRole",
                              + "arn:aws:iam::502706403852:role/SuperAdmins",
                            ]
                        }
                        # (4 unchanged elements hidden)
                    },
                  ~ {
                      ~ Action    = [
                            # (4 unchanged elements hidden)
                            "kms:DescribeKey",
                          - "kms:GetKeyPolicy",
                          - "kms:GetKeyRotationStatus",
                          - "kms:ListResourceTags",
                          - "kms:ListAliases",
                        ]
                      ~ Principal = {
                          ~ AWS = [
                                # (1 unchanged element hidden)
                                "arn:aws:iam::502706403852:role/OrganizationAccountAccessRole",
                              + "arn:aws:iam::502706403852:role/SuperAdmins",
                            ]
                        }
                        # (3 unchanged elements hidden)
                    },
                  ~ {
                      ~ Principal = {
                          ~ AWS = [
                              - "arn:aws:iam::502706403852:user/mike.pignataro",
                              - "arn:aws:iam::502706403852:role/SuperAdmins",
                              + "arn:aws:iam::502706403852:role/GitHubIaC",
                                "arn:aws:iam::502706403852:role/OrganizationAccountAccessRole",
                              + "arn:aws:iam::502706403852:role/SuperAdmins",
                            ]
                        }
                        # (5 unchanged elements hidden)
                    },
                ]
                # (2 unchanged elements hidden)
            }
        )
        tags                               = {
            "CostCenter" = "DevOps"
            "Name"       = "DevOpsCryptographyKey"
        }
        # (9 unchanged attributes hidden)
    }

  # aws_s3_bucket_policy.terraform_state will be updated in-place
  ~ resource "aws_s3_bucket_policy" "terraform_state" {
        id     = "orbitmi-master-terraform-state"
      ~ policy = jsonencode(
          ~ {
              ~ Statement = [
                  ~ {
                      ~ Condition = {
                          ~ StringNotEquals = {
                              ~ aws:PrincipalArn = [
                                  - "arn:aws:iam::502706403852:role/OrganizationAccountAccessRole",
                                    "arn:aws:iam::502706403852:role/GitHubIaC",
                                  + "arn:aws:iam::502706403852:role/OrganizationAccountAccessRole",
                                  + "arn:aws:iam::502706403852:role/SuperAdmins",
                                ]
                            }
                          ~ StringNotLike   = {
                              ~ aws:userId = "*:jovica.zlatanovic" -> [
                                  + "*:jovica.zlatanovic",
                                ]
                            }
                        }
                        # (5 unchanged elements hidden)
                    },
                ]
                # (1 unchanged element hidden)
            }
        )
        # (1 unchanged attribute hidden)
    }

Plan: 0 to add, 2 to change, 0 to destroy.
</details>
asdfsadfasd
