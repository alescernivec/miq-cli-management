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
    -a, --action ACTION              [Mandatory] Action. Must be one of ["assign_feature", "unassign_feature", "list_role", "create_role"] 
    -r, --role ROLE
    -f, --feature FEATURE
```
### Examples

Creating new role:
```
ruby miq-cli-role-management.rb -u <username> -p <password> --url <url to api of miq> -a create_role <role name>
```

Assigning a feature to a role:
```
ruby miq-cli-role-management.rb -u <username> -p <password> --url <url to api of miq> -a assign_feature -r EvmRole-user physical_infra_overview_view
```

Unassigning a feature to a role:
```
ruby miq-cli-role-management.rb -u <username> -p <password> --url <url to api of miq> -a unassign_feature -r EvmRole-user physical_infra_overview_view
```

## Development

Best to set up environment using `rvm` with a specific `gemset`, then use `bundle install` within the `gemset`. 

## Contributing

Accepting PRs. Thank you!

## License

Apache 2.0 