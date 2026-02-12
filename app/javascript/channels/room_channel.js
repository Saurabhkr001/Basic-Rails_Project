import consumer from "./consumer"

// This function checks if we are on a page with a chat room
// and subscribes to it.
document.addEventListener("DOMContentLoaded", () => {
  const roomName = window.roomName; // We will define this variable in the HTML View

  if (roomName) {
    consumer.subscriptions.create({ channel: "RoomChannel", room: roomName }, {
      connected() {
        // Called when the subscription is ready for use on the server
        // console.log("Connected to chat " + roomName);
      },

      disconnected() {
        // Called when the subscription has been terminated by the server
      },

      received(data) {
        // 1. Select the container where messages appear
        const messagesContainer = document.getElementById('messages');
        
        // 2. Insert the new HTML (received from the server) at the bottom
        if (messagesContainer) {
          messagesContainer.insertAdjacentHTML('beforeend', data['message']);

          // 3. Automatically scroll to the bottom to see the new message
          messagesContainer.scrollTop = messagesContainer.scrollHeight;
          
          // 4. Optional: Clear the input box so the user can type again
          const inputField = document.querySelector('#message_content');
          if (inputField) {
            inputField.value = '';
            inputField.focus();
          }
        }
      }
    });
  }
});