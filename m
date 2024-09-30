Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B593017B433
	for <linux-staging@lists.linux.dev>; Mon, 30 Sep 2024 08:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727684883; cv=none; b=c1tWvu2pRJfsubxjrkb4Sh2SxJqybWHiVNI45xOLohJAYShv5Sipxqc5EL9TMMNVMRAM5p8q20lCXJSiz6RcEs/vcG4v/CpdAobFq2FKkVvOgt39pHBZpLeKP1NyzEDSPcyyFYU51yd9C4J28nlYt72kxoJsyELXIAExZVOviXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727684883; c=relaxed/simple;
	bh=/KD4yic1tli4acL5VBbKB1+MQngCqbT0zGDn7ckq8Ig=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wk/JDJkFvYDZN1rnchFej4IJYMKoZqTio43+aS/55HdGtYk2JU2qoaw8o4RpruKsk/ANVON9f3FopfBDIdXNxcLqktQUVL3oRnK9wHBC+ws0odBHKlz94GpciDNi+9nfeAp7Ra8iyrkh8zDHvqZ+h1cZrQxcdgqHTyptW9BYWyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XKVgvIiP; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XKVgvIiP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1727684879;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sDU+RimjAAL3vNJr/8wALHfm0p2c+7kTQQWyP5C3KLU=;
	b=XKVgvIiPf7w6aOsAd/tlbffNnKIPr/JDz54pFYRRH0AqAy3clclOTsjPFiXQl1Z7s6q2pB
	mIwfyd+g/ALvIo2g10PPhxa0+mxu52HJm+YdI9H9cAZwm3wF76T/fXHNc+wiEa1ThxKiSt
	uL/XWzXbXLXp/xt0WUQUhR6fQi177GQ=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-224-nPcXU9IoMQKX1ZDbunYLXg-1; Mon, 30 Sep 2024 04:27:55 -0400
X-MC-Unique: nPcXU9IoMQKX1ZDbunYLXg-1
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-5c87a33e5bfso4024199a12.2
        for <linux-staging@lists.linux.dev>; Mon, 30 Sep 2024 01:27:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727684874; x=1728289674;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sDU+RimjAAL3vNJr/8wALHfm0p2c+7kTQQWyP5C3KLU=;
        b=LukK1gtxrht2R+IQ3krm5HRmCWa1F3sBYmQ9YA6lf8atYVEdh49p+oD5vAH1XEffzF
         Lsw18dq+h/SltIqZF7aFartWHn0JywjMg/RTd708P75G30wDQ7y3gxGrHOJUhksx2HU5
         fzNGe+5C4zlrXP1UlXwfKXbmQVA+HbsIMCbZVo0fHWrsMF2zV2a4kmIMGrZuzwgFSmMO
         zNkmnQ44VLokAsUbnhS5oywTY3ytn9h4Cy1jSVkQC1uTcUl2BPqMUaH1M59/xmJsy6Uc
         Wmgr7SRZEMTqn4lvwb+rSDxAfDQpoHNj/42YYQelqSsD6d3zpUfOZqFwYvJi4+RJEQ3g
         iI5A==
X-Forwarded-Encrypted: i=1; AJvYcCWp3zrQiCRjb2jv5AKZds2kG9Ix73Mk85VSEji+E4GujfW6rMQMDOGEj3mLwVIPkOeLetgnbmm08uAXZMsS@lists.linux.dev
X-Gm-Message-State: AOJu0YzaXlz+RtetiI+0e2J+Hh7OGek5V5GuprUKdTtoJ7uwGKxmkzhv
	DPB2by7tpECAAOH7e6HjT782QuTvqMxYIV4ynzmpN8slyj7k3kgr4tHpMaExx8nnoZ+0E3wbPXr
	98j+zms29gd6tr4QYJeoQRdg3R1nqK5mMq/g1N4P6fL7DN9yODv+t641K4hCYIRw=
X-Received: by 2002:a17:906:dc92:b0:a93:c2b1:738f with SMTP id a640c23a62f3a-a93c4ab15ffmr1095637966b.64.1727684874215;
        Mon, 30 Sep 2024 01:27:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGOA2SnqaGeHXSaIOulX3uQDWKXvptoCf9oRU/ysVfNevdX1YHCxCHWYLJbVMXdwwUmeF1lig==
X-Received: by 2002:a17:906:dc92:b0:a93:c2b1:738f with SMTP id a640c23a62f3a-a93c4ab15ffmr1095636966b.64.1727684873884;
        Mon, 30 Sep 2024 01:27:53 -0700 (PDT)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c2946f78sm493359966b.110.2024.09.30.01.27.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Sep 2024 01:27:52 -0700 (PDT)
Message-ID: <8062d702-9426-408e-b3e5-3a33d81d2927@redhat.com>
Date: Mon, 30 Sep 2024 10:27:51 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] media: atomisp: Use max() macros
To: David Laight <David.Laight@ACULAB.COM>,
 'Ricardo Ribalda' <ribalda@chromium.org>, Benoit Parrot <bparrot@ti.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andy Shevchenko <andy@kernel.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>
References: <20240927-cocci-6-12-v1-0-a318d4e6a19d@chromium.org>
 <20240927-cocci-6-12-v1-3-a318d4e6a19d@chromium.org>
 <c183afe8986d444a8e777ae0b9bb9189@AcuMS.aculab.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <c183afe8986d444a8e777ae0b9bb9189@AcuMS.aculab.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 29-Sep-24 11:34 PM, David Laight wrote:
> From: Ricardo Ribalda
>> Sent: 27 September 2024 10:42
>>
>> The max() macro produce nicer code and also fixes the following cocci
>> errors:
>>
>> drivers/staging/media/atomisp/pci/sh_css_frac.h:40:17-18: WARNING opportunity for max()
>> drivers/staging/media/atomisp/pci/sh_css_frac.h:50:17-18: WARNING opportunity for max()
>>
>> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
>> ---
>>  drivers/staging/media/atomisp/pci/sh_css_frac.h | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/staging/media/atomisp/pci/sh_css_frac.h
>> b/drivers/staging/media/atomisp/pci/sh_css_frac.h
>> index 8ba65161f7a9..9642506d2388 100644
>> --- a/drivers/staging/media/atomisp/pci/sh_css_frac.h
>> +++ b/drivers/staging/media/atomisp/pci/sh_css_frac.h
>> @@ -37,7 +37,7 @@ static inline int sDIGIT_FITTING(int v, int a, int b)
>>  	int fit_shift = sFRACTION_BITS_FITTING(a) - b;
>>
>>  	v >>= sSHIFT;
> 
> IIRC right shifts of signed values are undefined.
> (C does not require a cpu to have a right shift that replicates the
> sign bit.)
> 
>> -	v >>= fit_shift > 0 ? fit_shift : 0;
>> +	v >>= max(fit_shift, 0);
> 
> If the shift isn't done the return value is garbage.
> So the code better not let it happen.
> In which case you might as well let the cpu generate a (different)
> random value - so delete the conditional.

Given the history of this code I would no be surprised if some
weird corner case actually relies on the check, so NACK for
dropping the conditional.

> 
>>
>>  	return clamp_t(int, v, sISP_VAL_MIN, sISP_VAL_MAX);
> 
> all three values seem to be 'int' - so no need for the _t variant
> and all the associated casts.

sDIGIT_FITTING() originally was a macro with a bunch of max() + min()
calls nested leading to it expanding to a lot of code after running it
through the pre-processor. When converting this to a static online to
choice was made to with clamp_t() to avoid the overhead of the extra
type checks in regular clamp().

Regards,

Hans




> 
>>  }
>> @@ -47,7 +47,7 @@ static inline unsigned int uDIGIT_FITTING(unsigned int v, int a, int b)
>>  	int fit_shift = uFRACTION_BITS_FITTING(a) - b;
>>
>>  	v >>= uSHIFT;
>> -	v >>= fit_shift > 0 ? fit_shift : 0;
>> +	v >>= max(fit_shift, 0);
>>
>>  	return clamp_t(unsigned int, v, uISP_VAL_MIN, uISP_VAL_MAX);
> 
> as above, but it is just min(v, iISP_VAL_MAX)
> 
> 	David
> 
>>  }
>>
>> --
>> 2.46.1.824.gd892dcdcdd-goog
>>
> 
> -
> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
> Registration No: 1397386 (Wales)

