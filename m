Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FEE7185B
	for <linux-staging@lists.linux.dev>; Wed, 20 Apr 2022 15:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1650469673;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g4zx1+iaFnljCivWLV5r3ZrNdjPIVxfvxiAee1dsRow=;
	b=JlXBgvLJwjrsuTRhq7ihVCorAGCyCRC/KJG4MEIkoxOtzb0oWWvjMkanUKTTY4OPskIF3V
	UWL2x/vnrZu29xv/s2SATdu/oG1MGst4Fs8q/Z04/Pp+uHTrqZIVoG4l72/XbqCsQEsn+F
	KauwYl2rLlRs6Sh0xJCOKklIdci0wnM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-316-LJp1fBKBMDSGUZea4Yazag-1; Wed, 20 Apr 2022 11:47:52 -0400
X-MC-Unique: LJp1fBKBMDSGUZea4Yazag-1
Received: by mail-wm1-f69.google.com with SMTP id d6-20020a05600c34c600b0039296a2ac7cso1137009wmq.1
        for <linux-staging@lists.linux.dev>; Wed, 20 Apr 2022 08:47:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=g4zx1+iaFnljCivWLV5r3ZrNdjPIVxfvxiAee1dsRow=;
        b=wx23KU/91STtbXmgov9gFfde3SPcog1XsQYbGR2byNqDzizdN62FOKagUd9CJa+ZH4
         owx53rKAb5aqEjraVEpSAo4dEUhMvnoU8krfYKBYQlFUSg2KFrWbOxV0TbLF3EdBOIxa
         hlnxLPIYn1rmHsSaNNlARzBPX0v+535aDNsbig6EBaBcVMKeC9dehim4ohi3dn0FtagG
         1joRRtwHeNWss9eGM795i53b/zVr2Vp3WrFtmgFbi2wxYde4SM2XxtyFBE1BkH3ec7DE
         BYT5TTXVu5odrQZCRvKtPnRP0JlkYZIxuEFNUWfodqdC1BG6XUeRZ4Dpfzj6JAkV4Jem
         ygaA==
X-Gm-Message-State: AOAM53366sErypdNibxI/Gg2ktWXELE4Z11nCOE/0zpUJcjXAboGaZn5
	nAqf7DISorvs760yTIWYHy8xcEQuSlg2FCabfxV4zZr1vgOg1EZG6TAvJ0YabbQskajO0auvLTk
	uc9YQqYbkNQqWUDDwPx6xkPxTYg==
X-Received: by 2002:a5d:522d:0:b0:207:a11d:edf5 with SMTP id i13-20020a5d522d000000b00207a11dedf5mr16194844wra.60.1650469670964;
        Wed, 20 Apr 2022 08:47:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz8WUIYjdcVWdqmj4AO4brA33DVhgGSAEP3X+EOPWZZEYpduVkk/X5bHxcW5UEIED0Fk9af+w==
X-Received: by 2002:a5d:522d:0:b0:207:a11d:edf5 with SMTP id i13-20020a5d522d000000b00207a11dedf5mr16194835wra.60.1650469670712;
        Wed, 20 Apr 2022 08:47:50 -0700 (PDT)
Received: from [192.168.1.129] ([92.176.231.205])
        by smtp.gmail.com with ESMTPSA id z18-20020a5d6552000000b00207b65f745bsm152396wrv.83.2022.04.20.08.47.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Apr 2022 08:47:50 -0700 (PDT)
Message-ID: <e4f56999-cf58-abff-edf5-ae11d024012b@redhat.com>
Date: Wed, 20 Apr 2022 17:47:49 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] Staging: fbtft: Fix style problem in header
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Ian Cowan <ian@linux.cowan.aero>
Cc: gregkh@linuxfoundation.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, dri-devel@lists.freedesktop.org
References: <20220419192128.445023-1-ian@linux.cowan.aero>
 <20220420064711.xuhuyhtgcrs3avhk@pengutronix.de> <YmARR6+XQeVqlusK@fedora>
 <20220420143608.yuxleiffs234dfog@pengutronix.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220420143608.yuxleiffs234dfog@pengutronix.de>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 4/20/22 16:36, Uwe Kleine-König wrote:
> Hello Ian,
> 
> On Wed, Apr 20, 2022 at 09:57:27AM -0400, Ian Cowan wrote:
>> On Wed, Apr 20, 2022 at 08:47:11AM +0200, Uwe Kleine-König wrote:
>>> On Tue, Apr 19, 2022 at 03:21:28PM -0400, Ian Cowan wrote:
>>>> Removed an unnecessary semicolon at the end of a macro call
>>>>
>>>> Signed-off-by: Ian Cowan <ian@linux.cowan.aero>
>>>> ---
>>>>  drivers/staging/fbtft/fbtft.h | 2 +-
>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/staging/fbtft/fbtft.h b/drivers/staging/fbtft/fbtft.h
>>>> index 2c2b5f1c1df3..aa66760e1a9c 100644
>>>> --- a/drivers/staging/fbtft/fbtft.h
>>>> +++ b/drivers/staging/fbtft/fbtft.h
>>>> @@ -277,7 +277,7 @@ static const struct of_device_id dt_ids[] = {					\
>>>>  	{ .compatible = _compatible },						\
>>>>  	{},									\
>>>>  };										\
>>>> -MODULE_DEVICE_TABLE(of, dt_ids);
>>>> +MODULE_DEVICE_TABLE(of, dt_ids)
>>>
>>> In fact the ; after MODULE_DEVICE_TABLE is necessary. There is only a
>>> single instance in the kernel without a semicolon[1]. That's in
>>> drivers/pci/controller/pcie-microchip-host.c and this only works because
>>> this driver cannot be compiled as a module and so MODULE_DEVICE_TABLE
>>> evaluates to nothing. Will send a patch for that one.
>

Indeed. I was curious about this so I went to look at the driver code.

For this particular driver it may be not necessary, but that's just due
how these fbtft drivers define their MODULE_DEVICE_TABLE(), using a lot
of macro layers.

As an example, drivers/staging/fbtft/fb_agm1264k-fl.c does the following:

FBTFT_REGISTER_DRIVER(DRVNAME, "displaytronic,fb_agm1264k-fl", &display);

which is defined as:

#define FBTFT_REGISTER_DRIVER(_name, _compatible, _display)                \
...									   \
FBTFT_DT_TABLE(_compatible)						   \
...

which in turn is defined as:

#define FBTFT_DT_TABLE(_compatible)						\
static const struct of_device_id dt_ids[] = {					\
	{ .compatible = _compatible },						\
	{},									\
};										\
MODULE_DEVICE_TABLE(of, dt_ids);

so it seems that it builds, just because the semicolon for the expression
is the one that's after the FBTFT_REGISTER_DRIVER(); in the driver.

> FTR: Patch was sent: https://lore.kernel.org/linux-pci/20220420065832.14173-1-u.kleine-koenig@pengutronix.de
> 
>> When I built this, it appeared to succeed. I used the command "make
>> M=/drivers/staging/fbtft modules". Is this incorrect? For reference this
>> is my first patch so it's highly likely I did this incorrectly.
>

You are just changing a header file though, did you also enable one of the
fbtft drivers as a module to see if those build? But as said, by looking at
the code it seems that should build correctly.

I agree with Uwe though that is less confusing to have a semicolon after
the MODULE_DEVICE_TABLE(), but I'm not the driver maintainer to decide.
 
> I don't know for sure, but I'd have said that the M= stuff is for
> out-of-tree modules only.
>

It does work, I use M= to build drivers in mainline that are configured
to build as a module all the time.

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

