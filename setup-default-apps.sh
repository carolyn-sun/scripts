#!/bin/bash

# default apps
## set default text editor
duti -s com.microsoft.VSCode public.plain-text all
duti -s com.microsoft.VSCode public.data all
duti -s com.microsoft.VSCode .md all
duti -s com.microsoft.VSCode .conf all
duti -s com.microsoft.VSCode .log all
duti -s com.microsoft.VSCode .vtt all
duti -s com.microsoft.VSCode .xml all
duti -s com.microsoft.VSCode .html all
duti -s com.microsoft.VSCode .css all
duti -s com.microsoft.VSCode .js all
duti -s com.microsoft.VSCode .ts all
duti -s com.microsoft.VSCode .jsx all
duti -s com.microsoft.VSCode .tsx all
duti -s com.microsoft.VSCode .py all
duti -s com.microsoft.VSCode .yml all
duti -s com.microsoft.VSCode .yaml all
duti -s com.microsoft.VSCode public.xml all
duti -s com.microsoft.VSCode public.json all
duti -s com.microsoft.VSCode public.yaml all
duti -s com.microsoft.VSCode public.csv all
duti -s com.microsoft.VSCode public.source-code all
## set default archive utility
duti -s com.aone.keka public.zip-archive all
duti -s com.aone.keka com.rarlab.rar-archive all
duti -s com.aone.keka org.7-zip.7-zip-archive all
duti -s com.aone.keka public.tar-archive all
duti -s com.aone.keka org.gnu.gnu-zip-archive all