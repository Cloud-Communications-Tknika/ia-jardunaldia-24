document.addEventListener('DOMContentLoaded', () => {
    const searchForm = document.getElementById('searchForm');
    const searchResults = document.getElementById('searchResults');

    // Mock data for demonstration
    const mockTrips = [
        {
            origin: 'Bilbo',
            destination: 'Donostia',
            date: '2024-04-04',
            seats: 3,
            price: 5,
            driver: 'Mikel A.'
        },
        {
            origin: 'Donostia',
            destination: 'Gasteiz',
            date: '2024-04-04',
            seats: 2,
            price: 8,
            driver: 'Ane B.'
        }
    ];

    searchForm.addEventListener('submit', (e) => {
        e.preventDefault();
        
        const origin = document.getElementById('origin').value;
        const destination = document.getElementById('destination').value;
        const date = document.getElementById('date').value;
        const seats = document.getElementById('seats').value;

        // Filter mock trips (in a real app, this would be an API call)
        const filteredTrips = mockTrips.filter(trip => 
            trip.seats >= parseInt(seats)
        );

        displayResults(filteredTrips);
    });

    function displayResults(trips) {
        searchResults.innerHTML = '';
        
        if (trips.length === 0) {
            searchResults.innerHTML = '<p>Ez da bidaiarik aurkitu zehaztutako irizpideekin.</p>';
            return;
        }

        trips.forEach(trip => {
            const tripElement = document.createElement('div');
            tripElement.className = 'trip-card';
            tripElement.innerHTML = `
                <h3>${trip.origin} - ${trip.destination}</h3>
                <p>Data: ${trip.date}</p>
                <p>Eserleku libreak: ${trip.seats}</p>
                <p>Prezioa: ${trip.price}€</p>
                <p>Gidaria: ${trip.driver}</p>
                <button onclick="alert('Erregistratu behar zara erreserba egiteko')" class="reserve-btn">
                    Erreserba eskatu
                </button>
            `;
            searchResults.appendChild(tripElement);
        });
    }
});
