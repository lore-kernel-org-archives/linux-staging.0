Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91D7B2CA2
	for <linux-staging@lists.linux.dev>; Fri, 10 Feb 2023 11:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1676027976;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EWATG1nfwrnPGpKg4h6TUPJK2jBZUl8fDKwJ15Mnkpc=;
	b=HeNwbXUtC/XFT/8kEyTsWpSlqVjT04xaa5iZG9VSbJlzjT/I1HLRMeRUy36xjeBW5PrYT0
	cUhuP7D5d7dvgc7XNTTvGgEpi7+6KI50gUCmpo7ofWNBSuy8tIriE7oMbuRVF8Wqufp6fX
	4c/4pnCXXrV/ky15/BxvXWz0dMlGKyw=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-657-ktSXEzNmNRuEkYBACdCTeQ-1; Fri, 10 Feb 2023 06:19:33 -0500
X-MC-Unique: ktSXEzNmNRuEkYBACdCTeQ-1
Received: by mail-ej1-f70.google.com with SMTP id ud13-20020a170907c60d00b0088d773d11d6so3404755ejc.17
        for <linux-staging@lists.linux.dev>; Fri, 10 Feb 2023 03:19:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EWATG1nfwrnPGpKg4h6TUPJK2jBZUl8fDKwJ15Mnkpc=;
        b=SnLq5Cq1Tf+kYuOZ1GAIlZ3JrMS+u15FlskKw7zajTNgMaWRF+R9PqGifEcKT/ah0z
         ayikXdOhCCTLKD+xesShRQSEFri4uriRvLzW4qtTdojPQJHrvaJMJuIKyxNtLrQn+yK9
         wEtOPG2y3EL+Y9CtmKlo/c7dScs/d8nQsq32dd/YzOemzNc5vnHdj92NHLfzz+vruV4e
         Aw3E3n7QMmQBNK84HnuD3kEWBBxrTdI/gOXKjb0Dqv0/VDt/ok7nHZdeAEmcXy3E7U7G
         TU760GaG5SX8TY4KAVaE6E20tco9e3SWwEr81yiW5P0Zva/WjOeMVhprDAnNggBfK6h/
         O9jQ==
X-Gm-Message-State: AO0yUKUe3ilL5tidu4mzuWLIBZ3k/C4TeeKTVvp+1oqp+YuH9rUCRyrv
	cr0OT/LmVjitcwb6OWq5k9G0zf57OW+wMGOBxtejhqV0BC02YFk/nAm+ftGFbjQoTG/j6lcHqgH
	AhjLBvGmO1iGv0lUyS03n6w4yqg==
X-Received: by 2002:a17:906:720f:b0:8aa:9a03:356a with SMTP id m15-20020a170906720f00b008aa9a03356amr12441724ejk.49.1676027972269;
        Fri, 10 Feb 2023 03:19:32 -0800 (PST)
X-Google-Smtp-Source: AK7set8BdTKIVQ9XX8/YtvA5BvLBEJsaLojUbZ+czHrocqNl+jkt6XJ2UWpNuUuaDt2McpyxXgh5mA==
X-Received: by 2002:a17:906:720f:b0:8aa:9a03:356a with SMTP id m15-20020a170906720f00b008aa9a03356amr12441706ejk.49.1676027972072;
        Fri, 10 Feb 2023 03:19:32 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id v24-20020a170906859800b0088c224bf5b5sm2244999ejx.148.2023.02.10.03.19.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Feb 2023 03:19:31 -0800 (PST)
Message-ID: <974597c0-1614-97d5-d933-e52bb1a062ab@redhat.com>
Date: Fri, 10 Feb 2023 12:19:30 +0100
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
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
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
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Y+YiNyC7TeOEn/Hi@smile.fi.intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 2/10/23 11:53, Andy Shevchenko wrote:
> On Fri, Feb 10, 2023 at 12:47:55PM +0200, Sakari Ailus wrote:
>> On Fri, Feb 10, 2023 at 12:29:19PM +0200, Laurent Pinchart wrote:
>>> On Fri, Feb 10, 2023 at 12:21:15PM +0200, Sakari Ailus wrote:
>>>> On Thu, Feb 09, 2023 at 06:11:12PM +0200, Laurent Pinchart wrote:
> 
> ...
> 
>>>> I took a look at this some time ago, too, and current regmap API is a poor
>>>> fit for CCI devices. CCI works on top of e.g. both I²C and I3C so something
>>>> on top of regmap is a better approach indeed.
>>>
>>> I'm confused, is regmap a poor fit, or a better approach ?
>>
>> I'm proposing having something on top of regmap, but not changing regmap
>> itself.
> 
> I don't understand why we can't change regmap? regmap has a facility called
> regmap bus which we can provide specifically for these types of devices. What's
> wrong to see it done?

It is fairly easy to layer the few 16 and 24 bit register accesses over
a standard regmap with 16 bit reg-address and 8 bit reg-data width using
regmap_bulk_write() to still do the write in e.g. a single i2c-transfer.

So if we want regmap for underlying physical layer independence, e.g.
spi / i2c / i3c. we can just use standard regmap with a 
cci_write_reg helper on top.

I think that would be the most KISS solution here. One thing to also keep
in mind is the amount of work necessary to convert existing sensor drivers.
Also keeping in mind that it is not just the in tree sensor drivers, but
also all out of tree sensor drivers which I have seen use similar constructs.

Requiring drivers to have a list / array of structs of all used register
addresses + specifying the width per register address is not going to scale
very poorly wrt converting all the code out there and I'm afraid that
letting regmap somehow deal with the register-width issue is going to
require something like this.

Regards,

Hans


