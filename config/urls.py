from django.contrib import admin
from django.urls import path, include

from rest_framework import permissions
from drf_yasg.views import get_schema_view
from drf_yasg       import openapi


urlpatterns = [
    path('admin/', admin.site.urls),
    path('api/todo', include('todo.urls')),  #add to
    path('api/content', include('content.urls'))
]

schema_view = get_schema_view(
    openapi.Info(
        title="rolling",
        default_version='1.1.1',
        description="rolling-project API doc",
        terms_of_service="https://www.google.com/policies/terms/",
        contact=openapi.Contact(email="mega@coffee.com"), # 부가정보
        license=openapi.License(name="rapa"),     # 부가정보
    ),
    public=True,
    permission_classes=[permissions.AllowAny],
)


if settings.DEBUG:
    urlpatterns += [
        re_path(r'^swagger(?P<format>\.json|\.yaml)$', schema_view.without_ui(cache_timeout=0), name="schema-json"),
        re_path(r'^swagger/$', schema_view.with_ui('swagger', cache_timeout=0), name='schema-swagger-ui'),
        re_path(r'^redoc/$', schema_view.with_ui('redoc', cache_timeout=0), name='schema-redoc'),    ]
