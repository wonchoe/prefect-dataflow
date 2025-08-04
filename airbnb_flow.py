from prefect import flow, task
import pandas as pd

@task
def load_data(path: str) -> pd.DataFrame:
    df = pd.read_csv(path)
    print(f"Loaded {len(df)} rows")
    return df

@task
def top_expensive(df: pd.DataFrame, n: int = 10):
    top = df.sort_values(by="price", ascending=False).head(n)
    print(top[["name", "neighbourhood", "price"]])
    return top

@flow
def airbnb_flow():
    df = load_data("dataset.csv")
    top_expensive(df)

if __name__ == "__main__":
    airbnb_flow()
