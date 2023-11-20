# Generated by Django 4.2.7 on 2023-11-18 08:26

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    def create_default_roles(apps, schema_editor):
        Role = apps.get_model('authentication', 'Role')
        Role.objects.create(name='student', description='Student role')
        Role.objects.create(name='admin', description='Admin role')

    dependencies = [
        ("authentication", "0001_initial"),
    ]

    operations = [
        migrations.CreateModel(
            name="Role",
            fields=[
                (
                    "name",
                    models.CharField(
                        max_length=50, primary_key=True, serialize=False, unique=True
                    ),
                ),
                ("description", models.TextField(blank=True, null=True)),
            ],
        ),
        migrations.AddField(
            model_name="user",
            name="role",
            field=models.ForeignKey(
                default="student",
                on_delete=django.db.models.deletion.PROTECT,
                to="authentication.role",
            ),
        ),
        migrations.RunPython(create_default_roles),
    ]