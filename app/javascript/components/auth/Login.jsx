import React, { Component } from 'react'
import PropTypes from "prop-types";

import AuthResource from '../../api/AuthResource'

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
      <div>
        <p>Hi, I'm Login</p>

        <input type='text' onBlur={this.onUserHandleBlur} />

        <button onClick={this.authenticate}>Authenticate</button>
      </div>
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
