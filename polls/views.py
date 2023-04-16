from django.shortcuts import render

from django.http import HttpResponse


def index(request):
    return HttpResponse("Always for luck. Hello, world!! OpenShift - RedHat - Webhooks - GitOps. ")
