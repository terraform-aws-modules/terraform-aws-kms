# Changelog

All notable changes to this project will be documented in this file.

## [1.3.0](https://github.com/terraform-aws-modules/terraform-aws-kms/compare/v1.2.2...v1.3.0) (2022-11-21)


### Features

* Add support for creating customer managed keys used for Route53 DNSSEC signing ([#10](https://github.com/terraform-aws-modules/terraform-aws-kms/issues/10)) ([d694450](https://github.com/terraform-aws-modules/terraform-aws-kms/commit/d6944500aa33aafa19027facb1828ed3cf837196))

### [1.2.2](https://github.com/terraform-aws-modules/terraform-aws-kms/compare/v1.2.1...v1.2.2) (2022-11-07)


### Bug Fixes

* Update CI configuration files to use latest version ([#8](https://github.com/terraform-aws-modules/terraform-aws-kms/issues/8)) ([01bd36b](https://github.com/terraform-aws-modules/terraform-aws-kms/commit/01bd36b2a07830fe91184c69f3e70c975a1fdd62))

### [1.2.1](https://github.com/terraform-aws-modules/terraform-aws-kms/compare/v1.2.0...v1.2.1) (2022-10-14)


### Bug Fixes

* Modify `key_service_principals` to be generic to support conditions for confused deputy problem ([#7](https://github.com/terraform-aws-modules/terraform-aws-kms/issues/7)) ([7b85239](https://github.com/terraform-aws-modules/terraform-aws-kms/commit/7b85239466b365c31d7e976f82964789d4215c0e))

## [1.2.0](https://github.com/terraform-aws-modules/terraform-aws-kms/compare/v1.1.0...v1.2.0) (2022-10-14)


### Features

* Adding Key Service Principals ([#6](https://github.com/terraform-aws-modules/terraform-aws-kms/issues/6)) ([4841f28](https://github.com/terraform-aws-modules/terraform-aws-kms/commit/4841f28bc1366a789df97f022b42881d5d73421d))

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
