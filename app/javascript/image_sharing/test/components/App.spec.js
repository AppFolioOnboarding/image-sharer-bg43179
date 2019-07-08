/* eslint-env mocha */

import assert from 'assert';
import { mount, shallow } from 'enzyme';
import React from 'react';
import { Button, Input } from 'reactstrap';
import App from '../../components/App';

describe('<App />', () => {
  it('should render correctly', () => {
    const wrapper = mount(<App />);
    assert(wrapper.contains('Tell us what you think'));
  });

  it('should create a form for user to input name and comment', () => {
    const wrapper = shallow(<App />);
    const dataForm = wrapper.find('DataForm').dive();
    assert.strictEqual(dataForm.find(Input).length, 2);
    assert.strictEqual(dataForm.find(Input).at(0).prop('type'), 'text');
    assert.strictEqual(dataForm.find(Input).at(1).prop('type'), 'textarea');
  });

  it('should create a form with button', () => {
    const wrapper = shallow(<App />);
    const dataForm = wrapper.find('DataForm').dive();
    assert.strictEqual(dataForm.find(Button).prop('color'), 'primary');
  });

  it('should create a footer', () => {
    const wrapper = shallow(<App />);
    assert(wrapper.find('footer').contains('Copyright: Appfolio Inc. Onboarding'));
  });
});
