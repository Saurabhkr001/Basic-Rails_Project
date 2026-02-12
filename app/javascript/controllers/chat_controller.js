import { Controller } from "@hotwired/stimulus"
import consumer from "../channels/consumer"

export default class extends Controller {
  static targets = ["messages", "input"]
  static values = { room: String }

  connect() {
    this.channel = consumer.subscriptions.create(
      { channel: "RoomChannel", room: this.roomValue },
      { received: data => this.#insertMessage(data) }
    )
  }

  disconnect() {
    this.channel.unsubscribe()
  }

  #insertMessage(data) {
    this.messagesTarget.insertAdjacentHTML('beforeend', data['message'])
    this.messagesTarget.scrollTop = this.messagesTarget.scrollHeight
    this.inputTarget.value = ''
  }
}