import React from 'react';
import { Link } from 'react-router';

const ReviewTile = (props) => {
  return(
    <div className="review-tile">
      <h4>{props.title}</h4>
      <p>Review for {props.venue_name} - <a href={`/venues/${props.venue_id}`}>See more here!</a></p>
      <hr/>
    </div>
  )
}

export default ReviewTile;
