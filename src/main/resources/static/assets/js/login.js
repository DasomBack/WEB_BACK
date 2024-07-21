document.addEventListener('DOMContentLoaded', function() {
    function validateAndSubmit() {
        // Get form elements
        const store = document.getElementById('exampleInputStorecode1').value;
        const phoneNum = document.getElementById('exampleInputPhonenum1').value;
        const password = document.getElementById('exampleInputPassword1').value;

        // Check if all fields are filled
        if (!store || !phoneNum || !password) {
            showModal('모든 필드를 올바르게 채워주세요.');
            return;
        }

        // Submit the form
               document.getElementById('loginForm').submit();
           }

           function showModal(message) {
               // Get the modal
               const modal = document.getElementById('errorModal');

               // Change the modal message
               const modalBody = modal.querySelector('.modal-body p');
               if (modalBody) {
                   modalBody.textContent = message;
               }

               // Show the modal
               $(modal).modal('show');
           }

           // Check if the close button exists before adding the event listener
           const closeButton = document.querySelector('.modal .close');
           if (closeButton) {
               closeButton.addEventListener('click', function(){
                   $('#errorModal').modal('hide');
               });
           }

           // Check for error message from server
           let errorMessage = /*[[${error}]]*/ '[[${error}]]';
           if (errorMessage && errorMessage.trim() !== '[[${error}]]') {
               showModal(errorMessage);
           }


        // Attach validateAndSubmit to the button click event
        document.querySelector('.auth-form-btn').addEventListener('click', validateAndSubmit);
    });