{{ config(materialized='table') }}

with messages_sources as 
(
select 
    _airbyte_data->>'team' as team
    , _airbyte_data->>'text' as text
    , _airbyte_data->>'user' as user
    , _airbyte_ab_id as extractor_id
from _airbyte_raw_channel_messages)

select * from messages_sources
