Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AA7D29CA
	for <linux-staging@lists.linux.dev>; Wed, 26 Jan 2022 14:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1643206698;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1ezLTX17xe1yXWdb0ZwpAiPVrESUBhrTwQn5+FJRhKI=;
	b=e0Ko7ad6ynjwjazCTGEvXe2qgp0s+qm+4HJHQi3P+uQ5mYsZ8cOHwY+vsebbAvCOlne5Tg
	3p7uDKB/x8/l5AuS7rLb8jpQ3F0HtOezrIuO+LS5j16cn3srYIjW64Lc6UCCkzULQsnyrs
	CqFFsCaTr+8/Yx6g/zDstmI1anYQWW8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-353-1Iqb2mI4Ok6cfK_D8ln75A-1; Wed, 26 Jan 2022 09:18:17 -0500
X-MC-Unique: 1Iqb2mI4Ok6cfK_D8ln75A-1
Received: by mail-wm1-f71.google.com with SMTP id o140-20020a1ca592000000b00350aef3949aso1140084wme.5
        for <linux-staging@lists.linux.dev>; Wed, 26 Jan 2022 06:18:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=1ezLTX17xe1yXWdb0ZwpAiPVrESUBhrTwQn5+FJRhKI=;
        b=24zdWBMYf4N2wiHvM4FLigkOu/2ruh9EWp9xMUHlGGL2rD1zkH1TMZWfRRVNly3A9N
         aRao/amP+gDhA8J0ZKoH16WV0QQsHYTgG3ehV3G8IJmJyKn6sFUGUPzQdLeJOOPCb3qF
         Hx6RJFU4AWOY/HGqjSqzcLPRkjuImyh5xeQSXW3Oi2KPHmmvEKXLqhaSPQ7lNkY0aTdU
         OGsM+3eF9kro6jU2Nw5O49ccH2C1z/Cv4JYlf1hPwq3wWl0Dcjfo1GK1NSMcbmOPCe0m
         tH388NmcF2zmZq7qaV1kaEtUlbCRG8cXVtYvLh0lv+GmqiRA5NVZ3d4qistA9/advz4/
         14kA==
X-Gm-Message-State: AOAM533acgEeZLJWT/5069dgKQmMA1vYTl1EUFx9AEIqUPW/4fUOmqzq
	v2qKVgQNPIw/NnZpfKti6rABkz/IQBJyJLdXszQa7W5ptRYDVp0HBNzqxWkPhRQlbQVoYyyDoZk
	03PuSH2UwEZWj77Y9VeyREpGptg==
X-Received: by 2002:a5d:6f10:: with SMTP id ay16mr14738842wrb.183.1643206696018;
        Wed, 26 Jan 2022 06:18:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxksbfhCZ7SXr+6tjwoPU4RHnla2jY/kkMOPccD237O672NRHo7t0lUaWXxaaOjf6TiGCJImw==
X-Received: by 2002:a5d:6f10:: with SMTP id ay16mr14738822wrb.183.1643206695782;
        Wed, 26 Jan 2022 06:18:15 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
        by smtp.gmail.com with ESMTPSA id o14sm9828896wry.104.2022.01.26.06.18.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jan 2022 06:18:15 -0800 (PST)
Message-ID: <3430838d-1c63-da49-b774-c5a883e7085f@redhat.com>
Date: Wed, 26 Jan 2022 15:18:14 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v1 0/4] fbtft: Unorphan the driver for maintenance
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Helge Deller <deller@gmx.de>, Thomas Zimmermann <tzimmermann@suse.de>,
 Andy Shevchenko <andy@kernel.org>, linux-fbdev@vger.kernel.org,
 Michael Hennerich <michael.hennerich@analog.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Phillip Potter <phil@philpotter.co.uk>,
 Carlis <zhangxuezhi1@yulong.com>, Lee Jones <lee.jones@linaro.org>,
 Heiner Kallweit <hkallweit1@gmail.com>
References: <20220125202118.63362-1-andriy.shevchenko@linux.intel.com>
 <991e988b-7225-881b-a59a-33c3eae044be@suse.de>
 <CAHp75Vc2cjHkJwNSiJ-HSWBG=DYy68uvD7QQzNdRp3mQxoY1nw@mail.gmail.com>
 <3877516e-3db3-f732-b44f-7fe12b175226@gmx.de>
 <b13c0634-e766-74db-ab1f-672f5d0c04d6@redhat.com>
 <YfFMSkhbvHaR0YNE@smile.fi.intel.com>
 <f6ffe9bb-8683-4061-c876-1d559267ebae@redhat.com>
 <YfFWmmJFtEB93jUi@smile.fi.intel.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <YfFWmmJFtEB93jUi@smile.fi.intel.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1/26/22 15:11, Andy Shevchenko wrote:
> On Wed, Jan 26, 2022 at 02:47:33PM +0100, Javier Martinez Canillas wrote:
>> On 1/26/22 14:27, Andy Shevchenko wrote:
>>> On Wed, Jan 26, 2022 at 12:18:30PM +0100, Javier Martinez Canillas wrote:
>>>> On 1/26/22 11:59, Helge Deller wrote:
>>>>> On 1/26/22 11:02, Andy Shevchenko wrote:
> 
> ...
> 
>>>>>> P.S. For the record, I will personally NAK any attempts to remove that
>>>>>> driver from the kernel. And this is another point why it's better not
>>>>>> to be under the staging.
>>>>>
>>>>> I agree. Same as for me to NAK the disabling of fbcon's acceleration
>>>>> features or even attempting to remove fbdev altogether (unless all
>>>>> relevant drivers are ported to DRM).
>>>>
>>>> But that will never happen if we keep moving the goal post.
>>>>
>>>> At some point new fbdev drivers should not be added anymore, otherwise
>>>> the number of existing drivers that need conversion will keep growing.
>>>
>>> This thread is not about adding a new driver.
>>
>> It was about adding a new drivers to drivers/video/ (taken from staging).
> 
> Does it mean gates are open to take any new fbdev drivers to the staging?
> If not, I do not see a point here.
> 

Good question. I don't know really.

But staging has always been more flexible in what's accepted there and
that's why some distros avoid to enable CONFIG_STAGING=y in the kernel.

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

