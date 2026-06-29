"""Study notes: retention rate example.

This script shows how to:
1. Calculate retention rate for each site.
2. Assign a status based on the calculated rate.
3. Print the results.
4. Find the site with the worst retention rate.
"""

sites = [
    {"site": "Chennai", "enrolled": 22, "dropped": 2},
    {"site": "New York", "enrolled": 9, "dropped": 4},
    {"site": "London", "enrolled": 14, "dropped": 3},
    {"site": "Tokyo", "enrolled": 19, "dropped": 8},
]


def calculate_retention_rate(enrolled, dropped):
    """Return the retention rate and status for a site."""
    if enrolled <= 0:
        raise ValueError("Enrolled must be greater than 0")

    rate = round(((enrolled - dropped) / enrolled) * 100, 2)

    if rate >= 80:
        status = "Good"
    elif rate >= 60:
        status = "Watch"
    else:
        status = "Critical"

    return rate, status


print("Retention summary")
print("-" * 20)

for site in sites:
    rate, status = calculate_retention_rate(site["enrolled"], site["dropped"])
    print(f"site:{site['site']}, retention rate: {rate}%, status: {status}")


worst_site = None
worst_rate = float("inf")

for site in sites:
    rate, _ = calculate_retention_rate(site["enrolled"], site["dropped"])
    if rate < worst_rate:
        worst_rate = rate
        worst_site = site["site"]

print(f"The site with the worst retention rate is: {worst_site} ({worst_rate}%)")
