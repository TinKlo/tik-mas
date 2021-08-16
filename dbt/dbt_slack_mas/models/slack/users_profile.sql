
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
   _airbyte_users_hashid
   , team
   , email
   , phone
   , skype
   , title
   , image_24
   , image_32
   , image_48
   , image_72
   , image_192
   , image_512
   , last_name
   , real_name
   , first_name
   , image_1024
   , avatar_hash
   , status_text
   , display_name
   , status_emoji
   , image_original
   , real_name_normalized
   , display_name_normalized
   , _airbyte_emitted_at, _airbyte_profile_hashid

from {{ source('raw_slack', 'users_profile') }}
)
select * from members_sources


/*
    Uncomment the line below to remove records with null `id` values
*/

