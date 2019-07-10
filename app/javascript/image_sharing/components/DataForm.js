import React from 'react';
import { Alert, Button, Form, FormGroup, Input, Label } from 'reactstrap';
import { post } from '../utils/helper';

export default class DataForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      name: '',
      comment: '',
      responseStatus: ''
    };
  }

  onChangeName(name) {
    this.setState({ name });
  }

  onChangeComments(comment) {
    this.setState({ comment });
  }

  submitComments() {
    return post('/api/feedbacks', {
      name: this.state.name,
      comment: this.state.comment
    }).then(() => {
      this.setState({ responseStatus: 'success' });
    }).catch(() => {
      this.setState({ responseStatus: 'error' });
    }).finally(() => {
      this.setState({ name: '', comment: '' });
    });
  }

  showMessage() {
    if (this.state.responseStatus === 'success') {
      return (<Alert color="success">Success</Alert>);
    }
    if (this.state.responseStatus === 'error') {
      return (<Alert color="danger">Something went wrong</Alert>);
    }
    return '';
  }

  render() {
    return (
      <Form>
        {this.showMessage()}
        <FormGroup>
          <Label for="name">Name</Label>
          <Input
            id='name'
            type="text"
            placeholder="Enter name"
            value={this.state.name}
            onChange={e => this.onChangeName(e.target.value)}
          />
        </FormGroup>
        <FormGroup>
          <Label for="comments">Comments</Label>
          <Input
            id="comments"
            type="textarea"
            placeholder="Enter Comments"
            value={this.state.comment}
            onChange={e => this.onChangeComments(e.target.value)}
          />
        </FormGroup>
        <Button color="primary" onClick={() => this.submitComments()}>Submit</Button>
      </Form>
    );
  }
}
