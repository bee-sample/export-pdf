#Get the date time
$yyyyMMdd = $(get-date -format "yyyyMMdd")
$HHmm = $(get-date -format "HHmm")

#Build the log file name
$logFileName = "myLog_$($yyyyMMdd)_$($HHmm).log"

#Info
Write-Output "Building the app with log file name $($logFileName)"

#Build project
#mvn clean install -DskipTests -X -l $logFileName
gradle clean build -stacktrace -x test --info > $logFileName

#Copy the flexi-0.0.1-SNAPSHOT.jar from target to here
# Remove-Item -Path ".\flexi-0.0.1-SNAPSHOT.jar" -Force
# Start-Sleep -s 2
# Copy-Item -Path ".\target\flexi-0.0.1-SNAPSHOT.jar" -Destination ".\"

#Press any key
Write-Output "Building finished!"
Write-Host -NoNewLine 'Press any key to continue...';
$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');

# Open the log file
# Invoke-Item ".\$($logFileName)"
