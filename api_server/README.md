1. Create  and Activate venv
2. make migrations for database
3. Apply migrations
4. Create Superuser
5.run server

virtualenv venv
python -m virtualenv venv

source ./venv/Scripts/activate

pip install -r requirements.txt

python manage.py migrate

python manage.py makemigrations authentication
python manage.py runserver 0.0.0.0:8000

python manage.py createsuperuser