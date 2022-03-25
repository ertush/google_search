###################################################################
## Search Engines APIs
###################################################################

# Search-Google

function Search-Google {

<#
.SYNOPSIS
 Search from powershell console
.DESCRIPTION
 Parse google searches on powershell commandline. 
.FUNCTIONALITY
 Search-google <search string> <browser> <browser options> 
.EXAMPLE
 Search-google 'the Tallest Mountain in the world' chrome
     
 PS > Search-google "guinnes book of record 2019" msedge
      
 PS > Search-google COVID-19 chrome $true ; where '$true' is endabling incongito mode in brave or chrome browsers
 .NOTES
 Currently this version of the script module only supports the following browsers in incognito:
 * brave
 * chrome
 Future versions of the script modules will support incognito version for all browers

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
          [System.Diagnostics.Process] $proc_object;
     }
     process {
 
          if ( -not $($browser -eq "")) {
               if ($browser -eq "msedge") {
                     $proc_object = Start-Process -PassThru microsoft-edge:https://www.google.com/search?q=$parsed_string
               }

               if ($isIncognito) {
                    $proc_object = Start-Process -PassThru $browser -ArgumentList @("https://www.google.com/search?q="+$parsed_string, "-incognito")
               }

               if($browser -ne "msedge" -and -not $isIncognito){
                    $proc_object = Start-Process -PassThru $browser https://www.google.com/search?q=$parsed_string
              }
               
          }
     }
     end {
          return $proc_object;
     }

}

# Search-DuckDuckGo

function Search-DuckDuckGo {

<#
.SYNOPSIS
 Search from powershell console
.DESCRIPTION
 Parse duckduckgo searches on powershell commandline
 
 Currently this version of the script module only supports the following browsers in incognito:
 * brave
 * chrome
 Future versions of the script modules will support incognito version for all browers
.FUNCTIONALITY
 Search-DuckDuckGo <search string> <browser> <browser options> 
.EXAMPLE
 Search-DuckDuckGo 'the Tallest Mountain in the world' chrome
     
 PS >  Search-DuckDuckGo "guinnes book of record 2019" msedge
      
 PS >  Search-DuckDuckGo COVID-19 chrome $true ; where '$true' is endabling incongito mode in brave or chrome browsers
 .NOTES
 Currently this version of the script module only supports the following browsers in incognito:
 * brave
 * chrome
 Future versions of the script modules will support incognito version for all browers
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
          $ErrorActionPreference = 'SilentlyContinue';
          [System.Diagnostics.Process] $proc_object;
     }
     process {
 
          if ( -not $($browser -eq "")) {
               
               if ($browser -eq "msedge") {
                     $proc_object = Start-Process -PassThru microsoft-edge:https://duckduckgo.com/?q=$parsed_string
               }

               if ($isIncognito) {
                    $proc_object = Start-Process -PassThru $browser -ArgumentList @("https://duckduckgo.com/?q="+$parsed_string, "-incognito")
               }

               if($browser -ne "msedge" -and -not $isIncognito){
                    $proc_object = Start-Process -PassThru $browser https://duckduckgo.com/?q=$parsed_string
              }
               
          }
     }
     end {
          return $proc_object;
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
     .NOTES
      Currently this version of the script module only supports the following browsers in incognito:
      * brave
      * chrome
      Future versions of the script modules will support incognito version for all browers

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
               $ErrorActionPreference = 'SilentlyContinue';
               [System.Diagnostics.Process] $proc_object;
          }
          process {
      
               if ( -not $($browser -eq "")) {
                  
                    if ($browser -eq "msedge") {
                          $proc_object = Start-Process -PassThru microsoft-edge:https://www.bing.com/search?q=$parsed_string
                    }

                    if ($isIncognito) {
                         $proc_object = Start-Process -PassThru $browser -ArgumentList @("https://www.bing.com/search?q="+$parsed_string, "-incognito")
                    }

                    if ($browser -ne "msedge" -and -not $isIncognito){
                          $proc_object = Start-Process -PassThru $browser https://www.bing.com/search?q=$parsed_string
                    }
               }
          }
          end {
               return $proc_object;
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
.NOTES
Currently this version of the script module only supports the following browsers in incognito:
* brave
* chrome
Future versions of the script modules will support incognito version for all browers

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
          $ErrorActionPreference = 'SilentlyContinue';
          [System.Diagnostics.Process] $proc_object;
     }
     process {

          if (-not $($url -eq "")) {
               
               if ($browser -eq "msedge") {
                     $proc_object = Start-Process -PassThru microsoft-edge:$url
               }

               if ($isIncognito){
                    $proc_object =  Start-Process -PassThru $browser -ArgumentList @($url, "-incognito")
                }
               
               if ($browser -ne "msedge" -and -not $isIncognito){
                    $proc_object = Start-Process -PassThru $browser $url 
               }
             
          }
     }
     end {
          return $proc_object;
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
     .NOTES
     Currently this version of the script module only supports the following browsers in incognito:
     * brave
     * chrome
     Future versions of the script modules will support incognito version for all browers
     
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
               $parsed_query = $query.replace(' ', '+');
               $ErrorActionPreference = 'SilentlyContinue'
               [System.Diagnostics.Process] $proc_object;
          }
          process {
     
               if (-not $($query -eq "")) {

                    
                         
                    if ($isIncognito){
                         $proc_object = Open-Site https://youtube.com/results?search_query=$parsed_query $browser -isIncognito
                         
                    }
                    else 
                    {
                         $proc_object = Open-Site https://youtube.com/results?search_query=$parsed_query $browser     
                    }
          
               }
          }
          end {
               return $proc_object;
          }
     
}

# Search using Google Dorks

function Search-Dorks {
     
     <#
     .SYNOPSIS
      Search using google dorks from powershell. Supports Powershell:^5
     .DESCRIPTION
      Parse search query from powershell commandline to open in browser of choice
     .FUNCTIONALITY
      Search-Dorks <search query> <browser>
     .EXAMPLE
      Search-Dorks "Latest Hiphop 2020" msedge

      PS > Search-Dork movies 2022 chrome
     .NOTES
     Currently this version of the script module only supports the following browsers in incognito:
     * brave
     * chrome
     Future versions of the script modules will support incognito version for all browers
     
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
           $parsed_query = $query.replace(' ', '+');
           $ErrorActionPreference = 'SilentlyContinue'
           [System.Diagnostics.Process] $proc_object;
      }
      process {
 
           if (-not $($query -eq "")) {

                
                     
                if ($isIncognito){
                     $proc_object = Search-Google "intitle:index of `'" + $parsed_query + "`' " $browser -isIncognito
                     
                }
                else 
                {
                     $proc_object = Search-Google "intitle:index of `'" + $parsed_query + "`' " $browser $browser     
                }
      
           }
      }
      end {
           return $proc_object;
      }
}

     Export-ModuleMember -Function @("Search-Google", 
                                    "Search-Youtube", 
                                    "Search-Bing", 
                                    "Search-DuckDuckGo",
                                    "Open-Site",
                                    "Search-Dorks")

     Export-ModuleMember -Variable @("browser", "searchString", "isIncognito")