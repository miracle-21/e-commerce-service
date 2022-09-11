import re

from django.core.exceptions import ValidationError

#EMAIL_REGEX: @와 .필수
EMAIL_REGEX    = '^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$'
#PASSWORD_REGEX: 8자 이상, 영,숫자,특수기호 중 2개 이상 포함
PASSWORD_REGEX = '^((?=.*[A-Za-z])(?=.*\d)|(?=.*[A-Za-z])(?=.*[\^@$!%*#?&])|(?=.*\d)(?=.*[\^@$!%*#?&])).{8,}$'

def validate_email(value):
    if not re.match(EMAIL_REGEX,value):
        raise ValidationError('이메일을 정확히 입력하세요')

def validate_password(value):
    if not re.match(PASSWORD_REGEX,value):
        raise ValidationError('영어, 숫자, 특수기호 중 2개를 포함하여 8자 이상 입력하세요')