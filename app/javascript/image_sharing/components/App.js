import React from 'react';
import { Container, Row, Col, Button, Form, FormGroup, Label, Input } from 'reactstrap';
import Header from './Header.js';

class DataForm extends React.Component {
  render() {
    return (
      <Form >
        <FormGroup>
          <Label for="name">Name</Label>
          <Input id='name' type="text" placeholder="Enter name" />
        </FormGroup>
        <FormGroup>
          <Label for="comments">Comments</Label>
          <Input id="comments" type="textarea" placeholder="Enter Comments" />
        </FormGroup>
        <FormGroup>
          <Button color="primary">Submit</Button>
        </FormGroup>
      </Form>
    );
  }
}

export default function App() {
  return (
    <Container>
      <Row>
        <Col md={{ size: 6, offset: 3 }}>
          <Header title="Tell us what you think" />
          <DataForm />
          <footer className='text-center text-muted' style={{ fontSize: '0.8em' }}>Copyright: Appfolio Inc. Onboarding</footer>
        </Col>
      </Row>
    </Container>


  );
}

/* TODO: Add Prop Types check*/
