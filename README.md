# ManageIQ CLI Role Management Tool

## Installation

'bundle install' to install the needed gems

## Usage

Assigning a feature to a role:
'''
ruby miq-cli-role-management.rb -u <username> -p <password> --url <url to api of miq> -a assign_feature -r EvmRole-user physical_infra_overview_view
'''

Unassigning a feature to a role:
'''
ruby miq-cli-role-management.rb -u <username> -p <password> --url <url to api of miq> -a unassign_feature -r EvmRole-user physical_infra_overview_view
'''

## Development

## Contributing

## License
