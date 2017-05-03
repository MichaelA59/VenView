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
    setInterval(this.loadReviewsFromServer.bind(this), this.props.pollInterval);
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
      <div className='row'>
        <div className='columns small-centered large-uncentered small-10 large-6 text-center home-content'>
          <h1>No More Guessing</h1>
          <p>With VenView, finding the best venue is easy</p>

          <hr width='50%'/>

          <h1>Share your Memories</h1>
          <p>Leave reviews for Venues you visited and let others know what you think!</p>

          <hr width='50%'/>

          <h1>Connect with Fans</h1>
          <p>Join the community and rate other fans' reviews</p>
        </div>

        <div className="columns small-10 large-4 top-five">
          <h3> Recent Reviews </h3>
          {reviews}
        </div>
      </div>
    )
  }
}

export default ReviewShowContainer;
