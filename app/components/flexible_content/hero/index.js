import React from 'react'
import Image, { ImageSizes } from '../../elements/image'
import PropTypes from 'prop-types'

const Hero = ({image, mobile_image, tablet_image}) => {
  return (
    <React.Fragment>
      <h1>Hero Section</h1>
      <h2>{image}</h2>
      <Image {...mobile_image} size={ImageSizes.THUMBNAIL} />
      <Image {...tablet_image} size={ImageSizes.MEDIUM} />
    </React.Fragment>
  )
}

Hero.propTypes = {
  image: PropTypes.any,
  mobile_image: PropTypes.any,
  tablet_image: PropTypes.any,
}

export default Hero;
