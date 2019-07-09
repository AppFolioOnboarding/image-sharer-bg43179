/* eslint-env mocha */

import assert from 'assert';
import { shallow } from 'enzyme';
import sinon from 'sinon';
import React from 'react';
import { Alert, Button, Input } from 'reactstrap';
import DataForm from '../../components/DataForm';
import * as api from '../../utils/helper';

describe('<DataForm />', () => {
  let wrapper;

  beforeEach(() => {
    wrapper = shallow(<DataForm />);
  });

  it('should call onChangeName if name input is updated', () => {
    const changeNameSpy = sinon.stub(wrapper.instance(), 'onChangeName');
    const event = { target: { value: 'Andrew' } };

    wrapper.find(Input).at(0).simulate('change', event);

    assert(changeNameSpy.calledOnce);
  });

  it('should call onChangeComments if comments input is updated ', () => {
    const changeCommentsSpy = sinon.stub(wrapper.instance(), 'onChangeComments');
    const event = { target: { value: 'This is a comment' } };

    wrapper.find(Input).at(1).simulate('change', event);

    assert(changeCommentsSpy.calledOnce);
  });

  it('should call submitComments if button is clicked', () => {
    const submitCommentSpy = sinon.stub(wrapper.instance(), 'submitComments');

    wrapper.find(Button).simulate('click');

    assert(submitCommentSpy.calledOnce);
  });

  describe('submitComments', () => {
    it('should send a valid post request and get success response', () => {
      const postStub = sinon.stub(api, 'post').resolves();

      wrapper.setState({ responseStatus: '' });

      return wrapper.instance().submitComments().then(() => {
        assert(postStub.calledOnce);
        assert.strictEqual(wrapper.state('responseStatus'), 'success');
      }).finally(() => {
        sinon.restore();
      });
    });

    it('should send a invalid post request and get error response', () => {
      const postStub = sinon.stub(api, 'post').rejects();
      wrapper.setState({ responseStatus: '' });

      return wrapper.instance().submitComments().then(() => {
        assert(postStub.calledOnce);
        assert.strictEqual(wrapper.state('responseStatus'), 'error');
      }).finally(() => {
        sinon.restore();
      });
    });
  });

  describe('showMessage', () => {
    it('should display success message if the response is success', () => {
      wrapper.setState({ responseStatus: 'success' });

      wrapper.instance().showMessage();

      assert.strictEqual((wrapper.find(Alert).prop('children')), 'Success');
    });

    it('should display error message if the response is error', () => {
      wrapper.setState({ responseStatus: 'error' });

      wrapper.instance().showMessage();

      assert.strictEqual((wrapper.find(Alert).prop('children')), 'Something went wrong');
    });
  });
});
