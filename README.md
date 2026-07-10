# PGold Wallet

A Flutter fintech wallet application built with MobX for state management. The app simulates a wallet dashboard and transaction reporting workflow using a mocked backend.

## How to Run

1. Clone the repository

2. Navigate into the project

3. Install dependencies

4. Run the application


---

## Packages Used

  |Package | Purpose |

| flutter_mobx | Reactive UI updates |
| mobx | State management |
| intl | Date formatting |
| go_router | Navigation |

---

## Folder Structure

lib/
│
├── core/
├── data/
│   ├── models/
│   ├── repos/
│   ├── services/
│   └── mock/
│
├── general_widgets/
├── screens/
├── stores/
└── main.dart

---

## MobX State Management

The application uses a DashboardStore to manage application state.

The store is responsible for:

- Loading dashboard data
- Loading transactions
- Verifying transaction PIN
- Submitting transaction reports
- Managing loading and error states

The UI listens for changes using Observer widgets.

---

## Simulated Backend

A MockService simulates backend requests.

Artificial network delays were added using:

await Future.delayed(const Duration(seconds: 1));

The mock service provides:

- fetchDashboard()
- fetchTransactions()
- fetchTransactionById()
- verifyTransactionPin()
- submitTransactionReport()

---

## Validation

The report form validates that:

- A reason is selected.
- Description is required.
- Description is between 20 and 250 characters.
- Submit button remains disabled until valid.
- Multiple submissions are prevented while loading.

---

## PIN Flow

Before submitting a report:

- User enters a 4-digit transaction PIN.
- PIN is hidden using obscureText.
- Test PIN is: 1234

The application:

- Clears the PIN after every attempt.
- Blocks further attempts after three incorrect PIN entries.
- Shows appropriate success and error messages.

---

## Edge Cases Handled

- Dashboard loading state
- Empty transaction list
- Transaction not found
- Failed transaction cannot be reported
- Reversed transaction cannot be reported
- Duplicate report prevention
- Already reported transaction
- Invalid report form
- Wrong PIN
- Three failed PIN attempts
- Multiple submit prevention
- Successful report submission
- Pull-to-refresh dashboard

---

## Known Trade-offs

- Data is stored only in memory.
- Reports are not persisted after restarting the application.
- Backend responses are simulated.

---

## Improvements

With more time I would:

- Add local persistence using SharedPreferences.
- Improve UI animations.
- Add more unit and widget tests.
- Improve accessibility and responsive layouts.
- Format currency values using proper thousand separators 
---

## Test PIN

1234
