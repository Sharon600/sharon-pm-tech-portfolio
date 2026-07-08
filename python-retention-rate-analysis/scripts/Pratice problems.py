# Practice problem solutions

# 1. Create a list of site names and print only the sites that contain "India".
#    Then print the total count of all sites.
site_names = ["India101", "London498", "New York202", "Tokyo303", "USA878", "India890"]
india_sites = [s for s in site_names if "India" in s]
print(india_sites)
print(len(site_names))

# 2. Same idea using startswith to match sites beginning with "India".
india_sites_startswith = [s for s in site_names if s.startswith("India")]
print(india_sites_startswith)

# 3. Dictionary example: print each key/value pair, update status, then print the updated status.
project = {
    "project_name": "Immunabs",
    "budget": 8900000,
    "status": "active",
    "sites": 49,
}
for key, value in project.items():
    print(f"{key}: {value}")
project["status"] = "closed"
print(f"\nupdated status of the project Immunabs is: {project['status']}")

# 4. RAG function example.
def get_rag(enrolled, target=20):
    if enrolled >= target:
        return "Green"
    elif enrolled >= target * 0.5:
        return "Amber"
    return "Red"

for actuals in (5, 11, 22):
    print(f"{actuals}: {get_rag(actuals, 20)}")

# 5. Loop through a list of site dictionaries, print the RAG status per site,
#    and compute the total enrolled count.
sites = [
    {"site": "Chennai", "enrolled": 22},
    {"site": "New York", "enrolled": 9},
    {"site": "London", "enrolled": 14},
    {"site": "USA", "enrolled": 21},
]

total = 0
for item in sites:
    rag = get_rag(item["enrolled"])
    print(f"{item['site']}: {item['enrolled']}; {rag}")
    total += item["enrolled"]
print(total)

counts = {"Green": 0, "Amber": 0, "Red": 0}
for item in sites:
    counts[get_rag(item["enrolled"])] += 1
print(counts)

# 6. Another presentation of the same RAG logic with formatted output.
more_sites = [
    {"site": "Chennai", "enrolled": 22},
    {"site": "New York", "enrolled": 9},
    {"site": "London", "enrolled": 14},
]

total_enrolled = sum(item["enrolled"] for item in more_sites)
for item in more_sites:
    rag = get_rag(item["enrolled"])
    print(f"{item['site']}: {item['enrolled']} patients — {rag}")

print(f"\nTotal enrolled: {total_enrolled}")

counts2 = {"Green": 0, "Amber": 0, "Red": 0}
for item in more_sites:
    counts2[get_rag(item["enrolled"])] += 1

for status, count in counts2.items():
    print(f"{status}: {count} sites")
