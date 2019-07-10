import React from 'react';
import { Container, Row, Col } from 'reactstrap';
import Header from './Header';
import DataForm from './DataForm';

export default function App() {
  return (
    <Container>
      <Row>
        <Col md={{ size: 6, offset: 3 }}>
          <Header title="Tell us what you think" />
          <DataForm />
          <footer className='text-center text-muted' style={{ fontSize: '0.8em' }}>
            Copyright: Appfolio Inc. Onboarding
          </footer>
        </Col>
      </Row>
    </Container>
  );
}
