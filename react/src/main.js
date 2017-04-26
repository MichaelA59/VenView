import 'babel-polyfill';
import React from 'react';
import ReactDOM from 'react-dom';
import ReviewShowContainer from './containers/reviewShowContainer'

$(function() {
  ReactDOM.render(
    <ReviewShowContainer pollInterval={5000}/>,
    document.getElementById('app')
  );
});
