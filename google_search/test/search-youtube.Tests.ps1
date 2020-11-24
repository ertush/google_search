BeforeAll{
    # If the module is already in memory, remove it
    Get-Module google_search | Remove-Module -Force
     
    # Import the module from the local path, not from the users Documents folder
    import-module .\google_search.psm1 -Force
            
    }
    
    Describe "Google_search::Search-Youtube Test" {
    
        Context "Invoked without Incognito" {
            
        BeforeAll{
            # Mock Search-Youtube
            Mock -ModuleName google_search  Search-Youtube {} -ParameterFilter {
                $browser -and $searchString
            }
    
            $browser = "brave"
            $searchString = "android 11"
           
            $process = Search-Youtube $searchString $browser
            }
    
            It "Test should start brave process ✔" {
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
    
    }