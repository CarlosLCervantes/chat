import React, { Component } from 'react'
import PropTypes from "prop-types";

class Messages extends Component {
  render() {
    const { messages } = this.props

    return (
      messages.map(
        (message) => {
          return <p key={`msg-${message.id}`}>{message.body}</p>
        }
      )
    )
  }

  renderMessage() {

  }
}

Messages.propTypes = {
  messages: PropTypes.arrayOf(PropTypes.object).isRequired,
}

export default Messages