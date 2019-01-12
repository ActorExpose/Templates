<%
	If ($PLASTER_PARAM_License -eq 'MIT')
	{
        @"
  <#
	The MIT License (MIT)

	Copyright (c) <%=(Get-Date).Year%> <%=$PLASTER_PARAM_Author %>

	Permission is hereby granted, free of charge, to any person obtaining a copy
	of this software and associated documentation files (the "Software"), to deal
	in the Software without restriction, including without limitation the rights
	to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
	copies of the Software, and to permit persons to whom the Software is
	furnished to do so, subject to the following conditions:

	The above copyright notice and this permission notice shall be included in all
	copies or substantial portions of the Software.

	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
	IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
	FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
	AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
	LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
	OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
	SOFTWARE.
  #>
"@
    }
%>
<%
    If ($PLASTER_PARAM_Help -eq 'Yes' -and $PLASTER_PARAM_Web -eq 'www.truesec.com')
    {
        @"
  <#
    .SYNOPSIS
    Summary of what the script does here
	.DESCRIPTION
    Description of what the script does here
	.EXAMPLE
    Example 1
	.EXAMPLE
    Example 2
	.NOTES
    ScriptName: <%=$PLASTER_PARAM_ScriptName%>.ps1
    Author:     <%=$PLASTER_PARAM_Author %>
    Email:      <%=$PLASTER_PARAM_Email %>
    Web:        <%=$PLASTER_PARAM_Web %>
  #>
"@
    }
	elseif ($PLASTER_PARAM_Help -eq 'Yes')
	{
        @"
  <#
    .SYNOPSIS
    Summary of what the script does here
	.DESCRIPTION
    Description of what the script does here
	.EXAMPLE
    Example 1
	.EXAMPLE
    Example 2
	.NOTES
    ScriptName: <%=$PLASTER_PARAM_ScriptName%>.ps1
    Author:     <%=$PLASTER_PARAM_Author %>
    Twitter:    <%=$PLASTER_PARAM_Twitter %>
    Email:      <%=$PLASTER_PARAM_Email %>
    Blog:       <%=$PLASTER_PARAM_Web %>
  #>
"@
    }
%>
<%
    If ($PLASTER_PARAM_BasicFeatures -eq 'Yes')
    {
        @"
        function verb-noun
        {
          
            [CmdletBinding()]
            Param
            (
                [Parameter(
                    ValueFromPipeline=$true,
                    ValueFromPipelineByPropertyName=$true, 
                    Position=0)]
                [string[]]
                $ComputerName
            )
            begin
            {
        
            }
            process
            {
                forEach ($computer in $ComputerName)
                {
        
                }
            }
            end
            {
        
            }
        }
"@
    }
%>