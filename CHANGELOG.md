# Changelog

All notable changes to this project will be documented in this file.

## [1.1.0](https://github.com/terraform-aws-modules/terraform-aws-kms/compare/v1.0.3...v1.1.0) (2022-08-17)


### Features

* Add support for providing aliases using computed attributes ([#4](https://github.com/terraform-aws-modules/terraform-aws-kms/issues/4)) ([8150812](https://github.com/terraform-aws-modules/terraform-aws-kms/commit/81508121e16b9da133259763cca1fe98485a38b7))

### [1.0.3](https://github.com/terraform-aws-modules/terraform-aws-kms/compare/v1.0.2...v1.0.3) (2022-08-15)


### Bug Fixes

* Add support for aliases and grants on `aws_kms_external_key` ([#3](https://github.com/terraform-aws-modules/terraform-aws-kms/issues/3)) ([beea8d6](https://github.com/terraform-aws-modules/terraform-aws-kms/commit/beea8d64e3680978785b1b0a93911c5d602f98fe))

### [1.0.2](https://github.com/terraform-aws-modules/terraform-aws-kms/compare/v1.0.1...v1.0.2) (2022-07-14)


### Bug Fixes

* Correct boolean logic for enabling/disabling key owners policy statement ([#2](https://github.com/terraform-aws-modules/terraform-aws-kms/issues/2)) ([944ea72](https://github.com/terraform-aws-modules/terraform-aws-kms/commit/944ea72ac38f85af0a58f10650285958e78cac0c))

### [1.0.1](https://github.com/terraform-aws-modules/terraform-aws-kms/compare/v1.0.0...v1.0.1) (2022-06-28)


### Bug Fixes

* Reduce required versions for Terraform and AWS provider ([#1](https://github.com/terraform-aws-modules/terraform-aws-kms/issues/1)) ([f80bc66](https://github.com/terraform-aws-modules/terraform-aws-kms/commit/f80bc665e11d7aabacc8be397e782a1dcc1e1148))

## 1.0.0 (2022-06-25)


### Features

* Add support for external key using externally provided material ([2726c25](https://github.com/clowdhaus/terraform-aws-kms/commit/2726c2517fb203b6c3cf3b6e5cec00442336d88e))
* Add support for source and override policy documents ([5a01134](https://github.com/clowdhaus/terraform-aws-kms/commit/5a01134f4358e55cd2b65bfd1a1b6d8c91988dc1))
* Initial implementation of module ([a8a4f33](https://github.com/clowdhaus/terraform-aws-kms/commit/a8a4f33b95320b1d7457cefef3759f3544498f23))
