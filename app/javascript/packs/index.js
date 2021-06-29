import React from 'react'
import ReactDOM from 'react-dom'

import Show from '../components/showmusic'

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <Show/>,
    document.body.appendChild(document.createElement('div')),
  )
})