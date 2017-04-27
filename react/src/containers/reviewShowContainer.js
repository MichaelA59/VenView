import React, { Component } from 'react';
import ReviewTile from '../components/reviewTile'

class ReviewShowContainer extends Component {
  constructor(props) {
    super(props);
    this.state = {
      reviews: []
    }
  }

  loadReviewsFromServer() {
    fetch('api/v1/reviewapi')
    .then(reviewResponse => reviewResponse.json())
    .then(usableReviewData => {
      this.setState({ reviews: usableReviewData })
    })
  }

  componentDidMount() {
    this.loadReviewsFromServer();
  }

  render() {
    let reviews = this.state.reviews.map (review => {
      return(
        <ReviewTile
          key={review.id}
          id={review.id}
          title={review.title}
          venue_name = {review.venue_name}
          venue_id = {review.venue_id}
        />
      )
    })

    return (
      <div className="row">
        <div className="small-10 medium-4 columns">
          <h3> Recent Reviews </h3>
          <hr />
          {reviews}
        </div>
      </div>
    )
  }
}

export default ReviewShowContainer;
