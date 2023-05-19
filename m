Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CE945679
	for <linux-staging@lists.linux.dev>; Fri, 19 May 2023 14:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684507173;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cFrYUZWO6L2HJAhbZ60ej+T/XDTkBh/yUs2r02Xy1og=;
	b=QTQUUp2RuYWznDOQbzJoXmaXsfHynC7sBGR6FCCRZitfjrM0YeFgoc/Xt/zjd1T1wQTFLL
	C4ZCIWPenr8A9e1Chi8ck7giPOJFjLyOoGUVq5OTEn5Q45yH3oInhia+rmfe91QT84Fzj8
	/c8IcAZsxOrfBD8fz9Rc6uBp/HtlsyE=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-621-hkHj_QNJPUWwQfaIJeaO4Q-1; Fri, 19 May 2023 10:39:32 -0400
X-MC-Unique: hkHj_QNJPUWwQfaIJeaO4Q-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-9662960d1e4so365704366b.1
        for <linux-staging@lists.linux.dev>; Fri, 19 May 2023 07:39:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684507171; x=1687099171;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cFrYUZWO6L2HJAhbZ60ej+T/XDTkBh/yUs2r02Xy1og=;
        b=S7cZLWmVkZ4P6y/YfQpvqVDFc+lu6Nik+MB3T+zlsc9ndbzZCeTZjqLysaGPBw+UHg
         UZ4r2cm8IbPuVuz/NeE0W2agKu/DDAVzgsAFPurKQ0x1c1JMvplldKnRUvqTdcjtIDiL
         y3akeCU5pvfnGOBnn1Pu2EAUE7JuL49Rle3up/JntzV/+3MQ/Y286nFAFZdmx8uMeFMt
         2BbInMBxO52KPXmG8gDz0TtM2Y1JIx3xzIWfxju9o5naPV4FgH7+ZJyQVfnltOkUsB15
         2rTecKrZ6QVWJ/142UtSgwKwt9cBN0i1Em8Mz7MAlntxnRlVRuGFZNUzewByc6KzIW1W
         5+/A==
X-Gm-Message-State: AC+VfDzuqwGf1qCe1bkNAD4v68P6q9wx3js4hfaBSwr1ew5Rh4KgUWSc
	da4+nb45Cu8dqiyhU8YwjRtG30GehzddqGPXGJdtVzMcjF+Gy2vTaNRg7gpbSm2oA+6cEhSlDar
	glVcJr8P/DiaSYacPLtd5yS/rog==
X-Received: by 2002:a17:906:794b:b0:965:d7c7:24cc with SMTP id l11-20020a170906794b00b00965d7c724ccmr2116867ejo.23.1684507171048;
        Fri, 19 May 2023 07:39:31 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4tOLwe42HWHjVX++VelFGTpHDv+CzCXcMAkYrotkjZ8+42izFmKClqBIPAW89L8SRthEXSKg==
X-Received: by 2002:a17:906:794b:b0:965:d7c7:24cc with SMTP id l11-20020a170906794b00b00965d7c724ccmr2116845ejo.23.1684507170739;
        Fri, 19 May 2023 07:39:30 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id c17-20020aa7d611000000b004fbdfbb5acesm1753176edr.89.2023.05.19.07.39.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 May 2023 07:39:30 -0700 (PDT)
Message-ID: <e4b40a54-25e0-74d0-eb97-af36d7e78d2e@redhat.com>
Date: Fri, 19 May 2023 16:39:29 +0200
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
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Dan Scally <djrscally@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Andy Shevchenko
 <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
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
 <1bd06502-d1f5-1ba2-600a-aec6cdf49a27@redhat.com>
 <ZGeBKePUH55wi9dI@kekkonen.localdomain>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ZGeBKePUH55wi9dI@kekkonen.localdomain>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 5/19/23 16:01, Sakari Ailus wrote:
> Hi Hans,
> 
> On Fri, May 19, 2023 at 03:08:02PM +0200, Hans de Goede wrote:
>> Hi Sakari,
>>
>> On 5/19/23 14:16, Sakari Ailus wrote:
>>> Hi Hans,
>>>
>>> On Fri, May 19, 2023 at 01:55:04PM +0200, Hans de Goede wrote:
>>>> Hi Sakari,
>>>>
>>>> On 5/19/23 12:58, Sakari Ailus wrote:
>>>>> Hi Hans,
>>>>>
>>>>> On Fri, May 19, 2023 at 10:55:42AM +0200, Hans de Goede wrote:
>>>>
>>>> <snip>
>>>>
>>>>>>> Although if the number of those drivers would be small, this could be just
>>>>>>> undesirable but still somehow acceptable. And I wouldn't expect new sensors
>>>>>>> to be paired with the IPU2 anymore. How many drivers there would be
>>>>>>> roughly? I think I've seen ten-ish sensor drivers with the atomisp driver.
>>>>>>
>>>>>> About ten-ish drivers sounds right.
>>>>>>
>>>>>>> Isn't it possible to create a device for this purpose and use software
>>>>>>> nodes for the GPIOs? I guess that would be a hack as well and you'd somehow
>>>>>>> have to initialise this via other route than driver probe.
>>>>>>
>>>>>> This creates unsolvable probe-ordering problems. At a minimum we would
>>>>>> need some check inside sensor drivers for them to return -EPROBE_DEFER
>>>>>> until the GPIO mappings are added through some other means. Note that
>>>>>> without the mappings gpiod_get will return -ENOENT, so we cannot just
>>>>>> use its return value.
>>>>>
>>>>> They probably will already need this in order to make sure the atomisp
>>>>> bridge has been initialized.
>>>>
>>>> The instantiation of the sensor i2c_clients and of the atomisp PCI device
>>>> is independent of each other. In my other patch series I'm moving sensor
>>>> registration for atomisp over to the v4l2-async framework like all other
>>>> bridge/ISP drivers use so that atomisp no longer needs special sensor
>>>> drivers.
>>>>
>>>> And AFAIK one of the reasons for having the v4l2-async framework is
>>>> to avoid needing to have a specific probe order between bridge vs
>>>> sensor drivers.
>>>>
>>>>> Could this code live in the atomisp bridge instead?
>>>>
>>>> That does not solve the probe ordering problem the sensor drivers
>>>> need the GPIOs to enable the sensor and they all enable the sensor
>>>> in their probe() to check the hw-id. The sensor's probe() function
>>>> runs without any ordering guarantees vs the ISP/brige's probe()
>>>> function. This is not an issue because at least during probe()
>>>> the sensor drivers don't have any interactions with the bridge
>>>> and any further access to the sensor-drivers is delayed until
>>>> the v4l2-async notifier completion callback has run.
>>>>
>>>> The only way to work around the probe-ordering problem would
>>>> be to delay checking the hw-id until the sensor gets linked
>>>> to the bridge. Which would mean registering an async notifier
>>>> from the sensors to catch binding from the sensor drivers
>>>> and allowing the binding to fail.
>>>>
>>>> Delaying the hw-id check like this would be much more involved
>>>> then the currently proposed solution and will likely cause
>>>> other issues like the wrong driver binding when hw-vendors
>>>> get the ACPI hw-id wrong (this is a known issue with audio-codecs,
>>>> so chances are we will see this with sensors too).
>>>
>>> A simple question: how do you solve the probe ordering issue when it comes
>>> to the atomisp bridge creating the graph endpoints needed by sensor
>>> drivers?
>>>
>>> Or do you assume the sensor drivers will always use some static
>>> configuration?
>>
>> This is all modeled after the IPU3 work done by Dan Scally and
>> ATM the involved sensor drivers assume a static configuration
>> wrt number of lanes + link frequency.
> 
> In general the number of lanes used is dependent on a particular board, and
> in many cases the same sensor is used on different systems with a different
> lane configuration. This might not happen on sensors used with atomisp but
> it probably already happens on those used by the CIO2 (ov8865).
> 
> What the drivers should do and in most cases do is that they check the lane
> configuration is valid for the device.
> 
>>
>> If / when we want to start supporting say both single + dual
>> lane modes (with e.g. reduced framerate for high res in single lane)
>> then AFAICT this will only influence things like e.g. subdev calls
>> to get supported framerates and of course turning on streaming,
>> all of which only ever happen after the async subdev registration
>> of all involved subdevs is complete.
> 
> On sensors the number of lanes is practically never selected dynamically,
> it's simply a property of the board (the CSI-2 receiver and how many wires
> happen to be connected, whichever has fewer lanes).

Right, I understand / agree what I meant is that the driver does not
really need to know the number of connected lanes during probe().

But yes if you want to check the number of lanes is valid in probe()
then you do need to know it.

>> So (again AFAICT) unlike the GPIOs there is no need to need
>> to know the endpoint configuration at probe() time. But since
>> we do want to turn the sensor on to check it is actually there
>> and if it is the type of sensor we expect during probe() we
>> do need the GPIOs beforehand.
> 
> The other, somewhat cleaner in my opinion and clearly more future-proof,
> would be to return -EPROBE_DEFER if there are no endpoints. Which is also
> what the ov8865 driver does already.

Ok that is a good suggestion, which I think should work. I'll give this
a try sometime during the coming days.

Regards,

Hans


