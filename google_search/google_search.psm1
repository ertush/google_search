###################################################################
## Search Engines APIs
###################################################################

# Search-Google

function Search-Google {

<#
.SYNOPSIS
 Search from powershell console
.DESCRIPTION
 Parse google searches on powershell commandline
.FUNCTIONALITY
 Search-google <search string> <browser> <browser options> 
.EXAMPLE
 Search-google 'the Tallest Mountain in the world' chrome
     
 PS > Search-google "guinnes book of record 2019" msedge
      
 PS > Search-google COVID-19 chrome $true ; where '$true' is endabling incongito mode in brave or chrome browsers
#>

     [CmdletBinding()]

     Param(
          [parameter(mandatory = $true, position = 1)]
          [string]
          $searchString,

          [parameter(mandatory = $true, position = 2)]
          [string]
          $browser,
     
          [parameter(position = 3)]
          [switch]
          $isIncognito
          
          
     
     )

     begin {
          $parsed_string = $searchString.replace(' ', '+');
          $ErrorActionPreference = 'SilentlyContinue'
     }
     process {
 
          if ( -not $($browser -eq "")) {
               if ($browser -eq "brave") {
                    Start-Process brave https://www.google.com/search?q=$parsed_string
               }

               if ($browser -eq "msedge") {
                    Start-Process microsoft-edge:https://www.google.com/search?q=$parsed_string
               }

               if($browser -eq "firefox"){
                    Start-Process firefox https://www.google.com/search?q=$parsed_string
               }

               if ($isIncognito) {

                    cmd /c start $browser  https://www.google.com/search?q=$parsed_string -incognito

               }

               Start-Process $browser https://www.google.com/search?q=$parsed_string 
               
          }
     }
     end {
     
     }

}

# Search-DuckDuckGo

function Search-DuckDuckGo {

<#
.SYNOPSIS
 Search from powershell console
.DESCRIPTION
 Parse duckduckgo searches on powershell commandline
.FUNCTIONALITY
 Search-DuckDuckGo <search string> <browser> <browser options> 
.EXAMPLE
 Search-DuckDuckGo 'the Tallest Mountain in the world' chrome
     
 PS >  Search-DuckDuckGo "guinnes book of record 2019" msedge
      
 PS >  Search-DuckDuckGo COVID-19 chrome $true ; where '$true' is endabling incongito mode in brave or chrome browsers
#>

     [CmdletBinding()]

     Param(
          [parameter(mandatory = $true, position = 1)]
          [string]
          $searchString,

          [parameter(mandatory = $true, position = 2)]
          [string]
          $browser,
     
          [parameter(position = 3)]
          [switch]
          $isIncognito
          
          
     
     )

     begin {
          $parsed_string = $searchString.replace(' ', '+');
          $ErrorActionPreference = 'SilentlyContinue'
     }
     process {
 
          if ( -not $($browser -eq "")) {
               if ($browser -eq "brave") {
                    Start-Process brave https://duckduckgo.com/?q=$parsed_string
               }

               if ($browser -eq "msedge") {
                    Start-Process microsoft-edge:https://duckduckgo.com/?q=$parsed_string
               }

               if($browser -eq "firefox"){
                    Start-Process firefox https://duckduckgo.com/?q=$parsed_string
               }

               if ($isIncognito) {

                    cmd /c start $browser  https://duckduckgo.com/?q=$parsed_string -incognito

               }

               Start-Process $browser https://duckduckgo.com/?q=$parsed_string 
               
          }
     }
     end {
     
     }

}

# Search-Bing

function Search-Bing {

     <#
     .SYNOPSIS
      Search from powershell console
     .DESCRIPTION
      Parse Microsoft Bing searches on powershell commandline
     .FUNCTIONALITY
      Search-Bing <search string> <browser> <browser options> 
     .EXAMPLE
      Search-Bing 'the Tallest Mountain in the world' chrome
          
      PS >  Search-Bing "guinnes book of record 2019" msedge
           
      PS >  Search-Bing COVID-19 chrome $true ; where '$true' is endabling incongito mode in brave or chrome browsers
     #>
     
          [CmdletBinding()]
     
          Param(
               [parameter(mandatory = $true, position = 1)]
               [string]
               $searchString,
     
               [parameter(mandatory = $true, position = 2)]
               [string]
               $browser,
          
               [parameter(position = 3)]
               [switch]
               $isIncognito
               
               
          
          )
     
          begin {
               $parsed_string = $searchString.replace(' ', '+');
               $ErrorActionPreference = 'SilentlyContinue'
          }
          process {
      
               if ( -not $($browser -eq "")) {
                    if ($browser -eq "brave") {
                         Start-Process brave https://www.bing.com/search?q=$parsed_string
                    }
     
                    if ($browser -eq "msedge") {
                         Start-Process microsoft-edge:https://www.bing.com/search?q=$parsed_string
                    }
     
                    if($browser -eq "firefox"){
                         Start-Process firefox https://www.bing.com/search?q=$parsed_string
                    }
     
                    if ($isIncognito) {
     
                         cmd /c start $browser  https://www.bing.com/search?q=$parsed_string -incognito
     
                    }
     
                    Start-Process $browser https://www.bing.com/search?q=$parsed_string 
                    
               }
          }
          end {
          
          }
     
     }
     
###################################################################
## Other Search Engine Utility APIs
###################################################################

function Open-Site {

<#
.SYNOPSIS
Open sites from powershell console. Supports Powershell:^5
.DESCRIPTION
Parse google urls on powershell commandline to open them
.FUNCTIONALITY
Open-Site <url> <browser> <browser options> 
.EXAMPLE
Open-Site https://thebestwebsite.com/home chrome

PS > Open-Site https://save-the-planet.org microsoft-edge
#>

     [CmdletBinding()]

     Param(
          [parameter(mandatory = $true, position = 1)]
          [string]
          $url,

          [parameter(mandatory = $true, position = 2)]
          [string]
          $browser,

          [parameter(position = 3)]
          [switch]
          $isIncognito
     )

     begin {
          $ErrorActionPreference = 'SilentlyContinue'
     }
     process {

          if (-not $($url -eq "")) {

               if ($browser -eq "brave") {
                    Start-Process brave $url
               }
              
               if ($browser -eq "msedge") {
                    Start-Process microsoft-edge:$url
               }
               else{
                    if ($isIncognito){
                         cmd /c start $browser $url -incognito
                    }
                    else{
                         Start-Process $browser $url 
                    }

               }
               

     
          }
     }
     end {

     }

}

function Search-Youtube {

     <#
     .SYNOPSIS
      Search youtube from powershell. Supports Powershell:^5
     .DESCRIPTION
      Parse youtube search query from powershell commandline to open in browser of choice
     .FUNCTIONALITY
      Search-Youtube <search query> <browser>
     .EXAMPLE
      Search-Youtube "Latest Hiphop 2020" msedge

      PS > Search-Youtube Live chrome
     
     #>
     
          [CmdletBinding()]
     
          Param(
               [parameter(mandatory = $true, position = 1)]
               [string]
               $query,
     
               [parameter(mandatory = $true, position = 2)]
               [string]
               $browser,
     
               [parameter(position = 3)]
               [switch]
               $isIncognito
          )
     
          begin {
               $ErrorActionPreference = 'SilentlyContinue'
          }
          process {
     
               if (-not $($query -eq "")) {

                    if ($browser -eq "brave") {
                         Open-Site https://youtube.com/results?search_query=$query brave
                    }
                   
                    if ($browser -eq "firefox") {
                         Open-Site https://youtube.com/results?search_query=$query firefox
                    }

                    if ($browser -eq "msedge") {
                         Open-Site https://youtube.com/results?search_query=$query msedge
                    }
                    else{
                         if ($isIncognito){
                              Open-Site https://youtube.com/results?search_query=$query $browser -incognito
                         }
                         else{
                              Open-Site https://youtube.com/results?search_query=$query $browser
                         }
     
                    }
                    
     
          
               }
          }
          end {
     
          }
     
     }