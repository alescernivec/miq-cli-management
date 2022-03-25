# ManageIQ CLI Role Management Tool

This ruby script offers human-friendly command line tool wrapping `manageiq-api-client` library. It allows 
 * easier management of ManageIQ roles and features
 * easy to extend with additional capabilities

## Installation

`bundle install` to install the needed gems

Tested with Ruby 2.7.

## Usage

```
Usage: /home/ales/workspace/kyndryl-cisco/miq-cli-management/miq-cli-role-management.rb --username username --password password --url url --action create_role [arguments]
    -u, --username USERNAME          [Mandatory] ManageIQ username
    -p, --password PASSWORD          [Mandatory] ManageIQ password
        --url URL                    [Mandatory] URL to the ManageIQ API
    -a, --action ACTION              [Mandatory] Action to take (assign, unnassign
    -r, --role ROLE
    -f, --feature FEATURE
```
### Examples

Assigning a feature to a role:
```
ruby miq-cli-role-management.rb -u <username> -p <password> --url <url to api of miq> -a assign_feature -r EvmRole-user physical_infra_overview_view
```

Unassigning a feature to a role:

```
ruby miq-cli-role-management.rb -u <username> -p <password> --url <url to api of miq> -a unassign_feature -r EvmRole-user physical_infra_overview_view
```

## Development

## Contributing



## License
