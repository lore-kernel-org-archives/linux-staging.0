Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B60DD8BEE
	for <linux-staging@lists.linux.dev>; Fri, 19 May 2023 13:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684501686;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EjMFXtiDUpEHJ5eWhE6OyqiD+1wNtDFrOVeQDIPCrpg=;
	b=N5KemXcIuez0+LIAX1q5qyOxbDBNbXWvSySs4VkkMSMjVdCCR3rvwVEf7SEBIjfrJdvGU7
	yq/o9YIjSBdh4vGv3uW7WO4EMrOVXMonqZZCl1VQjAvLsN0UCafCTaUxutW/usUP3WswCS
	q3YEiwRrxpfgv1u33q6WHjI5TV12/6U=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-660-alJy0kJZNe-6Ov75-lataA-1; Fri, 19 May 2023 09:08:05 -0400
X-MC-Unique: alJy0kJZNe-6Ov75-lataA-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-9663552473fso440505866b.1
        for <linux-staging@lists.linux.dev>; Fri, 19 May 2023 06:08:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684501684; x=1687093684;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EjMFXtiDUpEHJ5eWhE6OyqiD+1wNtDFrOVeQDIPCrpg=;
        b=ZHOzSuMSqElrhow8vXfnuq9pNgJU3IeAr8J0hGsadZIJuPVV56i3rXIr5Ov8y3YSFI
         cTV6VkyyRIcXDF5BQ6+oBRSyOXVd89iHnc4UX39xHjGL3l+PcTyh+EGf8HHEx1Ugum74
         2+34TftaEI/CkjHVeFp/c67AziuULLvyw9g0JcfAnQgfHMunVW0xVa92MNcOZD4I6mUy
         GUWk1+rdZ8AQTJAFjWukIuM5nd/r39J6Kl/Ik6XZ4dABikmETuLUEgpzODzDrTsMCvP3
         G7+G+xoUCl8q/ddlA+bIZ6AOJt1r97RSTZ3A9pp2h994a1JjubZMQaeZrlYnaUI8XF1f
         NeBw==
X-Gm-Message-State: AC+VfDyZ/lxlJhhiJNeHk4lqAFBFP7LYwCvDeLIu4sKz5Qnqd/Y5yHu6
	lMMZvR7pd5TUZMWo4uqm3djQp/PM9HwX0B7JwwyNJyaYlsRmIYdsg86Z3t4Qv1uZYtA0X4h5BR0
	ecyUJrHpE/y72sGbKIlIPxAB1Kw==
X-Received: by 2002:a17:906:4d8f:b0:94f:3bf7:dacf with SMTP id s15-20020a1709064d8f00b0094f3bf7dacfmr1726151eju.71.1684501684238;
        Fri, 19 May 2023 06:08:04 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5UuisQfm9QVLJGKlwVhTUirvlz2i4XrIv4kge18qebu/KDJkOR5lqid7kKHEdXfPT5F99mmA==
X-Received: by 2002:a17:906:4d8f:b0:94f:3bf7:dacf with SMTP id s15-20020a1709064d8f00b0094f3bf7dacfmr1726125eju.71.1684501683931;
        Fri, 19 May 2023 06:08:03 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id k23-20020a1709067ad700b0096616adc0d5sm2250490ejo.104.2023.05.19.06.08.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 May 2023 06:08:03 -0700 (PDT)
Message-ID: <1bd06502-d1f5-1ba2-600a-aec6cdf49a27@redhat.com>
Date: Fri, 19 May 2023 15:08:02 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 1/9] media: v4l: Add v4l2_acpi_parse_sensor_gpios() helper
 function
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Dan Scally <djrscally@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
 Tsuchiya Yuto <kitakar@gmail.com>, Yury Luneff <yury.lunev@gmail.com>,
 Nable <nable.maininbox@googlemail.com>, andrey.i.trufanov@gmail.com,
 Fabio Aiuto <fabioaiuto83@gmail.com>, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev
References: <20230518153214.194976-1-hdegoede@redhat.com>
 <20230518153214.194976-2-hdegoede@redhat.com>
 <ZGcl7+cKu0/h43YC@kekkonen.localdomain>
 <cb4e56fd-0745-6040-6d93-bd8eb1d23ce1@redhat.com>
 <ZGdWVATARAQlaEjC@kekkonen.localdomain>
 <d230dd21-9c2b-2dc4-0325-6ceb502c3ba0@redhat.com>
 <ZGdohJQSY3GiNLSy@kekkonen.localdomain>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ZGdohJQSY3GiNLSy@kekkonen.localdomain>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Sakari,

On 5/19/23 14:16, Sakari Ailus wrote:
> Hi Hans,
> 
> On Fri, May 19, 2023 at 01:55:04PM +0200, Hans de Goede wrote:
>> Hi Sakari,
>>
>> On 5/19/23 12:58, Sakari Ailus wrote:
>>> Hi Hans,
>>>
>>> On Fri, May 19, 2023 at 10:55:42AM +0200, Hans de Goede wrote:
>>
>> <snip>
>>
>>>>> Although if the number of those drivers would be small, this could be just
>>>>> undesirable but still somehow acceptable. And I wouldn't expect new sensors
>>>>> to be paired with the IPU2 anymore. How many drivers there would be
>>>>> roughly? I think I've seen ten-ish sensor drivers with the atomisp driver.
>>>>
>>>> About ten-ish drivers sounds right.
>>>>
>>>>> Isn't it possible to create a device for this purpose and use software
>>>>> nodes for the GPIOs? I guess that would be a hack as well and you'd somehow
>>>>> have to initialise this via other route than driver probe.
>>>>
>>>> This creates unsolvable probe-ordering problems. At a minimum we would
>>>> need some check inside sensor drivers for them to return -EPROBE_DEFER
>>>> until the GPIO mappings are added through some other means. Note that
>>>> without the mappings gpiod_get will return -ENOENT, so we cannot just
>>>> use its return value.
>>>
>>> They probably will already need this in order to make sure the atomisp
>>> bridge has been initialized.
>>
>> The instantiation of the sensor i2c_clients and of the atomisp PCI device
>> is independent of each other. In my other patch series I'm moving sensor
>> registration for atomisp over to the v4l2-async framework like all other
>> bridge/ISP drivers use so that atomisp no longer needs special sensor
>> drivers.
>>
>> And AFAIK one of the reasons for having the v4l2-async framework is
>> to avoid needing to have a specific probe order between bridge vs
>> sensor drivers.
>>
>>> Could this code live in the atomisp bridge instead?
>>
>> That does not solve the probe ordering problem the sensor drivers
>> need the GPIOs to enable the sensor and they all enable the sensor
>> in their probe() to check the hw-id. The sensor's probe() function
>> runs without any ordering guarantees vs the ISP/brige's probe()
>> function. This is not an issue because at least during probe()
>> the sensor drivers don't have any interactions with the bridge
>> and any further access to the sensor-drivers is delayed until
>> the v4l2-async notifier completion callback has run.
>>
>> The only way to work around the probe-ordering problem would
>> be to delay checking the hw-id until the sensor gets linked
>> to the bridge. Which would mean registering an async notifier
>> from the sensors to catch binding from the sensor drivers
>> and allowing the binding to fail.
>>
>> Delaying the hw-id check like this would be much more involved
>> then the currently proposed solution and will likely cause
>> other issues like the wrong driver binding when hw-vendors
>> get the ACPI hw-id wrong (this is a known issue with audio-codecs,
>> so chances are we will see this with sensors too).
> 
> A simple question: how do you solve the probe ordering issue when it comes
> to the atomisp bridge creating the graph endpoints needed by sensor
> drivers?
> 
> Or do you assume the sensor drivers will always use some static
> configuration?

This is all modeled after the IPU3 work done by Dan Scally and
ATM the involved sensor drivers assume a static configuration
wrt number of lanes + link frequency.

If / when we want to start supporting say both single + dual
lane modes (with e.g. reduced framerate for high res in single lane)
then AFAICT this will only influence things like e.g. subdev calls
to get supported framerates and of course turning on streaming,
all of which only ever happen after the async subdev registration
of all involved subdevs is complete.

So (again AFAICT) unlike the GPIOs there is no need to need
to know the endpoint configuration at probe() time. But since
we do want to turn the sensor on to check it is actually there
and if it is the type of sensor we expect during probe() we
do need the GPIOs beforehand.

Regards,

Hans



