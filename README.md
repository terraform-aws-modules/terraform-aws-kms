# AWS <TODO_EXPANDED> Terraform module

Terraform module which creates AWS <TODO_EXPANDED> resources.

<!--START--->
## 🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥

After creating a new repository from the template and cloning locally:

```bash
./eject.sh <module-name>
```

Where `<module-name>` can be extracted from the repository name using the pattern `terraform-aws-<module-name>`.

For example, if the repository name is `terraform-aws-s3-bucket`, then the module name is `s3-bucket` and the associated eject command is:

```bash
./eject.sh s3-bucket
```

Note: this message will self destruct upon ejection!

## 🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥
<!---END--->
## Usage

See [`examples`](https://github.com/clowdhaus/terraform-aws-<TODO>/tree/main/examples) directory for working examples to reference:

```hcl
module "<TODO_UNDER>" {
  source = "clowdhaus/<TODO>/aws"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
```

## Examples

Examples codified under the [`examples`](https://github.com/clowdhaus/terraform-aws-<TODO>/tree/main/examples) are intended to give users references for how to use the module(s) as well as testing/validating changes to the source code of the module. If contributing to the project, please be sure to make any appropriate updates to the relevant examples to allow maintainers to test your changes and to keep the examples up to date for users. Thank you!

- [Complete](https://github.com/clowdhaus/terraform-aws-<TODO>/tree/main/examples/complete)

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.0 |

## Providers

No providers.

## Modules

No modules.

## Resources

No resources.

## Inputs

No inputs.

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## License

Apache-2.0 Licensed. See [LICENSE](https://github.com/clowdhaus/terraform-aws-<TODO>/blob/main/LICENSE).
