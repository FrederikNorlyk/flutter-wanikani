# Extracting data
Use the WaniKani API to query all subjects.

`https://api.wanikani.com/v2/subjects?types=kanji&levels=1`.

Trim it using the following JMESPath query on https://play.jmespath.org/.

`{data: data[].data.[{characters: characters, meanings: meanings, readings: readings}]}`