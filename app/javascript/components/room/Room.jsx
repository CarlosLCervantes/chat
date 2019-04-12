import React, { Component } from 'react'
import PropTypes from 'prop-types'
import ActionCable from "actioncable"

import { API_HOST } from '../../constants/api'

import Messages from './Messages'

class Room extends Component {
  constructor(props) {
    super(props)

    this.state = {
      cables: {
        messaging: null
      },
      messages: this.props.messages || [],
      newMessage: null,
    }

    this.handleNewMessageBlur = this.handleNewMessageBlur.bind(this)
    this.sendMessage = this.sendMessage.bind(this)
  }

  componentDidMount() {
    const { handle } = this.props

    const cable = ActionCable.createConsumer(
      `${API_HOST}/cable?handle=${handle}`,
    )

    const messaging = cable.subscriptions.create(
      { channel: 'MessagingChannel' },
      {
        connected: () => {
          console.log('CONNECTED')
        },
        received: (data) => {
          console.log("MESSAGE RECEIVED")
          const { message } = data
          this.receiveNewMessage(message);
        },
        speak: function(message, handle, rooms_user) {
          this.perform('speak', { message, handle, rooms_user });
        }
      },
    )

    this.setState({ cables: { messaging } } )
  }

  receiveNewMessage(message) {
    const { messages } = this.state

    messages.push(message)
    this.setState({ messages })
  }

  render() {
    const { messages } = this.state

    return (
      <div>
        <Messages messages={messages} />

        <input type='text' onBlur={this.handleNewMessageBlur} />
        <button onClick={this.sendMessage}>Send Message</button>
      </div>
    )
  }

  handleNewMessageBlur(e) {
    const newMessage = e.target.value

    this.setState({ newMessage })
  }

  sendMessage() {
    const { handle, rooms_user } = this.props
    const { newMessage } = this.state

    this.state.cables.messaging.speak(newMessage, handle, rooms_user)
  }
}

Room.propTypes = {
  handle: PropTypes.string.isRequired,
  rooms_user: PropTypes.object.isRequired,
  messages: PropTypes.arrayOf(PropTypes.object).isRequired
}

export default Room