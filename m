Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 724152F25
	for <linux-staging@lists.linux.dev>; Wed, 11 May 2022 17:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1652290484;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i8Xj3Dw4/gCq/23hJZh6ANAQmyEIEWC62NCXFqWSvVM=;
	b=DX/lDQxtqAFwclx/1dFmefJH51j/1t1W46UDZEaegMceXLEk2YODAVYWPRTvs5CrxqmDha
	LEIhhjc2YXctTRdEPsvn3gGYzcPML53lzdRk5kYsSuSZ0OynOypkQmLTm0XA1C3MhDcLJc
	nJ/Kd8V8WwAxMgRNwE0MnTKLyvuXxbE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-461-2EBnwFdROu2xbpimrDV6mg-1; Wed, 11 May 2022 13:34:41 -0400
X-MC-Unique: 2EBnwFdROu2xbpimrDV6mg-1
Received: by mail-wr1-f70.google.com with SMTP id w20-20020adfd1b4000000b0020cbb4347e6so1104048wrc.17
        for <linux-staging@lists.linux.dev>; Wed, 11 May 2022 10:34:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=i8Xj3Dw4/gCq/23hJZh6ANAQmyEIEWC62NCXFqWSvVM=;
        b=q0yn95LSTluev3hw5qEavyhp8TGSiQnwYZxLlcqBX0E1HWO4KzR1NlbTbqkszGIjwr
         98bKjSb5d9iYWNxdXW0tQ4ic0zbExP6wYlMbZ6KQvG2J6Dj3ARfgM7HLpiXNjOBtWNHj
         yDOCU4UTs1UlJOFJaPHszp5Qdl0Ktbuo2Q3P1buh+NhDmOKuUqhrp0t0IsW8NU70/Znm
         92CptCD/EM5IwsH6VqR6Joq+I7pg0YBwAr7o2MK60hdO+fzdTqybsLMm89jalUQXtGsO
         fl70xFdsOSW4C6KM/y2VmEjiLLriF+3waNDmHeOI+LkdW9XKt+O995n25eeQMMbxHxDR
         OHlg==
X-Gm-Message-State: AOAM532cpZdAVkeKncQp5z8vpAjuztGgRyEEkb5hfWrENJe3PRTsw+0Q
	n+s49gGZFTw7u3WwLJydpvVdd5f4U2g7PxjNu5OqqhhI3By084jmfHGXCE+osPVCfpFPtOKM1Ns
	ZhJ7nLAbGQBQ4IO3wd+EpshSg4A==
X-Received: by 2002:a05:6000:1d90:b0:20c:9efd:bd6b with SMTP id bk16-20020a0560001d9000b0020c9efdbd6bmr24725767wrb.605.1652290480061;
        Wed, 11 May 2022 10:34:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzMcxwINjwFHTGmrXrt5Rnjg0TtWgmfEnHBfAnBCyS2Fe9WQndQMx9qSymE6rAgB6QbCz2//w==
X-Received: by 2002:a05:6000:1d90:b0:20c:9efd:bd6b with SMTP id bk16-20020a0560001d9000b0020c9efdbd6bmr24725736wrb.605.1652290479835;
        Wed, 11 May 2022 10:34:39 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id g17-20020adfe411000000b0020c5253d91esm2156204wrm.106.2022.05.11.10.34.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 May 2022 10:34:39 -0700 (PDT)
Message-ID: <48f164af-99d2-9e74-e307-003be0677384@redhat.com>
Date: Wed, 11 May 2022 19:34:38 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v5 7/7] fbdev: Make registered_fb[] private to fbmem.c
To: Guenter Roeck <linux@roeck-us.net>, Sam Ravnborg <sam@ravnborg.org>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Helge Deller <deller@gmx.de>, Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 kernel test robot <lkp@intel.com>, Jens Frederich <jfrederich@gmail.com>,
 Jon Nettleton <jon.nettleton@gmail.com>, linux-staging@lists.linux.dev,
 Daniel Vetter <daniel.vetter@intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 Matthew Wilcox <willy@infradead.org>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Zhen Lei <thunder.leizhen@huawei.com>,
 Alex Deucher <alexander.deucher@amd.com>, Xiyu Yang
 <xiyuyang19@fudan.edu.cn>, Zheyu Ma <zheyuma97@gmail.com>
References: <20220511112438.1251024-1-javierm@redhat.com>
 <20220511113230.1252910-1-javierm@redhat.com> <YnvrxICnisXU6I1y@ravnborg.org>
 <8c84428c-2740-4046-74c9-298b854944d0@roeck-us.net>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <8c84428c-2740-4046-74c9-298b854944d0@roeck-us.net>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hello Guenter,

On 5/11/22 19:17, Guenter Roeck wrote:
> On 5/11/22 10:00, Sam Ravnborg wrote:

[snip]

>>>   struct fb_info *registered_fb[FB_MAX] __read_mostly;
>>> -EXPORT_SYMBOL(registered_fb);
>>> -
>>>   int num_registered_fb __read_mostly;
>>> +#if IS_ENABLED(CONFIG_FB_OLPC_DCON)
>>> +EXPORT_SYMBOL(registered_fb);
>>>   EXPORT_SYMBOL(num_registered_fb);
>>> +#endif
>>
>> It is stuff like this I refer to as "ugly" in the comment above.
>>
> 
> My "solution" for that kind of thing is to use a namespace,
> such as
> 
> EXPORT_SYMBOL_NS(registered_fb, FB_OLPC_DCON);
> EXPORT_SYMBOL_NS(num_registered_fb, FB_OLPC_DCON);
>

Using a namespace in this case is indeed a great idea I think.

I've used in the past to limit the export of a symbol for within a driver
that could be scattered across different compilations units, but it never
occurred to me using it to limit symbols exported by core code.
 
> and import it from the offending code. That avoids ifdefs
> while at the same time limiting the use of the symbols
> to the expected scope. Of course that could be abused but
> that abuse would be obvious.
>

Agreed. For the next revision, besides using an namespaced export symbol
as you suggested, I'll include a comment to make clear that it shouldn't
by any other driver and FB_OLPC_DCON fixed instead.


-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

