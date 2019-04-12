import BaseResource from './BaseResource'

class AuthResource extends BaseResource {
  login(handle) {
    const resourceUri = `${this.baseURL}/sessions`;

    return super.post(resourceUri, { handle });
  }
}

export default AuthResource