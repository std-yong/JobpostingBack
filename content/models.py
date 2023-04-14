import json
from django.db import models

class Feed(models.Model):
    company_name        =   models.TextField()
    company_image_url   =   models.TextField()
    job_title           =   models.TextField()
    job_poster          =   models.TextField()
    job_description     =   models.TextField()
    job_category        =   models.TextField()
    job_location        =   models.TextField()
    company_type        =   models.TextField()
    employment_type     =   models.BooleanField()
    experience_level    =   models.BooleanField()
    salary              =   models.TextField()
    start_date          =   models.TextField()
    end_date            =   models.TextField()