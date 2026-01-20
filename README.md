# Robot Framework E-Commerce Project

This project automates testing for the [Automation Exercise](https://automationexercise.com/) website using **Robot Framework**. It tests user registration, login, and purchasing flows.

## 📂 Structure
* `test/` - The test cases (e.g., Login, Purchase).
* `page/` - Keywords and Page Objects.
* `results/` - Where log files are saved.

## 🚀 Setup
1.  **Install Python.**
2.  **Install libraries:**
    ```bash
    pip install -r requirements.txt
    ```

## ▶️ How to Run
Run all tests and save results to the `results` folder:
```bash
robot -d results tests/
