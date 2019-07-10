/* eslint-env mocha */

import assert from 'assert';
import { shallow } from 'enzyme';
import React from 'react';
import { Button, Input } from 'reactstrap';
import App from '../../components/App';
import Header from '../../components/Header';
import DataForm from '../../components/DataForm';

describe('<App />', () => {
  it('should render correctly', () => {
    const wrapper = shallow(<App />);

    assert.strictEqual(wrapper.find(Header).length, 1);
    assert.strictEqual(wrapper.find(DataForm).length, 1);
    assert.strictEqual(wrapper.find('footer').length, 1);
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
