Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34AD8262A6
	for <linux-staging@lists.linux.dev>; Tue, 14 Oct 2025 14:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760450501; cv=none; b=pqC85c1WLjvIpHrq7ZGxeJmtu+aiMvOyGs7TK8x8uKVgWcGLab+ImHhnQ7UaiDmDXdoJOLekZ1pzog73K5fI/m37lWWgVJKyL6JVKmhLMOBzB0aBWie2O3DxruqgLC6yO+kzIZUak/VV7LzZh53U4b/+3ula4PTfdCVpxitbJ/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760450501; c=relaxed/simple;
	bh=ORkyXfUlrCWsmh6RANOw0pZZxMqtCdH/gG/DbxBBa40=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ya4hp3IxcgdHrIyzJ9qrGx0mIZxlzeZl1aAsexNDd0ZOh8Ojq9v52+f35omjgVyO3tuuu6ELhl0FHLJ+jLL7YA12sf7KlOzwAYmlRjLlBvWzAu75t/HytQeHu8871nvhAcZKhKGRR9A2jIMRV2DlL24CWKQqBpXBx4K83Y/bumw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ijVP8/QM; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ijVP8/QM"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-7946137e7a2so82615296d6.0
        for <linux-staging@lists.linux.dev>; Tue, 14 Oct 2025 07:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760450499; x=1761055299; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LS/tbUNJsSKY6ZBKj3q4etRpyWDlKJg9S7gh6A/LQgo=;
        b=ijVP8/QMWcis3yuCHijy2yNVK/g8hPAZNMlF14Ab5fwbRjfdoSqmPSB0sbrMWZVEnl
         +XvOk2wLXQwb/CX7eLlnYdjeGtVpj1XtmFu+X1g2jzXnLlUMibyWpupWYAzvOAB9y0wd
         0BV8rwooISG5N/AuxbeXSHVrU0kty8RBQhxFk9iWANX93rkY+oilyXM93GQkwL52qpgG
         tDN6SYQrFq1T3vMK48z4cgO5szMUj2ua/k/mT+80DHIbP1qK6dEd55rVvm5Uzv4mcQfA
         YZSLpTJNixAle1RDyroXPYlnnqV1Z0tsI+D3jDkKGDhqAEgg+Cj53AtjUNEJWqaG23DA
         BaaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760450499; x=1761055299;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LS/tbUNJsSKY6ZBKj3q4etRpyWDlKJg9S7gh6A/LQgo=;
        b=Y0YqmJWVDyr590fatGyD7iIWcMUNs3xcAMMUa71OliDomyhDlek4rAkBCns2/nisEI
         j7tl9qOiPs4banLEoeyAV5HOMLlbJWttFiMYABqV0WizEYJSWMD04taR9h4xTqbsWe7f
         u2hUGjlZ8MBUFluPScM4hK/vp+KSX929bp4wP0PjMsPW5GMwJSD5pm1OulQb/kSYUUGl
         oRGJZsY0sB1hfVXF5obveLSpn8dDOm1RZl8/mjjsySYJ/VjHcDmGrjceZNL3oOnkltE/
         KbHsMakOhZibtkWepq7jzmQhMNOd5Og22orLyEE1qDKEt4Tp6GtClc3bTUrVqwfrRIbi
         RSUA==
X-Forwarded-Encrypted: i=1; AJvYcCViZWbqSaNhWhtCg/5ca636scZ2lwjSxayge2YpHQyjSR8QKCWOu4Qg6PMs2YZHL9Eb7qn6F4czMp2hKdBy@lists.linux.dev
X-Gm-Message-State: AOJu0Yz8i20WJUBiwoxov/HNKT93FyUr55M0KkKIh8FdCk16aMdsuQ3B
	0j5qQw8W9ZA2JiGUBNx0dHfJ7hZ1DyU+U7NlvhxOv3vcFaRdzxFfMHBN
X-Gm-Gg: ASbGncstR9tJJJb41fBjnq6yuBw9ybwO4rxvY6dvbIgQW6S6fkcnIPGhOq2eKXOPBME
	b5vqluHIdQIzQzTaXxnKHH136lZIG8gRJQAhrLzqDE6w2jLaMfmGczHzJKdlsTSrlJEx8e5/lwA
	gipVV3N23xpBnSIEHo0MfQlPANqUA3+Vgl9H1tLB9Y5/wg3SBVcN81th5M+UVYMUoy7aGIxrWrz
	yGmR3+Bzn90zQvYhLtM2b2HaXIKXpVktkRofGsxrDeJtE61jf1wB5F8c1m88f7GYxj5bGhK9+qT
	hyPqBTwXT/NPUpUiZcPZct++PtHoAI76xs4kQq7cIb123gWTyCWhwwJA+o/nBjIk+Yzb+9QYXwo
	iO8y2ERDVo5h7MlYiNSsGAYwcOr9iBqLFcMRkvgndK9txG8PlCmq59YGNjunMP2BFbPhL+KR4vu
	PbuK8=
X-Google-Smtp-Source: AGHT+IFLWmAN9G07TTGLUzgifyDJgAAk5U/8bI9uGvO0YQEdEpRvVcRB55hOrODs3UAIlksFawlP9Q==
X-Received: by 2002:a05:6214:1c0c:b0:802:3d9c:4450 with SMTP id 6a1803df08f44-87b21032734mr363621256d6.19.1760450498747;
        Tue, 14 Oct 2025 07:01:38 -0700 (PDT)
Received: from [192.168.0.155] ([170.10.253.128])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87bc35ad1b7sm92609116d6.58.2025.10.14.07.01.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Oct 2025 07:01:30 -0700 (PDT)
Message-ID: <8918310c-d0aa-4e02-b9d4-9aac98b0a48f@gmail.com>
Date: Tue, 14 Oct 2025 10:01:28 -0400
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: greybus: documentation: replace strncpy() with
 strscpy_pad()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: gregkh@linuxfoundation.org, johan@kernel.org, elder@kernel.org,
 schopin@ubuntu.com, me@abhy.me, greybus-dev@lists.linaro.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20251014134148.2597178-1-vivek.balachandhar@gmail.com>
 <aO5VvrKTswmfO-n9@stanley.mountain>
Content-Language: en-CA
From: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
In-Reply-To: <aO5VvrKTswmfO-n9@stanley.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Yes, Dan. Nice catch. Building it with below sample change:

memset(&intf_load.firmware_tag, 0, GB_FIRMWARE_U_TAG_MAX_SIZE);
strncpy((char *)&intf_load.firmware_tag, firmware_tag,
         GB_FIRMWARE_U_TAG_MAX_SIZE - 1);

If it works, will send another patch.

Best, Vivek.


On 2025-10-14 9:53 a.m., Dan Carpenter wrote:
> On Tue, Oct 14, 2025 at 01:41:48PM +0000, Vivek BalachandharTN wrote:
>> strncpy() does not guarantee NUL-termination and is deprecated for
>> NUL-terminated strings. Replace it with strscpy_pad(), which guarantees
>> NUL-termination and zero-pads the remaining bytes, matching the fixed-size
>> firmware tag semantics.
>>
>> Signed-off-by: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
>> ---
>>   .../greybus/Documentation/firmware/firmware.c        | 12 ++++++------
>>   1 file changed, 6 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/staging/greybus/Documentation/firmware/firmware.c b/drivers/staging/greybus/Documentation/firmware/firmware.c
>> index 3b35ef6d4adb..deac8584841b 100644
>> --- a/drivers/staging/greybus/Documentation/firmware/firmware.c
>> +++ b/drivers/staging/greybus/Documentation/firmware/firmware.c
> This is sample user space code so the strscpy_pad() isn't available.  It
> will break the compile.
>
> regards,
> dan carpenter
>
