BeforeAll{
    # If the module is already in memory, remove it
    Get-Module google_search | Remove-Module -Force
     
    # Import the module from the local path, not from the users Documents folder
    import-module .\google_search.psm1 -Force
            
    }
    
    Describe "Google_search::Open-Site Test" {
    
        Context "Invoked without Incognito" {
            
        BeforeAll{
            # Mock Open-Site
            Mock -ModuleName google_search  Open-Site {} -ParameterFilter {
                $browser -and $searchString
            }
    
            $browser = "chrome"
            $searchString = "android 11"
           
            $process = Open-Site $searchString $browser
            }
    
            It "Test should start chrome process ✔" {
             Should -InvokeVerifiable
             $process.Name | Should -Be $browser 
            }
    
            It "Test should launch as Normal ✔" {
                $process.StartInfo.Arguments | Should -Be $searchString   
            }
    
            It "Test should be spawned from a valid directory ✔" {
                $process.StartInfo.WorkingDirectory | Should -Be $(Get-Location).Path
            }
    
            It "Test should expect process to be using shell ✔" {
                $process.StartInfo.UseShellExecute | Should -Be $true
            }

            AfterAll{
                # Clean Up
                Write-Verbose -Message "Cleaning up ..."
                Stop-Process -Id $process.Id
                
            }
    
    }
    
    Context "Invoked with Incognito" {
        BeforeAll{
        
            $browser = "chrome"
            $searchString = "favourite powershell module"
            $isIncognito = $true

             # Mock Open-Site
             Mock -ModuleName google_search  Open-Site {} -ParameterFilter {
                $browser -and $searchString -and $isIncognito
            }
    
            $proc = Open-Site $searchString $browser $isIncognito
        }

        It "Test should launch as incognito ✔" {
            $proc.StartInfo.Arguments | Should -Be $($searchString+$(" -incognito"))   
        }

        AfterAll{
            # Clean Up
            Write-Verbose -Message "Cleaning up ..."
            Stop-Process -Id $proc.Id
            
        }
    }

    }