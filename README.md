Summary
-------

This is some quick and dirty code to analyze a text against a dictionary for word frequency.
The original concept was to see how various speakers performed against the 1000 most common words.

Dictionary source:
http://splasho.com/upgoer5/phpspellcheck/dictionaries/1000.dicin

Method: Googled "[candidate] speech transcript" and used first result

Donald Trump speech source:
http://www.p2016.org/photos15/summit/trump012415spt.html

Bernie Sanders speech source:
https://www.washingtonpost.com/news/post-politics/wp/2016/02/10/the-transcript-of-bernie-sanderss-victory-speech/

Hillary Clinton speech source:
http://time.com/3920332/transcript-full-text-hillary-clinton-campaign-launch/

Issues:
------
- it's fairly stupid about conjugation e.g., "do" and "doing", "go" and "going". Whether these should be treated differently is a question.
- Same (but less ambiguous) for plurality
