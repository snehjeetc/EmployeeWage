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
        salary=$(($salary+$dailyPayment))
done

echo "Salary = $salary"
