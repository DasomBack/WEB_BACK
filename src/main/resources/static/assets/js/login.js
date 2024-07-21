document.addEventListener('DOMContentLoaded', function() {
    function validateAndSubmit() {
        const store = document.getElementById('exampleInputStorecode1').value;
        const phoneNum = document.getElementById('exampleInputPhonenum1').value;
        const password = document.getElementById('exampleInputPassword1').value;

        if (!store || !phoneNum || !password) {
            showModal('모든 필드를 올바르게 채워주세요.');
            return;
        }

        document.getElementById('loginForm').submit();
    }

    function showModal(message) {
        const modal = document.getElementById('errorModal');

        const modalBody = modal.querySelector('.modal-body p');
        if (modalBody) {
            modalBody.textContent = message;
        }

        $(modal).modal('show');
    }

    const closeButton = document.querySelector('.modal .close');
    if (closeButton) {
        closeButton.addEventListener('click', function(){
            $('#errorModal').modal('hide');
        });
    }

    const errorMessageElement = document.getElementById('errorModal');
    if (errorMessageElement) {
        const errorMessage = errorMessageElement.getAttribute('data-error-message');
        if (errorMessage && errorMessage.trim() !== '') {
            showModal(errorMessage);
        }
    }

    document.querySelector('.auth-form-btn').addEventListener('click', validateAndSubmit);
});
