#!/bin/bash -x

isParTime=1
isFullTime=2
maxRateInMonth=100
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
while [[ $totalEmpHr -lt $maxRateInMonth &&
                $totalWorkingDays -lt $numofWorkingDays ]]
do
        ((totalWorkingDays++))
        getWorkingHours $((RANDOM%3))
	totalEmpHr=$(($totalEmpHr+$empHrs))
done

totalSalary=$(($totalEmpHr*$empRatePerHr))
