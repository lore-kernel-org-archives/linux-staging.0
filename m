Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39DC03C26
	for <linux-staging@lists.linux.dev>; Fri,  1 Aug 2025 07:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754032753; cv=none; b=C5h6uvpqHB+XkeLdx38cHDwPMOd5LfzVzLnu51v7O+ozXbPz+wDV5R4KhPWftJgzA6Ax89LTDEGud0s2Q6St6tmc7KJyZOb+3jIuvWAKci8togWYVnPn3ycADjsTQeAO07lCu7zWMSxhLKgIJW1k48qL2xUOM+hWsNaBGAmVbGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754032753; c=relaxed/simple;
	bh=Mbl+RyTD2gFwGo7uHhpS/tKBW0RUI/sFTtJ1XeFL9Z8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dCVPDDiO01n7nOejcDv02dWWkIUDI2Qb+TgxJSn4nCY+408fUTlHsF1S8yZaEw6MGxKZ37asd8qVoP9KCekAd//+rnXFyi4pFsCGlmpJf11MpisvgGBZXuJlH/D2xdtY18J3nNQn2ubdBQxIEF3zY3R8WxLoOwtqgUNWWclk/oA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ByR6xqFs; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ByR6xqFs"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-615c8ca53efso1617599a12.2
        for <linux-staging@lists.linux.dev>; Fri, 01 Aug 2025 00:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754032750; x=1754637550; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GZwv/qzs+19lK98+ODjU5waUBilwF5SbMGy7Dm5005I=;
        b=ByR6xqFsoEK7g+EL+fNXuBnslLiP3IqATPT3Ky13LbrLcHQBTv9qBVsOQBoXelmpna
         9TGRIIY4Yy89UZezD9FSKdqbTLpmhUbsPXUvzS3S8ioaqfS6dTeyCYn1FYjbc7JQpR9P
         OVaFBJ6bK5YQET4vqKP879hBr8lcEU8OoINLltOhR003sUNPqg1CoibOUEC+pDrn7uYz
         eIWfT9TI5sXnAquXGuAlBcQQAkpC4xPBWwqXRO+zePKov8G8mj2vcvUGqjASI1at+pnZ
         bUpCroIOaLyICUj8ZfbVVMBc96YJvv/99Th8RhEstV/djq8c7ZNC5hO4JzBm1TZsUZ9c
         JbOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754032750; x=1754637550;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GZwv/qzs+19lK98+ODjU5waUBilwF5SbMGy7Dm5005I=;
        b=UfblqAXmOFrF8M6zAtIJFFkyiA2ga2a12XrUA8WIB2XAom0dRkZaspYyF/sjZHhMdv
         Vp204pcw8gSjsoXMHOv7r1p+MMFdf7N3XA7XyU+VwjtIw/uWRrp4BDhVbKoO7PKjyzwn
         /ju/WM6n/02kQYo4VMJJZdK8RHw2fgGWtRKVDhqPo6MRgq+7L6wP5Msq8PEJ5e+piWZS
         tDR6Z0G8bva5RWYmuKbpny3xp0WmhXZA1kRQmjFxQn7SCKy8rzoP0WeOjwiyiNvGt0v+
         XpQkU1oDkoj6/U1knb4Jj4LRzVWcqagXmmGFywcp6XlC1IgfxUwXjh/OiH7ENjgFsqFt
         J8zg==
X-Forwarded-Encrypted: i=1; AJvYcCVQDnkqt6lGChwaLcxDjXrWc+Dql3YXAMgZ2Ikjov/WUp6zll6x5NNCUC95wK0fvcDDE2hksbHJAePuLtzx@lists.linux.dev
X-Gm-Message-State: AOJu0Ywr52lKjvQqFpGCjhi9qXMxzQehc8m1rsa2H4FVx3ZZBxn8ldRz
	FEcO/6c9a/SXtqm/zK/USNCpavzB1zC4+cW1oRx3/IVxdaAOme6kt+4p
X-Gm-Gg: ASbGncv+I3F58HxGbaO9iQWtHrSJIjpKLVpoP8chAN8xPoqbUW21K8vJQ56Lk87zVYh
	MbJ2V51q2V2++S7ZxRDsEaT4enQ8eVm0cgh8Yj29J0+8+4cmgik5CwsfS7wbqkGpz+vLXd9KH7O
	4R/5Cx8crRzkeFUYKuIgI9KaV3H+vQkRqfONw/7z1YmJPhqFTjFfvcjK3oi8uK1f8kKr9jzyBxl
	UqOWYY7WgNix9MH+miaQY097ySuLDfvTKmw2DXfWRds5zxNH+SJ1QSFfEr+fPYJMiaoXvXZO4cq
	WyfNS7dgXMV4T80S4Hlde5fcJgPRley7aX79XtaiHV8kO9elJkvJFUX4p0rGzGlECQ6tYPY7+NA
	Jid9ykIdUu1Xss/1q7S0bWKFz1GA27+ph4wUeq05NS+mOo/Buq6cO52yo9w==
X-Google-Smtp-Source: AGHT+IF0QDEuCcmr8EjWLA4qqb0NrlU2hIjfuVXZIQbkssIh/lLuqkGBQ0k0LDR4BAnagV3h88KFDQ==
X-Received: by 2002:a17:907:7f90:b0:ae3:c6a3:f833 with SMTP id a640c23a62f3a-af93173c5edmr167493266b.23.1754032750236;
        Fri, 01 Aug 2025 00:19:10 -0700 (PDT)
Received: from [192.168.0.101] (ip-77-25-33-2.web.vodafone.de. [77.25.33.2])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a218cf8sm242483366b.95.2025.08.01.00.19.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Aug 2025 00:19:09 -0700 (PDT)
Message-ID: <b77087d4-a80d-46e6-8d96-3ce976bc70d7@gmail.com>
Date: Fri, 1 Aug 2025 09:19:09 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] staging: rtl8723bs: move rtw_init_mlme_timer to
 core/rtw_mlme.c
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: gregkh@linuxfoundation.org, hdegoede@redhat.com,
 Larry.Finger@lwfinger.net, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250730104501.150270-1-straube.linux@gmail.com>
 <20250730104501.150270-4-straube.linux@gmail.com>
 <05bc4742-ef57-482b-a2af-23a7f238fd69@suswa.mountain>
Content-Language: en-US
From: Michael Straube <straube.linux@gmail.com>
In-Reply-To: <05bc4742-ef57-482b-a2af-23a7f238fd69@suswa.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Am 31.07.25 um 17:59 schrieb Dan Carpenter:
> On Wed, Jul 30, 2025 at 12:44:56PM +0200, Michael Straube wrote:
>> +static void _rtw_set_scan_deny_timer_hdl(struct timer_list *t)
>> +{
>> +	struct adapter *adapter =
>> +	timer_container_of(adapter, t, mlmepriv.set_scan_deny_timer);
> 
> You accidentally deleted a tab here.  This should have been:
> 
> 	struct adapter *adapter =
> 		timer_container_of(adapter, t, mlmepriv.set_scan_deny_timer);
> 
> regards,
> dan carpenter
> 
>> +
>> +	rtw_clear_scan_deny(adapter);
>> +}
> 
> [ snip ]
> 
>> -static void _rtw_set_scan_deny_timer_hdl(struct timer_list *t)
>> -{
>> -	struct adapter *adapter =
>> -		timer_container_of(adapter, t, mlmepriv.set_scan_deny_timer);
>> -
>> -	rtw_clear_scan_deny(adapter);
>> -}
> 

Hi Dan,
thank you for reviewing, I'll fix that up and send v2.

regards,
Michael
