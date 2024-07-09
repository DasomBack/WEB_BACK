function change_btn(e, period) {
    // 버튼 노란색 변경
    const buttons = document.querySelectorAll('.btn.btn-outline-secondary.btn-sm');
    buttons.forEach(button => button.classList.remove('active'));
    e.target.classList.add('active');


    const startDateInput = document.getElementById('startDate');
    const endDateInput = document.getElementById('endDate');
    const today = new Date();
    startDateInput.valueAsDate = today;

    if (period == 'month'){
        const endDate = new Date(today);
        endDate.setMonth(today.getMonth()+1);
        endDateInput.valueAsDate = endDate;
    }else if (period === '2weeks') {
         const endDate = new Date(today);
         endDate.setDate(today.getDate() + 14);
         endDateInput.valueAsDate = endDate;
    } else if (period === '1week') {
         const endDate = new Date(today);
         endDate.setDate(today.getDate() + 7);
         endDateInput.valueAsDate = endDate;
    } else {
         startDateInput.value = '';
         endDateInput.value = '';
    }

}


function set_time(){
    const startTimeInput = document.getElementById('startTime').value;
    const endTimeInput = document.getElementById('endTime').value;
    const timeElement = document.getElementById('timeElement');

    if (startTimeInput && endTimeInput) {
        const startTime = new Date(`1970-01-01T${startTimeInput}:00`);
        const endTime = new Date(`1970-01-01T${endTimeInput}:00`);

        let timeDifference = endTime - startTime;
        if (timeDifference < 0) {
            timeDifference += 24 * 60 * 60 * 1000; // add 24 hours if endTime is before startTime
        }

        const hours = Math.floor(timeDifference / (1000 * 60 * 60));
        const minutes = Math.floor((timeDifference % (1000 * 60 * 60)) / (1000 * 60));

        timeElement.innerText = `${hours}시간`;
    } else {
        timeElement.innerText = 'Please enter both start and end times.';
    }

}

document.getElementById('startTime').addEventListener('input',set_time);
document.getElementById('endTime').addEventListener('input',set_time);

