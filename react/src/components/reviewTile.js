import React from 'react';
import { Link } from 'react-router';

const ReviewTile = (props) => {
  return(
    <div className="review-tile">
    <hr/>
      <h4>{props.title}</h4>
      <p>- Review for {props.venue_name} - </p>
        <div className="button"><a href={`/venues/${props.venue_id}`}>See more here!</a></div>
    </div>
  )
}

export default ReviewTile;
