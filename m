Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8249523A8
	for <linux-staging@lists.linux.dev>; Mon, 11 Jul 2022 09:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1657533345;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MA5ZaOhJo92YQ61ncW/UJMh3rFBdjKN5BoWV3QaxZ9c=;
	b=E5iacVHfm0IH7NB5fSAfBDz2ED0sPEp6le3nQC9/s2Jz8lbTpTE12Vwlma2nFIDXyKvCKk
	9Wo1w22wpk5nPzziv/oonUH1DXr7ornKDFkCgA+8Clr52HSvirH8Rn82W1Ood5VAVQKjao
	pCXxOg9RHJ0jVTSgJ0Z04phkj4kTmwo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-570-bfS5A5eqNg6fjefmWNzi3w-1; Mon, 11 Jul 2022 05:55:43 -0400
X-MC-Unique: bfS5A5eqNg6fjefmWNzi3w-1
Received: by mail-wm1-f71.google.com with SMTP id i184-20020a1c3bc1000000b003a026f48333so2520044wma.4
        for <linux-staging@lists.linux.dev>; Mon, 11 Jul 2022 02:55:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=MA5ZaOhJo92YQ61ncW/UJMh3rFBdjKN5BoWV3QaxZ9c=;
        b=uk2H37Y/z/zBkq9GDReBbq3eUJ+fJaqMFMTUyXeDpS60AdKyj3xLzXsJHiW9L9S8Bw
         mngd2+zIqEIwYm5WT0alIzfb1tDGtBjp2MJes6243zXykZTINsYt7KWGsxbk3RJlcx5K
         ts/Q6LYaBPjbDODKDCCNgey2YMc9+R0orJUl5IlNyWSXR8iuqh2YGIMjRbZYce1nUFNQ
         gKlaAwA21mzT32Cj/jYMaHK1eHgyngF8zmGAMhZWG/4SCnAJPPyPHcZAyaVJzRTjwI4F
         GvKvdGwG4fCHcvzk8ZXFO7D1Rn7v86JJ0khSgPWzOT94pkI3uqmI08+mdYp7fvOH0uzE
         W0tg==
X-Gm-Message-State: AJIora9yx9VULfdJzJ6rRL9vx0OxpA4SI2kJxeQ8fCcJU3h5fUF7Q7YB
	Dv4QdzZ7DlKYiplNUcG9iJeTlR07dd4pY6PRxs/RI6sLdNlnks76ki7i9ZemVvrRs0/8Ja8WJkn
	CL3eW68s8EJ6ymnLLhmJceLrVTQ==
X-Received: by 2002:a05:6000:1789:b0:21d:7699:3322 with SMTP id e9-20020a056000178900b0021d76993322mr15306713wrg.121.1657533342354;
        Mon, 11 Jul 2022 02:55:42 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sUoQnaxehC5bwBf8TE/c0PA+vwUXBQpfOU8OfFOIGn9eHb6353YMogg5vCqq5MsdafNl8ujA==
X-Received: by 2002:a05:6000:1789:b0:21d:7699:3322 with SMTP id e9-20020a056000178900b0021d76993322mr15306691wrg.121.1657533342105;
        Mon, 11 Jul 2022 02:55:42 -0700 (PDT)
Received: from [172.20.10.7] ([90.167.95.6])
        by smtp.gmail.com with ESMTPSA id e4-20020a5d5944000000b0021d4aca9d1esm6328286wri.99.2022.07.11.02.55.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Jul 2022 02:55:41 -0700 (PDT)
Message-ID: <f97ce354-ac15-1455-9593-a93fc09a4605@redhat.com>
Date: Mon, 11 Jul 2022 11:55:40 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 03/11] fbdev/vga16fb: Auto-generate module init/exit code
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de, daniel@ffwll.ch,
 sam@ravnborg.org, maxime@cerno.tech
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 dri-devel@lists.freedesktop.org
References: <20220707153952.32264-1-tzimmermann@suse.de>
 <20220707153952.32264-4-tzimmermann@suse.de>
 <4eb5b59f-2cce-e9d2-a244-4cbe7686fa47@redhat.com>
 <8f90b0d4-5d8b-b06d-4736-7807e013ee7f@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <8f90b0d4-5d8b-b06d-4736-7807e013ee7f@suse.de>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/11/22 10:01, Thomas Zimmermann wrote:
> Hi
> 
> Am 08.07.22 um 15:16 schrieb Javier Martinez Canillas:
>> On 7/7/22 17:39, Thomas Zimmermann wrote:
>>> Move vgag16fb's option parsing into the driver's probe function and
>>> generate the rest of the module's init/exit functions from macros.
>>> Keep the options code, although there are no options defined.
>>>
>>
>> Ah, I see now why you wanted to move the check to the probe function. If
>> is to allow this cleanup then discard that comment from previous patch
>> and I'm OK with the move.
>>
>> Maybe you could comment in patch 02/11 commit message that the check is
>> moved to the probe handler to allow this cleanup as a follow-up patch ?
> 
> Sure.
> 
> I mostly wanted to use module_platform_driver(). The options handling is 
> in the way.
>

Yes, I got it when looked at this patch.
 
>>
>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>> ---
>>>   drivers/video/fbdev/vga16fb.c | 35 ++++++++++-------------------------
>>>   1 file changed, 10 insertions(+), 25 deletions(-)
>>>
>>> diff --git a/drivers/video/fbdev/vga16fb.c b/drivers/video/fbdev/vga16fb.c
>>> index f7c1bb018843..e7767ed50c5b 100644
>>> --- a/drivers/video/fbdev/vga16fb.c
>>> +++ b/drivers/video/fbdev/vga16fb.c
>>> @@ -1321,12 +1321,21 @@ static int __init vga16fb_setup(char *options)
>>>   
>>>   static int vga16fb_probe(struct platform_device *dev)
>>>   {
>>> +#ifndef MODULE
>>> +	char *option = NULL;
>>> +#endif
>>>   	struct screen_info *si;
>>>   	struct fb_info *info;
>>>   	struct vga16fb_par *par;
>>>   	int i;
>>>   	int ret = 0;
>>>   
>>> +#ifndef MODULE
>>> +	if (fb_get_options("vga16fb", &option))
>>> +		return -ENODEV;
>>> +	vga16fb_setup(option);
>>> +#endif
>>> +
>>
>> I would just drop these ifdefery and have the option unconditionally.
>> It seems that's what most fbdev drivers do AFAICT.
> 
> Or can we kill it entirely? There are no actual options.
>

That sounds good to me as well.

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

