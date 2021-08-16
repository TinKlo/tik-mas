
/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/

{{ config(materialized='table') }}

with members_sources as 
(
select 
    _airbyte_data->>'member_id' as member_id
    , _airbyte_data->>'channel_id' as channel_id
    , _airbyte_ab_id as extractor_id
    , _airbyte_emitted_at as emitted_at

from {{ source('raw_slack', '_airbyte_raw_channel_members') }}
)
select * from members_sources


/*
    Uncomment the line below to remove records with null `id` values
*/

