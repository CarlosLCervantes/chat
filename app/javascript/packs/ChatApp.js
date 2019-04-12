import React, { Component } from 'react'

import Container from 'react-bootstrap/Container'
import Alert from 'react-bootstrap/Alert'
import Login from '../components/auth/Login'
import Room from '../components/room/Room'

class ChatApp extends Component {
  constructor(props) {
    super(props);

    this.state = {
      user: {
        handle: null,
      },
      messages: [],
      loggedIn: false,
      error: false,
    }

    this.onAuthSuccess = this.onAuthSuccess.bind(this)
    this.setError = this.setError.bind(this)
  }

  render() {
    return (
      <Container>
        { this.renderError() }
        <h1>Chatting is magic!</h1>
        <br />
        { this.renderCurrentPage() }
      </Container>
    )
  }

  renderError() {
    const { error } = this.state

    if(error) {
      return (
        <Alert variant='warning'>
          There was an issue. Please try again.
        </Alert>
      )
    }
  }

  renderCurrentPage() {
    const { loggedIn, user, rooms_user, messages } = this.state

    if(loggedIn) {
      return <Room handle={user.handle} rooms_user={rooms_user} messages={messages} />
    } else  {
      return <Login onAuthSuccess={this.onAuthSuccess} setError={this.setError} />
    }
  }

  onAuthSuccess(handle, rooms_user, messages) {
    this.setState({ loggedIn: true, user: { handle }, rooms_user, messages})
    this.clearError();
  }

  setError() {
    this.setState({ error: true} )
  }

  clearError() {
    this.setState({ error: false })
  }
}

export default ChatApp