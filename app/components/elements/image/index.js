import React from 'react'
import PropTypes from 'prop-types';

const Image = ({ alt, title, sizes, size }) => <img src={sizes[size]} alt={alt} title={title} />

Image.propTypes = {
  alt: PropTypes.string,
  title: PropTypes.string,
  sizes: PropTypes.object,
  size: PropTypes.string.isRequired,
};

export default Image;
export const ImageSizes = {
  LARGE: 'large',
  MEDIUM: 'medium',
  THUMBNAIL: 'thumbnail'
};
