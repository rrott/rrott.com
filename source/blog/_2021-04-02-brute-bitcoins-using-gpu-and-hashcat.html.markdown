# Brute Bitcoins on GPU using Hashcat.

## Cast
0. Dataset and tools
1. Brute strings using hashcat
2. Brute cyryllyc strings using hashcat
3. Brute unicode using hashcat
4. Brute emoji using heshcat
5. Brute ₿ using hashcat


### 0. Dataset and tools

### 1. Brute ansi strings using hashcat


### 2. Brute cyryllyc strings using hashcat

We know that the dataset is downloaded from a ukrainian website(this one), so lets assume that some hashes may have ukrainian letters

The naїv way is just provide list of cyryllics as a charsets and run command like this:

```bash
$ hashcat -m "абвгґдеєжзіїйклмнопрстуфхцчшщьюя" /
```
It looks good, brutes hashes and we are getting some results, but if you check the output you'll see that the speed of bruting was decreased dramatticly and for brutting 4 chars length password in ukrainian charset we spend almost the same time as for bruting 10 chars-length latin chars. 

the second approach is to create dictionary with the desired symbols and brute combyning dicts. It works a bit faster, but...


In first ... it seems okay-ish, but if we assume that the hash file can consist passwords made from ukrainina passports ids, that is as simple as 2 letters and 10 digits, or from car plates - 4 letters and 4 digits(in most cases) you'll see that the brute time is hours, instead of minutes in case of latin letters. 

Looks strange but the isse is in hashcat's way to use GPU. In short words it brutes only ascii symbols . Detailed info is on their website.

So Cyryllic and all other non-ascii symbols are 16bits and we are scruwed. But there is a workaround - we can skip some combinations that miningless or out of our alphabet.


To make things easyer, I've wrote a simple ruby script, that will generate charsets for a selected alphabet or part of it:



### 3. Brute unicode using hashcat

So what about unicode? It's absolutely the same. Ewerything that is out of ascii table makes us brute more.
And the workarounds are the same as for cyryllics. But the thing is a little bit worse as UTF-8 is 16bit, UTF-32 is 32bit and suddly, brutting ß is not the same as brutting ç symbols.

### 4. Brute emoji using heshcat
Ok. What about emojies? The same, except the 

### Brute ₿ using hashcat
And finnal question is how to brute ₿? 
The letter B with two vertical strokes, used to represent Bitcoin. This character was approved in 2017 as a Unicode character, but not as an emoji. No platforms display this as an emoji.

Bitcoin Sign was approved as part of Unicode 10.0 in 2017.

it's 	U+20BF - This Unicode character has no emoji version, meaning we have 16bits per char
But the more bitcoins you need to brute, the more GPU is used and if the wery first bitcoin was bruted during several seconds, brutting 8 or more bitcoins can take weeks...