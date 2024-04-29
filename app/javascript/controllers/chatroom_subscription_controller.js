import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

// Connects to data-controller="chatroom-subscription"
export default class extends Controller {
  static targets = ["messages"]
  static values = {
    chatroomId: Number,
    userId: Number,
  }

  connect() {
    this.channel = createConsumer().subscriptions.create(
      { channel: "ChatroomChannel", id: this.chatroomIdValue },
      { received: data => this.#insertMessageAndScrollDown(data) }
    )
    console.log(`Subscribe to the chatroom with the id ${this.chatroomIdValue}.`)
  }

  disconnect() {
    console.log("Unsubscribed from the chatroom")
    this.channel.unsubscribe()
  }

  resetForm(event) {
    event.target.reset()
  }

  #insertMessageAndScrollDown({sender, message}) {
    if(sender != this.userIdValue) {
      message = message.replace("message-sender", "message-receiver")
    }
    this.messagesTarget.insertAdjacentHTML("beforeend", message)
    this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight)
  }
}
