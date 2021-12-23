#!/bin/bash -x

isParTime=1
isFullTime=2
maxHrsInMonth=100
empRatePerHr=20
numofWorkingDays=20

totalEmpHr=0
totalWorkingDays=0


function getWorkingHours()
{
        case $1 in
                                $isPartTime)
                                        empHrs=4
                                        ;;
                                $isFullTime)
                                        empHrs=8
                                        ;;
                                *)
                                        empHrs=0
                                        ;;
        esac
}
function getEmpWage()
{
        echo $(($1*$empRatePerHr))
}
while [[ $totalEmpHr -lt $maxHrsInMonth &&
                $totalWorkingDays -lt $numofWorkingDays ]]
do
        ((totalWorkingDays++))
        randomCheck=$((RANDOM%3))
        getWorkingHours $randomCheck
        totalEmpHr=$(($totalEmpHr+$empHrs))
        dailywages[$totalWorkingDays]=$(($empHrs*$empRatePerHr))
done

totalSalary="$( getEmpWage $totalEmpHr )"
echo ${dailywages[@]}

