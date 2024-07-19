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
  modal.querySelector('.modal-body p').textContent = message;

  // Show the modal
  $(modal).modal('show');
}

document.querySelector('.modal .btn-secondary').addEventListener('click', function(){
    $('#errorModal').modal('hide');
});
