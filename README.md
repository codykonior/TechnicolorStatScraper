# Technicolor VDSL Modem Stat Scraper

On Mac:
```
pip3 install -U -r requirements.txt
brew cask install powershell
```

Please edit the top of settings.py for the IP/Username/Password and test it out:
```
python3 modem-technicolour-httpstats.py
```

If it works then you can begin appending data collection to a CSV every 30 seconds.

```
pwsh -File DataCollection.ps1
```

Ctrl-C to exit.

Sample data:
```
"Date","DSL Status","DSL Uptime","DSL Type","DSL Mode","Maximum Line rate","Line Rate","Data Transferred","Output Power","Line Attenuation","Noise Margin"
"2020-01-20T13:03:35.5726860+08:00","Up","5 hours 24 minutes 23 seconds","VDSL2","Fast","19.34 Mbps 34.98 Mbps","19.01 Mbps 36.18 Mbps","5262.7 MBytes 30774 MBytes","9.4 dBm 14.5 dBm","17.1, 38.9, 54.6 dB 21.5, 46.3, 68.9 dB","6.8 dB 5.6 dB"
"2020-01-20T13:04:07.7872100+08:00","Up","5 hours 24 minutes 55 seconds","VDSL2","Fast","19.34 Mbps 35.18 Mbps","19.01 Mbps 36.18 Mbps","5262.94 MBytes 30774.32 MBytes","9.4 dBm 14.5 dBm","17.1, 38.9, 54.6 dB 21.5, 46.3, 68.9 dB","6.9 dB 5.7 dB"
```
