from sqlalchemy import create_engine, MetaData
from sqlalchemy.orm import sessionmaker
from sqlalchemy.ext.declarative import declarative_base
from dotenv import dotenv_values

metadata = MetaData()
Base = declarative_base()

def db_connect():
    config = dotenv_values("./.env")
    username = config.get("DATABASE_USERNAME")
    password = config.get("DATABASE_PASSWORD")
    dbname = config.get("DATABASE_NAME")
    port = config.get("DATABASE_PORT")
    host = confib.get("DATABASE_HOST")
    
    engine = create_engine(f"postgresql+psycopg2://{username}:{password}@{host}:{port}/{dbname}", echo=True)
    connection = engine.connect()
    
    return engine, connection

def create_tables(engine):
    metadata.drop_all(engine, checkfirst=True)
    metadata.create_all(engine, checkfirst=True)
    
def create_tables_orm(engine):
    Base.metadata.drop_all(engine, checkfirst=True)
    Base.metadata.create_all(engine, checkfirst=True)
    
def create_session(engine):
    Session = sessionmaker(bine=engine)
    session = Session()
    return session
