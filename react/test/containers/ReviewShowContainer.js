import ReviewShowContainer from 'containers/ReviewShowContainer';
import ReviewTile from 'components/ReviewTile'
import { mount } from 'enzyme';
import React from 'react';
import jasmineEnzyme from 'jasmine-enzyme';

describe('ReviewShowContainer', () => {
  let wrapper;

  beforeEach(() => {
    jasmineEnzyme ();
    wrapper = mount(<ReviewShowContainer/>);
  });

  it('should render a ReviewTile Component', () => {
    expect(wrapper.find(ReviewTile)).toBePresent();
  });

});
