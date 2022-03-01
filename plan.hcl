[0m
[1m[36mNote:[0m[1m Objects have changed outside of Terraform[0m

[0mTerraform detected the following changes made outside of Terraform since the
last "terraform apply":

[1m  # aws_iam_policy.credentials_selfservice[0m has changed[0m[0m
[0m  [33m~[0m[0m resource "aws_iam_policy" "credentials_selfservice" {
        [1m[0mid[0m[0m          = "arn:aws:iam::502706403852:policy/IamUserCredentialsSelfService"
        [1m[0mname[0m[0m        = "IamUserCredentialsSelfService"
      [33m~[0m [0m[1m[0mpolicy[0m[0m      = jsonencode( [2m# whitespace changes[0m[0m
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
        [1m[0mtags[0m[0m        = {}
        [90m# (5 unchanged attributes hidden)[0m[0m
    }

[1m  # aws_iam_role.this["Auditors"][0m has changed[0m[0m
[0m  [33m~[0m[0m resource "aws_iam_role" "this" {
      [33m~[0m [0m[1m[0massume_role_policy[0m[0m    = jsonencode(
          [33m~[0m [0m{
              [33m~[0m [0mStatement = [
                  [33m~[0m [0m{
                      [33m~[0m [0mPrincipal = {
                          [33m~[0m [0mAWS = [
                              [31m-[0m [0m"arn:aws:iam::336020864752:root",
                                "arn:aws:iam::502706403852:root",
                              [32m+[0m [0m"arn:aws:iam::336020864752:root",
                            ]
                        }
                        [90m# (2 unchanged elements hidden)[0m[0m
                    },
                ]
                [90m# (1 unchanged element hidden)[0m[0m
            }
        )
        [1m[0mid[0m[0m                    = "Auditors"
        [1m[0mname[0m[0m                  = "Auditors"
        [1m[0mtags[0m[0m                  = {}
        [90m# (8 unchanged attributes hidden)[0m[0m

        [90m# (1 unchanged block hidden)[0m[0m
    }

[1m  # aws_iam_role.this["BackendTeam"][0m has changed[0m[0m
[0m  [33m~[0m[0m resource "aws_iam_role" "this" {
        [1m[0mid[0m[0m                    = "BackendTeam"
        [1m[0mname[0m[0m                  = "BackendTeam"
        [1m[0mtags[0m[0m                  = {}
        [90m# (9 unchanged attributes hidden)[0m[0m

      [31m-[0m [0minline_policy {}
      [32m+[0m [0minline_policy {
          [32m+[0m [0m[1m[0mname[0m[0m   = "SSMFullAccess"
          [32m+[0m [0m[1m[0mpolicy[0m[0m = jsonencode(
                {
                  [32m+[0m [0mStatement = [
                      [32m+[0m [0m{
                          [32m+[0m [0mAction   = [
                              [32m+[0m [0m"ssm:PutParameter",
                              [32m+[0m [0m"ssm:DescribeParameters",
                              [32m+[0m [0m"ssm:GetParameterHistory",
                              [32m+[0m [0m"ssm:GetParametersByPath",
                              [32m+[0m [0m"ssm:GetParameters",
                              [32m+[0m [0m"ssm:GetParameter",
                            ]
                          [32m+[0m [0mEffect   = "Allow"
                          [32m+[0m [0mResource = "*"
                          [32m+[0m [0mSid      = "VisualEditor0"
                        },
                    ]
                  [32m+[0m [0mVersion   = "2012-10-17"
                }
            )
        }
    }

[1m  # aws_iam_role.this["FrontendTeam"][0m has changed[0m[0m
[0m  [33m~[0m[0m resource "aws_iam_role" "this" {
        [1m[0mid[0m[0m                    = "FrontendTeam"
        [1m[0mname[0m[0m                  = "FrontendTeam"
        [1m[0mtags[0m[0m                  = {}
        [90m# (9 unchanged attributes hidden)[0m[0m

        [90m# (1 unchanged block hidden)[0m[0m
    }

[1m  # aws_iam_role.this["Observers"][0m has changed[0m[0m
[0m  [33m~[0m[0m resource "aws_iam_role" "this" {
        [1m[0mid[0m[0m                    = "Observers"
        [1m[0mname[0m[0m                  = "Observers"
        [1m[0mtags[0m[0m                  = {}
        [90m# (9 unchanged attributes hidden)[0m[0m

        [90m# (1 unchanged block hidden)[0m[0m
    }

[1m  # aws_iam_role.this["QATeam"][0m has changed[0m[0m
[0m  [33m~[0m[0m resource "aws_iam_role" "this" {
      [33m~[0m [0m[1m[0massume_role_policy[0m[0m    = jsonencode(
          [33m~[0m [0m{
              [33m~[0m [0mStatement = [
                  [33m~[0m [0m{
                      [33m~[0m [0mPrincipal = {
                          [33m~[0m [0mAWS = [
                              [31m-[0m [0m"arn:aws:iam::336020864752:root",
                                "arn:aws:iam::502706403852:root",
                              [32m+[0m [0m"arn:aws:iam::336020864752:root",
                            ]
                        }
                        [90m# (2 unchanged elements hidden)[0m[0m
                    },
                ]
                [90m# (1 unchanged element hidden)[0m[0m
            }
        )
        [1m[0mid[0m[0m                    = "QATeam"
      [33m~[0m [0m[1m[0mmanaged_policy_arns[0m[0m   = [
          [32m+[0m [0m"arn:aws:iam::502706403852:policy/SecretsManagerReadOnly",
            [90m# (3 unchanged elements hidden)[0m[0m
        ]
        [1m[0mname[0m[0m                  = "QATeam"
        [1m[0mtags[0m[0m                  = {}
        [90m# (7 unchanged attributes hidden)[0m[0m

        [90m# (1 unchanged block hidden)[0m[0m
    }

[1m  # aws_iam_role.this["SuperAdmins"][0m has changed[0m[0m
[0m  [33m~[0m[0m resource "aws_iam_role" "this" {
        [1m[0mid[0m[0m                    = "SuperAdmins"
        [1m[0mname[0m[0m                  = "SuperAdmins"
        [1m[0mtags[0m[0m                  = {}
        [90m# (9 unchanged attributes hidden)[0m[0m

        [90m# (1 unchanged block hidden)[0m[0m
    }

[1m  # aws_kms_alias.terraform_state[0m has changed[0m[0m
[0m  [33m~[0m[0m resource "aws_kms_alias" "terraform_state" {
        [1m[0mid[0m[0m             = "alias/devops-cryptography-key-master"
        [1m[0mname[0m[0m           = "alias/devops-cryptography-key-master"
        [90m# (3 unchanged attributes hidden)[0m[0m
    }

[1m  # aws_kms_key.terraform_state[0m has changed[0m[0m
[0m  [33m~[0m[0m resource "aws_kms_key" "terraform_state" {
        [1m[0mid[0m[0m                       = "0a214ab8-2cb7-4aa1-97cd-4db80775dc72"
      [32m+[0m [0m[1m[0mmulti_region[0m[0m             = false
      [33m~[0m [0m[1m[0mpolicy[0m[0m                   = jsonencode(
          [33m~[0m [0m{
              [33m~[0m [0mStatement = [
                    [90m# (1 unchanged element hidden)[0m[0m
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
                  [33m~[0m [0m{
                      [33m~[0m [0mAction    = [
                            [90m# (4 unchanged elements hidden)[0m[0m
                            "kms:DescribeKey",
                          [32m+[0m [0m"kms:GetKeyPolicy",
                          [32m+[0m [0m"kms:GetKeyRotationStatus",
                          [32m+[0m [0m"kms:ListResourceTags",
                          [32m+[0m [0m"kms:ListAliases",
                        ]
                      [33m~[0m [0mPrincipal = {
                          [33m~[0m [0mAWS = [
                              [31m-[0m [0m"arn:aws:iam::502706403852:user/mike.pignataro",
                              [31m-[0m [0m"arn:aws:iam::502706403852:role/SuperAdmins",
                              [32m+[0m [0m"arn:aws:iam::502706403852:role/GitHubIaC",
                                "arn:aws:iam::502706403852:role/OrganizationAccountAccessRole",
                            ]
                        }
                        [90m# (3 unchanged elements hidden)[0m[0m
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
                [90m# (2 unchanged elements hidden)[0m[0m
            }
        )
        [1m[0mtags[0m[0m                     = {
            "CostCenter" = "DevOps"
            "Name"       = "DevOpsCryptographyKey"
        }
        [90m# (8 unchanged attributes hidden)[0m[0m
    }

[1m  # aws_s3_bucket_policy.terraform_state[0m has changed[0m[0m
[0m  [33m~[0m[0m resource "aws_s3_bucket_policy" "terraform_state" {
        [1m[0mid[0m[0m     = "orbitmi-master-terraform-state"
      [33m~[0m [0m[1m[0mpolicy[0m[0m = jsonencode(
          [33m~[0m [0m{
              [33m~[0m [0mStatement = [
                  [33m~[0m [0m{
                      [33m~[0m [0mCondition = {
                          [33m~[0m [0mStringNotEquals = {
                              [33m~[0m [0maws:PrincipalArn = [
                                  [31m-[0m [0m"arn:aws:iam::502706403852:user/mike.pignataro",
                                    "arn:aws:iam::502706403852:role/OrganizationAccountAccessRole",
                                  [31m-[0m [0m"arn:aws:iam::502706403852:role/SuperAdmins",
                                  [32m+[0m [0m"arn:aws:iam::502706403852:role/GitHubIaC",
                                ]
                            }
                          [32m+[0m [0mStringNotLike   = {
                              [32m+[0m [0maws:userId = "*:jovica.zlatanovic"
                            }
                        }
                        [90m# (5 unchanged elements hidden)[0m[0m
                    },
                ]
                [90m# (1 unchanged element hidden)[0m[0m
            }
        )
        [90m# (1 unchanged attribute hidden)[0m[0m
    }


Unless you have made equivalent changes to your configuration, or ignored the
relevant attributes using ignore_changes, the following plan may include
actions to undo or respond to these changes.
[90m
─────────────────────────────────────────────────────────────────────────────[0m

Terraform used the selected providers to generate the following execution
plan. Resource actions are indicated with the following symbols:
  [33m~[0m update in-place
[0m
Terraform will perform the following actions:

[1m  # aws_kms_key.terraform_state[0m will be updated in-place[0m[0m
[0m  [33m~[0m[0m resource "aws_kms_key" "terraform_state" {
      [32m+[0m [0m[1m[0mbypass_policy_lockout_safety_check[0m[0m = false
        [1m[0mid[0m[0m                                 = "0a214ab8-2cb7-4aa1-97cd-4db80775dc72"
      [33m~[0m [0m[1m[0mpolicy[0m[0m                             = jsonencode(
          [33m~[0m [0m{
              [33m~[0m [0mStatement = [
                    {
                        Action    = "kms:*"
                        Effect    = "Allow"
                        Principal = {
                            AWS = "arn:aws:iam::502706403852:root"
                        }
                        Resource  = "*"
                        Sid       = "Enable IAM User Permissions"
                    },
                  [33m~[0m [0m{
                      [33m~[0m [0mPrincipal = {
                          [33m~[0m [0mAWS = [
                              [31m-[0m [0m"arn:aws:iam::502706403852:user/mike.pignataro",
                              [31m-[0m [0m"arn:aws:iam::502706403852:role/SuperAdmins",
                              [32m+[0m [0m"arn:aws:iam::502706403852:role/GitHubIaC",
                                "arn:aws:iam::502706403852:role/OrganizationAccountAccessRole",
                              [32m+[0m [0m"arn:aws:iam::502706403852:role/SuperAdmins",
                            ]
                        }
                        [90m# (4 unchanged elements hidden)[0m[0m
                    },
                  [33m~[0m [0m{
                      [33m~[0m [0mAction    = [
                            [90m# (4 unchanged elements hidden)[0m[0m
                            "kms:DescribeKey",
                          [31m-[0m [0m"kms:GetKeyPolicy",
                          [31m-[0m [0m"kms:GetKeyRotationStatus",
                          [31m-[0m [0m"kms:ListResourceTags",
                          [31m-[0m [0m"kms:ListAliases",
                        ]
                      [33m~[0m [0mPrincipal = {
                          [33m~[0m [0mAWS = [
                                [90m# (1 unchanged element hidden)[0m[0m
                                "arn:aws:iam::502706403852:role/OrganizationAccountAccessRole",
                              [32m+[0m [0m"arn:aws:iam::502706403852:role/SuperAdmins",
                            ]
                        }
                        [90m# (3 unchanged elements hidden)[0m[0m
                    },
                  [33m~[0m [0m{
                      [33m~[0m [0mPrincipal = {
                          [33m~[0m [0mAWS = [
                              [31m-[0m [0m"arn:aws:iam::502706403852:user/mike.pignataro",
                              [31m-[0m [0m"arn:aws:iam::502706403852:role/SuperAdmins",
                              [32m+[0m [0m"arn:aws:iam::502706403852:role/GitHubIaC",
                                "arn:aws:iam::502706403852:role/OrganizationAccountAccessRole",
                              [32m+[0m [0m"arn:aws:iam::502706403852:role/SuperAdmins",
                            ]
                        }
                        [90m# (5 unchanged elements hidden)[0m[0m
                    },
                ]
                [90m# (2 unchanged elements hidden)[0m[0m
            }
        )
        [1m[0mtags[0m[0m                               = {
            "CostCenter" = "DevOps"
            "Name"       = "DevOpsCryptographyKey"
        }
        [90m# (9 unchanged attributes hidden)[0m[0m
    }

[1m  # aws_s3_bucket_policy.terraform_state[0m will be updated in-place[0m[0m
[0m  [33m~[0m[0m resource "aws_s3_bucket_policy" "terraform_state" {
        [1m[0mid[0m[0m     = "orbitmi-master-terraform-state"
      [33m~[0m [0m[1m[0mpolicy[0m[0m = jsonencode(
          [33m~[0m [0m{
              [33m~[0m [0mStatement = [
                  [33m~[0m [0m{
                      [33m~[0m [0mCondition = {
                          [33m~[0m [0mStringNotEquals = {
                              [33m~[0m [0maws:PrincipalArn = [
                                  [31m-[0m [0m"arn:aws:iam::502706403852:role/OrganizationAccountAccessRole",
                                    "arn:aws:iam::502706403852:role/GitHubIaC",
                                  [32m+[0m [0m"arn:aws:iam::502706403852:role/OrganizationAccountAccessRole",
                                  [32m+[0m [0m"arn:aws:iam::502706403852:role/SuperAdmins",
                                ]
                            }
                          [33m~[0m [0mStringNotLike   = {
                              [33m~[0m [0maws:userId = "*:jovica.zlatanovic" [33m->[0m [0m[
                                  [32m+[0m [0m"*:jovica.zlatanovic",
                                ]
                            }
                        }
                        [90m# (5 unchanged elements hidden)[0m[0m
                    },
                ]
                [90m# (1 unchanged element hidden)[0m[0m
            }
        )
        [90m# (1 unchanged attribute hidden)[0m[0m
    }

[0m[1mPlan:[0m 0 to add, 2 to change, 0 to destroy.
[0m
