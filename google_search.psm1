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
      
 PS > Search-google COVID-19 chrome $true ; where '$true' is endabling incongito mode
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

               if ($browser -eq "firefox") {
                    Start-Process firefox $url
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