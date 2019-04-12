import React, { Component } from 'react'
import PropTypes from "prop-types"

import AuthResource from '../../api/AuthResource'

import Form from 'react-bootstrap/Form'
import Button from 'react-bootstrap/Button'

class Login extends Component {
  constructor(props) {
    super(props)

    this.state = {
      handle: null,
    }

    this.AuthResource = new AuthResource()
    this.onUserHandleBlur = this.onUserHandleBlur.bind(this)
    this.authenticate = this.authenticate.bind(this)
  }

  render() {
    return (
      <Form>
        <Form.Group controlId="formBasicHandle">
          <Form.Label>Chat Handle</Form.Label>
          <Form.Control type="text" placeholder="Enter handle"
                        onBlur={this.onUserHandleBlur} />
          <Form.Text className="text-muted">
            This is the name that will show up in the chat
          </Form.Text>
        </Form.Group>
        <Button variant="primary" onClick={this.authenticate}>
          Submit
        </Button>
      </Form>
    )
  }

  onUserHandleBlur(e) {
    const handle = e.target.value

    this.setState({ handle })
  }

  authenticate() {
    const { handle } = this.state

    this.AuthResource.login(handle)
      .then((data) => {
        const { rooms_user, messages } = data
        this.props.onAuthSuccess(handle, rooms_user, messages);
      })
      .catch(() => { this.props.setError() })
  }
}

Login.propTypes = {
  onAuthSuccess: PropTypes.func.isRequired,
  setError: PropTypes.func.isRequired,
}

export default Login
