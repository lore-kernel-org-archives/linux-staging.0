Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71805C14D
	for <linux-staging@lists.linux.dev>; Mon,  4 Sep 2023 15:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693841189;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3w9m5Kyek9McC6DIqWL/AU9aeKuaClRRwuI23BVEZVQ=;
	b=GEO5pWuW+796+9zS7TTx4G3A3BX7uE08soZAQP/szGAwIfFw7FrTptTov7oj9pTGHWQglA
	bQi3et3MZ2euGsNSE2EUMdbDVijHhWbU2lyF27ieXwdskIDvJRKINVjcCd4Zrqvg8A3ywx
	liRwE59eJMNFLzQAOXbNjeOme4Xd3ck=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-583-coqvgAQcPlSrkeMWCKilRw-1; Mon, 04 Sep 2023 11:26:28 -0400
X-MC-Unique: coqvgAQcPlSrkeMWCKilRw-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-3fefea09bd0so10252425e9.0
        for <linux-staging@lists.linux.dev>; Mon, 04 Sep 2023 08:26:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693841187; x=1694445987;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3w9m5Kyek9McC6DIqWL/AU9aeKuaClRRwuI23BVEZVQ=;
        b=Yk3wlx7A8aURijLxG/oktWH0CqNpKGvrqwLefttsSH2q75jqq5fuwGuT6q5nXfzfSC
         tBr589543aX0tCT4rHniZqU4YycjT2thu52vJiWCcCknaaN28vMcSQam86pK5OCdDnBP
         iJeuqQSmYgc7LHbtRgYyYSuQl2zJmTCoFVdRsHLWLtjdMop1ckyqEdg+HRgjJIrGCDkX
         6ABT4ZBR93grfQFsAPWV+D4XVbJBfq0WRywuse6ABXNixsglFb6t5Ijfpn3WjxzP8dcR
         /MdHGLS8lQokaEXk0QCNXrwZk7gDnqWRCbEJMyg1ybK2qZrHbKSMBk12VoyiQLrYSVbo
         dVnA==
X-Gm-Message-State: AOJu0YyK/i9s8NQGiWwlFo+F5gmAMoHtFRkXK+jtrzF513PuQNnMq2wi
	yBOvt/qHvlM0vjzrSbzi4Zy2cRVcCaL5qE3Kylu8OaNS5NXF+0fW31Zh7vYV272irkx14kjdpnv
	NTaRrUDLho+tnWd8C7Fce4kCETw==
X-Received: by 2002:a05:600c:230a:b0:401:aa8f:7566 with SMTP id 10-20020a05600c230a00b00401aa8f7566mr7184370wmo.26.1693841187211;
        Mon, 04 Sep 2023 08:26:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH/QgrG9ZZeCMMajoiNwd74ytk48aIpSmfM9Lf3C5BkHGpRWOhGbvtZxEvbd/m0qpvgeZC8gA==
X-Received: by 2002:a05:600c:230a:b0:401:aa8f:7566 with SMTP id 10-20020a05600c230a00b00401aa8f7566mr7184357wmo.26.1693841186846;
        Mon, 04 Sep 2023 08:26:26 -0700 (PDT)
Received: from localhost (156.pool92-189-221.dynamic.orange.es. [92.189.221.156])
        by smtp.gmail.com with ESMTPSA id p15-20020a5d68cf000000b0031416362e23sm14937968wrw.3.2023.09.04.08.26.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Sep 2023 08:26:26 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de, daniel@ffwll.ch,
 sam@ravnborg.org
Cc: Steve Glendinning <steve.glendinning@shawell.net>,
 linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-hyperv@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-input@vger.kernel.org
Subject: Re: [PATCH 1/8] fbdev/smscufx: Use fb_ops helpers for deferred I/O
In-Reply-To: <b9b985e7-4f60-7c59-3121-b26b07b13b03@suse.de>
References: <20230828132131.29295-1-tzimmermann@suse.de>
 <20230828132131.29295-2-tzimmermann@suse.de>
 <877cp66qmp.fsf@minerva.mail-host-address-is-not-set>
 <b9b985e7-4f60-7c59-3121-b26b07b13b03@suse.de>
Date: Mon, 04 Sep 2023 17:26:25 +0200
Message-ID: <871qfe6jtq.fsf@minerva.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Hi Javier
>
> Am 04.09.23 um 14:59 schrieb Javier Martinez Canillas:
>> Thomas Zimmermann <tzimmermann@suse.de> writes:
>> 
>> Hello Thomas,
>> 
>>> Generate callback functions for struct fb_ops with the fbdev macro
>>> FB_GEN_DEFAULT_DEFERRED_SYSMEM_OPS(). Initialize struct fb_ops to
>>> the generated functions with fbdev initializer macros.
>>>
>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>> Cc: Steve Glendinning <steve.glendinning@shawell.net>
>>> ---
>> 
>> The patch looks good to me, but I've a question below.
>> 
>> Acked-by: Javier Martinez Canillas <javierm@redhat.com>
>> 
>>>   drivers/video/fbdev/smscufx.c | 85 +++++++++--------------------------
>>>   1 file changed, 22 insertions(+), 63 deletions(-)
>>>
>>> diff --git a/drivers/video/fbdev/smscufx.c b/drivers/video/fbdev/smscufx.c
>> 
>> [...]
>> 
>>>   static const struct fb_ops ufx_ops = {
>>>   	.owner = THIS_MODULE,
>>> -	.fb_read = fb_sys_read,
>>> -	.fb_write = ufx_ops_write,
>>> +	__FB_DEFAULT_DEFERRED_OPS_RDWR(ufx_ops),
>>>   	.fb_setcolreg = ufx_ops_setcolreg,
>>> -	.fb_fillrect = ufx_ops_fillrect,
>>> -	.fb_copyarea = ufx_ops_copyarea,
>>> -	.fb_imageblit = ufx_ops_imageblit,
>>> +	__FB_DEFAULT_DEFERRED_OPS_DRAW(ufx_ops),
>>>   	.fb_mmap = ufx_ops_mmap,
>> 
>> There are no generated functions for .fb_mmap, I wonder what's the value
>> of __FB_DEFAULT_DEFERRED_OPS_MMAP() ? Maybe just removing that macro and
>> setting .fb_mmap = fb_deferred_io_mmap instead if there's no custom mmap
>> handler would be easier to read ?
>
> At least two drivers could use __FB_DEFAULT_DEFERRED_OPS_MMAP: 
> picolcd-fb and hyperv_fb. At some point, we might want to set/clear 
> fb_mmap depending on some Kconfig value. Having 
> __FB_DEFAULT_DEFERRED_OPS_MMAP might be helpful then.
>

Got it, thanks for the explanation.

>> 
>> Alternatively, __FB_DEFAULT_DEFERRED_OPS_MMAP() could still be left but
>> not taking a __prefix argument since that is not used anyways ?
>
> The driver optionally provides mmap without deferred I/O, hence the mmap 
> function. That makes no sense, as these writes to the buffer would never 
> make it to the device memory. But I didn't want to remove the code 
> either. So I just left the existing function as-is. Usually, the 
> deferred-I/O mmap is called immediately. [1]
>

Makes sense.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

