BeforeAll{
    # If the module is already in memory, remove it
    Get-Module google_search | Remove-Module -Force
     
    # Import the module from the local path, not from the users Documents folder
    import-module .\google_search.psm1 -Force
            
    }
    
    Describe "Google_search::Search-Google Test" {
    
        Context "Invoked without Incognito" {
            
        BeforeAll{
            # Mock Search-Google
            Mock -ModuleName google_search  Search-Google {} -ParameterFilter {
                $browser -and $searchString
            }
    
            $browser = "chrome"
            $searchString = "android 11"
           
            $process = Search-Google $searchString $browser
            }
    
            It "Test should start chrome process ✔" {
             Should -InvokeVerifiable
             $process.Name | Should -Be $browser 
            }
    
            It "Test should launch as Normal ✔" {
                $process.StartInfo.Arguments.split('=')[1].replace('+', ' ') | Should -Be $searchString   
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

             # Mock Search-Google
             Mock -ModuleName google_search  Search-Google {} -ParameterFilter {
                $browser -and $searchString -and $isIncognito
            }
    
            $proc = Search-Google $searchString $browser $isIncognito
        }

        It "Test should launch as incognito ✔" {
            $proc.StartInfo.Arguments.split('=')[1].replace('+', ' ') | Should -Be $($searchString+$(" -incognito"))   
        }

        AfterAll{
            # Clean Up
            Write-Verbose -Message "Cleaning up ..."
            Stop-Process -Id $proc.Id
            
        }
    }

    }