Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 218F572
	for <linux-staging@lists.linux.dev>; Wed, 27 Oct 2021 15:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1635348660;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wQB+Xmr9N1Y1FmI08ZieChAnebOdyH//VWSsmPfQD3s=;
	b=elyXI0CHzv1b0Qo40GCa8SR7h1vVX1KLFYAtGo2uY3sOMiTDTB3Eqde8e3n2PECNLyaFHR
	NBJCUJkFkJGwKIFYyHRdO9htIKIimjrE6/5JAZz1+gRM5pHMjmJYuNiI0MwTFfWLa4JCX8
	ALKNyioooTdrTE7hFaXp896PLUah+aA=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-185--04OW50_OhGV9zMHHFY-Vw-1; Wed, 27 Oct 2021 11:30:54 -0400
X-MC-Unique: -04OW50_OhGV9zMHHFY-Vw-1
Received: by mail-ed1-f71.google.com with SMTP id c25-20020a056402143900b003dc19782ea8so2717472edx.3
        for <linux-staging@lists.linux.dev>; Wed, 27 Oct 2021 08:30:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=wQB+Xmr9N1Y1FmI08ZieChAnebOdyH//VWSsmPfQD3s=;
        b=m2tUY/zoIeECxGHphPGL5j7rdPbqysVieV706zG7o3c3VbricDeVLmuy3Q9R6PpzH9
         Htso2Dalwecg/vmmZhfSnxUT9UiV8jpvIRyagwZvAZ2C1S1sIO5d7HjT7bokATLknish
         GJULb+0xTrVfMu2bcyzTcGSTmYZYkHCJkWCoPM2EHMmKGlWiqHhxYZ/FKigc1QN9uclz
         5ZAe/r1Nq6NwX2f9FbormsmlpCJM+ZG0pS804UfPO1etlU7FPZw7KNPPrVMqM3YLqS9q
         Jg/s7MRMj+fCgtPDqRyhFLMR3kq/XzbvZt50C4lwV9/COjf9+SUlVn19Df8l2uKX0KJV
         3EDQ==
X-Gm-Message-State: AOAM53213sNnrPXDO9FgrOC43DTV4TUZSQzve4xq4Bj5qN3Ma39Xxjkw
	PE1gY3J1OOdnMEV3z5odEnBdXtE5BmQGks4R0N+tRpP1UOVHH5H3fKoP/ngh8Odce8xhTazTzHe
	9kD8HLpK5lnPxSsDobTcfF++AKQ==
X-Received: by 2002:a17:906:4895:: with SMTP id v21mr41075473ejq.299.1635348652153;
        Wed, 27 Oct 2021 08:30:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyFKIXIPVbnbAHJYpa6zXhIHVfVRMLcWwHSQJCgAoYtJ+kBQcY1K9STnfFWcI2CKjdQzseFLQ==
X-Received: by 2002:a17:906:4895:: with SMTP id v21mr41075442ejq.299.1635348651885;
        Wed, 27 Oct 2021 08:30:51 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214? (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id q17sm104812ejp.106.2021.10.27.08.30.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Oct 2021 08:30:51 -0700 (PDT)
Message-ID: <84e4aef5-0085-49ed-a97f-d267bfbac5cd@redhat.com>
Date: Wed, 27 Oct 2021 17:30:50 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 16/17] [NOT-FOR-MERGE] media: atomsip: pci: add DMI match
 for Microsoft Surface 3 with broken DMI (OEMB)
To: Tsuchiya Yuto <kitakar@gmail.com>
Cc: Patrik Gfeller <patrik.gfeller@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Aniket Bhattacharyea <aniketmail669@gmail.com>,
 Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>,
 Yang Yingliang <yangyingliang@huawei.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Alan <alan@linux.intel.com>,
 Dinghao Liu <dinghao.liu@zju.edu.cn>, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20211017161958.44351-1-kitakar@gmail.com>
 <20211017161958.44351-17-kitakar@gmail.com>
 <71b5b886-2ca1-27a9-6776-b3bcc430e5ed@redhat.com>
 <ace1264d7254f7159865602614d70caf7ff4b609.camel@gmail.com>
 <a2aa76c3-a8bb-99ef-9f5a-e62cc503a1e2@redhat.com>
 <096e953682fed458d438d1cde57371d7358b5d7b.camel@gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <096e953682fed458d438d1cde57371d7358b5d7b.camel@gmail.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 10/27/21 16:47, Tsuchiya Yuto wrote:
> On Thu, 2021-10-21 at 20:46 +0200, Hans de Goede wrote:
>> Hi,
>>
>> On 10/21/21 11:46, Tsuchiya Yuto wrote:
>>> On Mon, 2021-10-18 at 09:56 +0200, Hans de Goede wrote:
>>>> Hi,
>>>>
>>>> On 10/17/21 18:19, Tsuchiya Yuto wrote:
>>>>> This commit is added for Surface 3 with broken DMI table. HACK-ish.
>>>>> Not intended for upstreaming. Thus, NOT-FOR-MERGE. But, if someone
>>>>> knows a nicer way to address this, comments are welcome...
>>>>>
>>>>>> 8-----------------------------------------------------------------8<
>>>>>
>>>>> On some Microsoft Surface 3, the DMI table gets corrupted for unknown
>>>>> reasons and breaks existing DMI matching used for device-specific quirks.
>>>>>
>>>>> This commit adds the (broken) DMI data into dmi_system_id tables used
>>>>> for quirks so that the driver can enable quirks even on the affected
>>>>> systems.
>>>>>
>>>>> On affected systems, the DMI data will look like this:
>>>>>
>>>>>         $ grep . /sys/devices/virtual/dmi/id/{bios_vendor,board_name,board_vendor,\
>>>>>         chassis_vendor,product_name,sys_vendor}
>>>>>         /sys/devices/virtual/dmi/id/bios_vendor:American Megatrends Inc.
>>>>>         /sys/devices/virtual/dmi/id/board_name:OEMB
>>>>>         /sys/devices/virtual/dmi/id/board_vendor:OEMB
>>>>>         /sys/devices/virtual/dmi/id/chassis_vendor:OEMB
>>>>>         /sys/devices/virtual/dmi/id/product_name:OEMB
>>>>>         /sys/devices/virtual/dmi/id/sys_vendor:OEMB
>>>>
>>>> I wonder what the bios_date field contains ? Typically when the DMI strings
>>>> are no good (e.g. often they contain "Default String" or "To be filled by OEM")
>>>> we add a check on the bios-date, which together with the broken strings is
>>>> considered unique enough to still allow a match with broken strings in the
>>>> kernel.
>>>
>>> Thank you so much for the comment :-)
>>>
>>> Here is the full output of "/sys/devices/virtual/dmi/id/*" (not showing
>>> files that need root permission to read):
>>>
>>>         $ grep . /sys/devices/virtual/dmi/id/*
>>>         /sys/devices/virtual/dmi/id/bios_date:03/09/2015
>>>         /sys/devices/virtual/dmi/id/bios_release:5.6
>>>         /sys/devices/virtual/dmi/id/bios_vendor:American Megatrends Inc.
>>>         /sys/devices/virtual/dmi/id/bios_version:1.51116.238
>>
>> Interesting, this is the latest BIOS from july 2019 according to:
>> https://support.microsoft.com/en-us/surface/surface-3-update-history-5d86a7bc-03f7-2d27-d858-e90ce637fb52
>> yet the date is still set to 03/09/2015.
> 
> Yeah, I'm a little bit confused about this.

Yes this is unusual, bit it just seems to be how Microsoft does things
on the Surface 3.

>> I just checked and the BIOS with not corrupted DMI strings also keeps
>> the date at 03/09/2015 in BIOS updates.
>>
>> So the date is correct, and together with matching a coupleof the OEMB-s
>> (which I've never seen anywhere else either) this should be plenty
>> unique.
>>
>> So this not only allows adding this mathc to atomisp, but also to fix
>> sound + wmi on bad DMI data OEMB Surface 3-s, by updating this patch:
>>
>> https://github.com/linux-surface/linux-surface/blob/2fb7e9ae91350098db9a280277f424272816a9ab/patches/5.5/0003-surface3-oemb.patch
>>
>> To include the BIOS-date match and then submitting this upstream
>> (as 2 separate patches please).
>>
>> Tsuchiya, I take it that your Surface 3 has the OEMB issue, so you
>> can actually test this ?
> 
> Yes, my surface3 is also affected and I can test this.
> 
>> If you can prepare 2 patches for the sound + wmi then; and submit
>> them upstream that would be great. Please Cc me on both patches.
> 
> Thank you for the suggestion, but I started having a mixed feeling about
> sending this kind of patches... This "OEMB" issue is not a design by
> manufacturers, but simply just it got broken after something (maybe a
> force power off?). On the other hand, I know there are also indeed some
> people affected by this issue other than me...
> 
> If possible, I rather want to fix this broken DMI table, but I couldn't
> find the way until now though.
> 
> But again, thank you for the suggestion. I'll consider sending the
> patches when I gave up fixing it...

Since other people are affected too, fixing this is only really useful
if the fix is doable by others too.

OTOH I just checked:

https://github.com/linuxhw/DMI

Which is a database of all dmidecode-s uploaded to:
https://linux-hardware.org/

And _zero_ of the 56358 dmidecode outputs available
there contains OEMB, so this seems to be quite unique to the
Surface 3. Which, esp. together with the BIOS date makes the DMI
match definitely unique enough. Sometimes DMI strings change
on a BIOS update (not break like this, but just change) so
having 2 entries for a single device-model is not unheard of.

So my cents is to just go with adding the extra entry to
dmi_system_id tables and to not spend too much time on this.

> <Below is completely off topic from atomisp>
> 
> I think some useful BIOS option might be just hidden. So, I'd like to
> try this way. I already find the string "Restore Defaults" using
> uefitool/ifrextract:
> 
>     0x13429 	Form: Save & Exit, FormId: 0x2719 {01 86 19 27 4C 00}
>     [...]
>     0x134E0 		Suppress If {0A 82}
>     0x134E2 			QuestionId: 0x1C3 equals value 0x5 {12 06 C3 01 05 00}
>     0x134E8 			Ref: Restore Defaults, VarStoreInfo (VarOffset/VarName): 0xFFFF, VarStore: 0x0, QuestionId: 0x1BC, FormId: 0x2719 {0F 0F 5B 00 5C 00 BC 01 00 00 FF FF 00 19 27}
>     0x134F7 		End If {29 02}
>     [...]
> 
> I currently don't know how I can call this. I want to try this way when
> I have some time...

So this is not a normal hidden item which just changes a setting (for which
there are known ways to change the setting without flashing the BIOS).

But this is some sorta action item which can only be enabled by flashing
a custom BIOS, assuming we can somehow replace the Surface 3 custom
setup menu with the standard IFR based menu, which in itself is a problem...

Regards,

Hans

