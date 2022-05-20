
# Change Log
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/)
and this project adheres to [Semantic Versioning](http://semver.org/).


## [2.0.0] - 2022-05-10

Here we have merged both ECR private and public module to one.

### Added

- ECR public sub-module
- minimum and complete examples
- `CHANGELOG.md` file
- `CODEOWNERS` file
- PR template file
- README footers
- Makefile to test examples.

### Changed

- ECR private module to sub-module
- Terraform file to versions file
- Testing terraform binary to version `0.14.11`

### Fixed

- `pre-commit.yml` file
- `pre-commit-config.yaml` file

## [1.0.2] - 2022-05-06

### Fixed

- `.gitignore` file

## [1.0.0] - 2022-03-08

### Added

- Added code for ECR private repository
- Replication configuration resource
- Scanning configuration resource
- Registry and lifecycle policies.
- Initial commit