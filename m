Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAA9C33C0
	for <linux-staging@lists.linux.dev>; Fri, 10 Feb 2023 16:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1676044877;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UgRvWSSS/HZdkVKd8F3x24TtSl4QFRTT0cLIERg7rLM=;
	b=AoY04t86Eb9DMuisx1PO/SOHC1zpVOt2LTz18JuMGk+cQOBi1DBK/Ug8m/SS3tsT7NINly
	q4XyVGsxDxnbzzcAubB+a5uHu1/dHI7rprq/J7KImGbKHNgbc/lVuUH/EGW1/6HsKfkBw+
	dwLz8ZOyFTFHCqJEq5a93MvNtAnV6lg=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-663-KN6NfhnzO1iEVLPBhIm9_w-1; Fri, 10 Feb 2023 11:01:16 -0500
X-MC-Unique: KN6NfhnzO1iEVLPBhIm9_w-1
Received: by mail-ed1-f72.google.com with SMTP id g19-20020a056402115300b004a26cc7f6cbso3820681edw.4
        for <linux-staging@lists.linux.dev>; Fri, 10 Feb 2023 08:01:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UgRvWSSS/HZdkVKd8F3x24TtSl4QFRTT0cLIERg7rLM=;
        b=LHJn6iFtRR7LVhneNK6/TcJOJxQfOYTgPmGEAAGkYKSWzOOyV7HXq656pf/JnJKrW8
         j8V/uP5FY3JJ83Mawt4ciBX6ziq03Z2QK278lQXyPzvyZuG+NBMYd5+ZZbUQ4+sUNweH
         ZmJX30zmBGDsBLS1auqjAUvCNtCOLjvxTe96HFh18K20cgEzquefexnEn16s12FOdDNm
         7zFFmtl/LSTh/mceBDKiv0Jm4vy6T0APb4n2UhYgwQDA/ef5Vfcq+HsC4aGA6w/s65al
         9wS81wqBd03sErKxw6P7Cb6InABdMYK5BKS5c+qJBIedQWWAIwlTO2NwAMCrNQAcwr4g
         KiaA==
X-Gm-Message-State: AO0yUKU0aW0K6CRxDwQQeznGzrPXtCYAsJfADsuA2lhWOvEDOlBYQlUK
	U0l6l4JG+JY8NXV+LWCWlNU56H9b+EH3o+hTclPKDSDWq/OU0SH9sZjHRpcMLXgufipvAliEkJ6
	D48SCJuyBOwXYxDvN4djy/lyE2A==
X-Received: by 2002:a50:d49e:0:b0:46d:35f6:5a9b with SMTP id s30-20020a50d49e000000b0046d35f65a9bmr16935505edi.24.1676044875290;
        Fri, 10 Feb 2023 08:01:15 -0800 (PST)
X-Google-Smtp-Source: AK7set8cFaea0cXGa98GMo9HtF2UFB/0Yqym/MBvtdHiJBmrfnEmKiA9+bVjbdVDhh8mFOtRVfzErw==
X-Received: by 2002:a50:d49e:0:b0:46d:35f6:5a9b with SMTP id s30-20020a50d49e000000b0046d35f65a9bmr16935484edi.24.1676044875136;
        Fri, 10 Feb 2023 08:01:15 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id z16-20020a5096d0000000b004aad0a9144fsm2419311eda.51.2023.02.10.08.01.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Feb 2023 08:01:14 -0800 (PST)
Message-ID: <975bcc79-6ac1-658d-582a-cbd4ec3434b8@redhat.com>
Date: Fri, 10 Feb 2023 17:01:13 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 28/57] media: Add ovxxxx_16bit_addr_reg_helpers.h
To: Andy Shevchenko <andy@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Tsuchiya Yuto
 <kitakar@gmail.com>, Yury Luneff <yury.lunev@gmail.com>,
 Nable <nable.maininbox@googlemail.com>, andrey.i.trufanov@gmail.com,
 Fabio Aiuto <fabioaiuto83@gmail.com>, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev
References: <20230123125205.622152-1-hdegoede@redhat.com>
 <20230123125205.622152-29-hdegoede@redhat.com>
 <Y+Nw32EZUZtq3esL@pendragon.ideasonboard.com>
 <026272d3-88d7-a67f-4942-5cba6c3eab86@redhat.com>
 <Y+UbIAVQZ5U0/U5U@pendragon.ideasonboard.com>
 <Y+YamxehIUdF5aU7@kekkonen.localdomain>
 <Y+Ycf4SpMaUfdR5m@pendragon.ideasonboard.com>
 <Y+Yg217HSEi4c+mP@kekkonen.localdomain> <Y+YiNyC7TeOEn/Hi@smile.fi.intel.com>
 <Y+YlELz9C61HQE0x@pendragon.ideasonboard.com>
 <Y+ZkVlzV7qY0K4gS@smile.fi.intel.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Y+ZkVlzV7qY0K4gS@smile.fi.intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Andy,

On 2/10/23 16:35, Andy Shevchenko wrote:
> On Fri, Feb 10, 2023 at 01:05:52PM +0200, Laurent Pinchart wrote:
>> On Fri, Feb 10, 2023 at 12:53:43PM +0200, Andy Shevchenko wrote:
>>> On Fri, Feb 10, 2023 at 12:47:55PM +0200, Sakari Ailus wrote:
>>>> On Fri, Feb 10, 2023 at 12:29:19PM +0200, Laurent Pinchart wrote:
>>>>> On Fri, Feb 10, 2023 at 12:21:15PM +0200, Sakari Ailus wrote:
>>>>>> On Thu, Feb 09, 2023 at 06:11:12PM +0200, Laurent Pinchart wrote:
> 
> ...
> 
>>>>>> I took a look at this some time ago, too, and current regmap API is a poor
>>>>>> fit for CCI devices. CCI works on top of e.g. both I²C and I3C so something
>>>>>> on top of regmap is a better approach indeed.
>>>>>
>>>>> I'm confused, is regmap a poor fit, or a better approach ?
>>>>
>>>> I'm proposing having something on top of regmap, but not changing regmap
>>>> itself.
>>>
>>> I don't understand why we can't change regmap? regmap has a facility called
>>> regmap bus which we can provide specifically for these types of devices. What's
>>> wrong to see it done?
>>
>> How would that work ?
> 
> If I'm not mistaken, you may introduce something like regmal CCI and then
> 
> 	regmap_init_cci();
> 
> 
> 	regmap_read()/regmap_write()
> 	regmap_update_bits()
> 	regmap_bulk_*()
> 
> at your service without changing a bit in the drivers (they will use plain
> regmap APIs instead of custom ones).

regmap_bus is for low-level busses like i2c, i3c, spi, etc.

We could "abuse" this to overwrite the standard regmap read/write helpers
with bus specific ones, but then we loose the actual bus abstraction
and we would need separate regmap-cci implementations for i2c/i3c/spi.

> Again, we can extend regmap to have something like
>
>	int (*reg_width)(regmap *, offset)
>
> callback added that will tell the regmap bus underneath what size to use.
>
> In the driver one will define the respective method to return these widths.

That won't work internal helpers to marshall raw-buffers with both reg-addr
+ reg value(s) to pass to the low-level (i2c/i3c/spi) drivers use an internal
regmap.format struct which gets filled with reg-width specific info once
from __regmap_init() what you are suggesting really requires major surgery
to the whole regmap core.

CCI really is an extra protocol layer on top of lower-level / more primitive
busses and it is best to have a helper library with a few helpers using
regmap underneath to abstract the raw bus accesses away. Note this helper
library can be quite thin and small though :)

Regards,

Hans

