Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ED42C13A
	for <linux-staging@lists.linux.dev>; Mon,  4 Sep 2023 15:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693841302;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zrkFFETteuVae/tXCmZrIh7LT8QUm9zk2gxUS8x5iBg=;
	b=Ng4//mxVEHJNCcbGf4HvXFv841XaYXBNtfUaYYCQzpk88TihdXGvnoOzUSg+lZi/RqvD5u
	HYATYOzNiUQiXIQDFNC371m6OtAWmoZ4q3cWRGppMjjbLCj5yVvLOp0a5bPz+BQyvEQkLj
	Qg1GtzsRmnDmHZa5dZsuAHFkRkwng0Y=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-599-8TZiy6dxNw-s73oG-U5iRA-1; Mon, 04 Sep 2023 11:28:21 -0400
X-MC-Unique: 8TZiy6dxNw-s73oG-U5iRA-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-31c5adb698aso797692f8f.2
        for <linux-staging@lists.linux.dev>; Mon, 04 Sep 2023 08:28:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693841300; x=1694446100;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zrkFFETteuVae/tXCmZrIh7LT8QUm9zk2gxUS8x5iBg=;
        b=Uh23lCdDWVYo6Rl6JvKYVvKySt4EdkQrD9VwVgxp7kqDcteNPnU0EuwZLpL+bR5s/1
         QJlvPJYMO0OkFlaSfVCoTeP69tDP7YMEYKq3TmcWqtpXX8LqI3a2LaSAfdOkfzzkPQU3
         6c5DGU0GnODdrloZPhwDFQdbneQEux+uINe8wEwHxYZHvBEsSHBiLLglWa/P9oO95AmU
         G9A3IrGmclaYU9XIT85wp0ByCw2agHRmfqhJCwORrPGTgsGVRSAnZQ8YNvqYyBlRGoZ5
         9W3M7+oRLgDOODCEdQZmJX4EUEyZ+N2lIq/9r6QhnClj3d95Qu4K8LQKpqbLGNBURaBU
         ZyKA==
X-Gm-Message-State: AOJu0YzHZvp6/3szj4jc6CrtWGVC7WmoHg4dC/29dhbEGu//Juoxdfyl
	BhpGLb/JHfICNlcr2ovcoIjvni8bniUTs0LtFkof65fHhgvSNCg7E3ZVB7n23CGw52gPdWGKtmM
	DMBEms4QpzEjWyGsJmYCJPZJaYA==
X-Received: by 2002:a05:6000:151:b0:317:5d60:2fea with SMTP id r17-20020a056000015100b003175d602feamr8786753wrx.52.1693841299901;
        Mon, 04 Sep 2023 08:28:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEqr9n5OuCxsaX4v3hREg3LRHhHWX1kh5NPq1tl5TVMsK10UjE7B2EYUhMfWqJeDR4jr+Z45A==
X-Received: by 2002:a05:6000:151:b0:317:5d60:2fea with SMTP id r17-20020a056000015100b003175d602feamr8786735wrx.52.1693841299613;
        Mon, 04 Sep 2023 08:28:19 -0700 (PDT)
Received: from localhost (156.pool92-189-221.dynamic.orange.es. [92.189.221.156])
        by smtp.gmail.com with ESMTPSA id e12-20020adf9bcc000000b0031759e6b43fsm11564376wrc.39.2023.09.04.08.28.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Sep 2023 08:28:19 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de, daniel@ffwll.ch,
 sam@ravnborg.org
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-hyperv@vger.kernel.org, dri-devel@lists.freedesktop.org, Bernie
 Thompson <bernie@plugable.com>, linux-input@vger.kernel.org
Subject: Re: [PATCH 2/8] fbdev/udlfb: Use fb_ops helpers for deferred I/O
In-Reply-To: <37906737-5ca3-7f46-af30-85a117875eea@suse.de>
References: <20230828132131.29295-1-tzimmermann@suse.de>
 <20230828132131.29295-3-tzimmermann@suse.de>
 <874jka6qd7.fsf@minerva.mail-host-address-is-not-set>
 <37906737-5ca3-7f46-af30-85a117875eea@suse.de>
Date: Mon, 04 Sep 2023 17:28:18 +0200
Message-ID: <87y1hm5565.fsf@minerva.mail-host-address-is-not-set>
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

> Am 04.09.23 um 15:05 schrieb Javier Martinez Canillas:
>> Thomas Zimmermann <tzimmermann@suse.de> writes:
>> 
>>> Generate callback functions for struct fb_ops with the fbdev macro
>>> FB_GEN_DEFAULT_DEFERRED_SYSMEM_OPS(). Initialize struct fb_ops to
>>> the generated functions with fbdev initializer macros.
>>>
>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>> Cc: Bernie Thompson <bernie@plugable.com>
>>> ---
>> 
>> Acked-by: Javier Martinez Canillas <javierm@redhat.com>
>> 
>> [...]
>> 
>>> +static void dlfb_ops_damage_range(struct fb_info *info, off_t off, size_t len)
>>> +{
>>> +	struct dlfb_data *dlfb = info->par;
>>> +	int start = max((int)(off / info->fix.line_length), 0);
>>> +	int lines = min((u32)((len / info->fix.line_length) + 1), (u32)info->var.yres);
>>> +
>>> +	dlfb_handle_damage(dlfb, 0, start, info->var.xres, lines);
>>> +}
>>> +
>>> +static void dlfb_ops_damage_area(struct fb_info *info, u32 x, u32 y, u32 width, u32 height)
>>> +{
>>> +	struct dlfb_data *dlfb = info->par;
>>> +
>>> +	dlfb_offload_damage(dlfb, x, y, width, height);
>>> +}
>>> +
>> 
>> These two are very similar to the helpers you added for the smscufx driver
>> in patch #1. I guess there's room for further consolidation as follow-up ?
>
> Maybe. I had patches that take the rectangle computation from [1] and 
> turn it into a helper for these USB drivers. But it's an unrelated 
> change, so I dropped them from this patchset.
>

Great and yes, I meant as separate patch-set, not as a part of this one.

> Best regards
> Thomas
>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

