# Extracting data
Use the WaniKani API to query all subjects.

`https://api.wanikani.com/v2/subjects?types=kanji&levels=1`.

Trim it using the following JMESPath query on https://jsonformatter.org/json-editor.

`{data: data[].data.[{characters: characters, meanings: meanings, readings: readings}]}`