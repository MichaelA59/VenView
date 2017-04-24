import 'babel-polyfill';
import React from 'react';
import ReactDOM from 'react-dom';
import ReviewShowContainer from './containers/reviewShowContainer'

$(function() {
  ReactDOM.render(
    <ReviewShowContainer />,
    document.getElementById('app')
  );
});
