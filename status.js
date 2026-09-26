const title = document.getElementById('status-title');
const message = document.getElementById('status-message');
const icon = document.getElementById('status-icon');
const symbol = document.getElementById('status-symbol');
const homeLink = document.getElementById('status-home');

fetch('/status-state', { cache: 'no-store' })
  .then(response => {
    if (!response.ok) throw new Error('Status unavailable');
    return response.text();
  })
  .then(value => {
    const online = value.trim() === 'online';
    title.textContent = online ? 'Website is online' : 'Website is offline';
    message.textContent = online
      ? 'All systems are operational.'
      : 'The site is temporarily unavailable. Please check back soon.';
    homeLink.hidden = !online;
    icon.style.setProperty('--brand-color', online ? '#16803c' : '#b42318');
    icon.style.setProperty('--brand-bg', online ? '#e8f5ec' : '#fef3f2');
    symbol.setAttribute('d', online ? 'm8 12 2.5 2.5L16 9' : 'M12 7v6m0 4h.01');
  })
  .catch(() => {
    title.textContent = 'Status unavailable';
    message.textContent = 'The site status could not be loaded.';
    homeLink.hidden = true;
  });