Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 281A029CA
	for <linux-staging@lists.linux.dev>; Mon, 31 Jan 2022 13:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1643637326;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uxP5Mrjf+1xZ7KSuCYa0gMdIvljGy5EAdecrXW+Lf8k=;
	b=RrE7kz0SThT16pWVOGYXKc77m/5/S1qVl3zgZSS9y5Sm9iSdzb7VKZKe1sBLIhwEzvUChN
	MeC5ExAYwNN9umMGj4jb7ee1pcVleElRnDDnR5KyjvtgxX53YzfohYVuj4taQ6274WzxdT
	/hD4SV0XIOgQQwStPcswzUHhKCRqwV8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-596-hh46qlWlNae1i05w2WhqIA-1; Mon, 31 Jan 2022 08:55:24 -0500
X-MC-Unique: hh46qlWlNae1i05w2WhqIA-1
Received: by mail-wm1-f72.google.com with SMTP id n7-20020a1c7207000000b0034ec3d8ce0aso5797128wmc.8
        for <linux-staging@lists.linux.dev>; Mon, 31 Jan 2022 05:55:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=uxP5Mrjf+1xZ7KSuCYa0gMdIvljGy5EAdecrXW+Lf8k=;
        b=fZboM/QHE6DlhqJq0FWcPSl6rkzIGy9ASQ+Xu3vM9yVJkBUiWZS5tJUaDKuzRZcd/n
         UfaEMINnS4o3XOe9uqKKEeB0mhVULFFekzHuNLRz4eE3d0tuTfItHIU3YANSF4+pfn8Y
         jAefa2EH6rB+lqiQon1z52H6aIK5Brw9tkilUeiYoyOlBtpBJGVYjzh0c3tVogtg875B
         4Kp0fO2/ZRMeIkAHXw6XkNvICxrWQpw4V4FNPehmUmoJ/O+/fxmocwVba+TgrQ4t/hXu
         nu5OppHXfzc0OexSSgXOSMVFIpXhdRIClPkdX00jEjgXp71Ep6gF8Q01ixkQnvdykNLO
         zPIA==
X-Gm-Message-State: AOAM530fha9jjnjVu004xSM6Ev8OKbYF7hfLEfOCE/gONfooWkVI7B2A
	9RxgPcUhyymsC7ehjl1gM12xk6pOROXCP3ilyPYVcYdQHhMYAi6IGFmAWpekDyJMDUZJEZPHpfI
	oOXAg/wGNszViak1KMzhMwMIS9Q==
X-Received: by 2002:a05:6000:1d90:: with SMTP id bk16mr8433823wrb.217.1643637323524;
        Mon, 31 Jan 2022 05:55:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxykLOKK2CGVGLz0uBfgClNQCdlGlX3BmOFsL6O11/UOpozm0OsthMj4NcXtotxC6SFW7L++A==
X-Received: by 2002:a05:6000:1d90:: with SMTP id bk16mr8433808wrb.217.1643637323330;
        Mon, 31 Jan 2022 05:55:23 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
        by smtp.gmail.com with ESMTPSA id h11sm8471273wmb.12.2022.01.31.05.55.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Jan 2022 05:55:22 -0800 (PST)
Message-ID: <29ab99fb-d906-907b-e922-251ac72b25ef@redhat.com>
Date: Mon, 31 Jan 2022 14:55:21 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v1 1/4] fbtft: Unorphan the driver
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Andy Shevchenko <andy@kernel.org>, linux-fbdev@vger.kernel.org,
 Michael Hennerich <michael.hennerich@analog.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller
 <deller@gmx.de>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Phillip Potter <phil@philpotter.co.uk>, Carlis <zhangxuezhi1@yulong.com>,
 Lee Jones <lee.jones@linaro.org>, Heiner Kallweit <hkallweit1@gmail.com>
References: <f671a112-880d-1526-a395-360947b40c5a@gmx.de>
 <YfEv7OQs98O9wJdJ@kroah.com> <YfFIpBb7lL4ukWjm@smile.fi.intel.com>
 <b8eb7111-43aa-cc8a-a1bc-f08e0f2987ed@redhat.com>
 <YfFV4EJosayH+e6C@smile.fi.intel.com> <YfFWPmG2D093gz4N@smile.fi.intel.com>
 <6e74d4cc-655a-e38e-0856-a59e4e6deb36@redhat.com>
 <c423a2f0-e7be-3884-3568-7629c7e9104e@redhat.com>
 <YffJujbpUGUqpIk/@smile.fi.intel.com>
 <5a3fffc8-b2d8-6ac3-809e-e8e71b66a8ea@redhat.com>
 <YffiwCiFnqF1X1pD@smile.fi.intel.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <YffiwCiFnqF1X1pD@smile.fi.intel.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1/31/22 14:23, Andy Shevchenko wrote:
> On Mon, Jan 31, 2022 at 01:08:32PM +0100, Javier Martinez Canillas wrote:
>> On 1/31/22 12:36, Andy Shevchenko wrote:
> 
> ...
> 
>>>> +config TINYDRM_SSD130X
>>>> +	tristate "DRM support for Solomon SSD130X OLED displays"
>>>> +	depends on DRM && OF && I2C
>>>
>>> Please, make sure that it does NOT dependent on OF.
>>>
>>
>> I actually added this dependency deliberative. It's true that the driver is using
>> the device properties API and so there isn't anything from the properties parsing
>> point of view that depends on OF. And the original driver didn't depend on OF.
>>
>> But the original driver also only would had worked with Device Trees since the
>> of_device_id table is the only one that contains the device specific data info.
>>
>> The i2c_device_id table only listed the devices supported to match, but then it
>> would only had worked with the default values that are set by the driver.
>>
>> So in practice it *does* depend on OF. I'll be happy to drop that dependency if
>> you provide an acpi_device_id table to match.
> 
> The code is deceptive and you become to a wrong conclusion. No, the driver
> does NOT depend on OF as a matter of fact. The tricky part is the PRP0001
> ACPI PNP ID that allows to reuse it on ACPI-based platforms.
>

Oh, I wasn't aware about PRP0001. I've read about it at:

https://www.kernel.org/doc/Documentation/acpi/enumeration.txt

> That said, please drop OF dependency.
>

Yes, got your point now and will drop the dep. Thanks for the explanation.

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

