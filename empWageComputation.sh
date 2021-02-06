#!/bin/bash -x 

echo "Welcome to Employee Wage Computation Program"

#constants
present=1
absent=0
FullTime=1
PartTime=0
WagePerHr=20
fullDay=8
partTimeHr=4
tot_WorkDays_limit=20
tot_workingHrs_Limit=100

#Daily Variables
declare -A wageRecords

HrsWorked=0
totDaysWorked=0
dailyPayment=0
salary=0

function getWorkingHrs(){
    case $1 in
        $FullTime)
                    workingHrs=$fullDay
                    ;;
        $PartTime)
                    workingHrs=$partTimeHr
                    ;;
        *)
                    workingHrs=0
                    ;;
    esac
    echo $workingHrs
}

function addDailyRecords(){
    index=$1
    dailyWage_value=$2
    totWage_value=$3
    wageRecords[$index]=`printf "%d\t%d" $dailyWage_value $totWage_value`
}

function printWageRecords(){
    echo "Days: DailyWage TotalWage"
    for((keys=1; keys<=$1; keys++))
    do
        echo $keys ": " ${wageRecords[$keys]}
    done
}

while [[ $totDaysWorked -lt $tot_WorkDays_limit && 
        $HrsWorked -lt $tot_workingHrs_Limit ]]
do
    checkRandom=$((RANDOM%2))
    case $checkRandom in
	    $present)
                echo "Employee is present"
                workHr=$( getWorkingHrs $((RANDOM%2)) )
                HrsWorked=$(($HrsWorked + $workHr))
                dailyPayment=$(($WagePerHr*$workHr))
                ((totDaysWorked++))
                salary=$(($salary+$dailyPayment))
                addDailyRecords $totDaysWorked $dailyPayment $salary
                ;;
	    $absent)
                echo "Employee is absent"
                dailyPayment=0
			    ;;
        *)
                echo "Invalid attendance"
                dailyPayment=0
                ;;
        esac
done

echo "Salary = $salary"
printWageRecords $totDaysWorked
