Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C59922F31
	for <linux-staging@lists.linux.dev>; Fri, 10 Feb 2023 12:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1676030509;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xLqg7zGpbg7c0CojGNhQfZYPBNbn/bNKHuOTRhAV03E=;
	b=EbAD+gzSC83phbCEq5D8L18hloUZNUYzbFtenVU5LFFu6LhSgUo9MwDBhSGAQij58Vz7Qz
	ycnBfeapMbq594TpwsKZ8sB0zWMpB97KjD8/fJ4FVjbqoR75HeRHXx8UG967g+NOKrj2db
	nBZlXzg8TYF4b/fUCcrLRPBBfL5l73k=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-228-dj9XMR1HOrOhR1uqTC9RUg-1; Fri, 10 Feb 2023 07:01:46 -0500
X-MC-Unique: dj9XMR1HOrOhR1uqTC9RUg-1
Received: by mail-ej1-f72.google.com with SMTP id l18-20020a1709067d5200b008af415fdd80so2856687ejp.21
        for <linux-staging@lists.linux.dev>; Fri, 10 Feb 2023 04:01:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xLqg7zGpbg7c0CojGNhQfZYPBNbn/bNKHuOTRhAV03E=;
        b=h+PDSIehL2/tc9oQxAwdrd2Ze7mF4ahbADMV7sxz9qegRDC84ArZxafGBPpu3SGoU0
         RcPv+4Ngn3dIN+LcjhHQsM3sRBmwtFrg/3eykbHolppjc4PfSBp0IJBmAzzVQMlgWLih
         OmqN7MKFT7AxH76wILKn5UbA0jipSkXPfArTIaF5ia/+XfGLyQdh3OZK9fAjLVl9UaZB
         HxQGyh+EUk4jcJHjzhR17qLbjuksEbesN8W69ueGlCztY/EdHfmAABnuBHcbyPJUTtj6
         zbB3qsMmjY9J04TYpqbeXV/uweesefQ0CrB5hB+akjSZ78jGjJRaVAlAOogQsupC+UO6
         kNeQ==
X-Gm-Message-State: AO0yUKX8uB3eqHuu+xRV7FUv6AzsN5K/RvR1mnqOBGJoXA3Pe9HoNVBB
	lAozI/WSy4FCA/4nakXxqE26DA7B6e+tnr8VYssTXvK/44VurBvSAFq6KJfMNAW/21wdJ3Bo+Lc
	hEXJ9HxjPovD04dhzzKPfVDmvMQ==
X-Received: by 2002:a50:a6cf:0:b0:4ab:26a0:9a35 with SMTP id f15-20020a50a6cf000000b004ab26a09a35mr2814156edc.39.1676030505299;
        Fri, 10 Feb 2023 04:01:45 -0800 (PST)
X-Google-Smtp-Source: AK7set8o5uzlUXFrxz8Rh4G0jYSDIbj+N39v2CLOSwOxpn0JauM//xtu/jxLJiowWdfvWt72nuj/WQ==
X-Received: by 2002:a50:a6cf:0:b0:4ab:26a0:9a35 with SMTP id f15-20020a50a6cf000000b004ab26a09a35mr2814141edc.39.1676030505080;
        Fri, 10 Feb 2023 04:01:45 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id q21-20020a50aa95000000b0049622a61f8fsm2117683edc.30.2023.02.10.04.01.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Feb 2023 04:01:44 -0800 (PST)
Message-ID: <e958e97b-2cf7-bf97-d79e-dc05bc61190c@redhat.com>
Date: Fri, 10 Feb 2023 13:01:43 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 28/57] media: Add ovxxxx_16bit_addr_reg_helpers.h
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Andy Shevchenko <andy@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
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
 <974597c0-1614-97d5-d933-e52bb1a062ab@redhat.com>
 <Y+Yr8dOcDptuUe4D@pendragon.ideasonboard.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Y+Yr8dOcDptuUe4D@pendragon.ideasonboard.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 2/10/23 12:35, Laurent Pinchart wrote:
> On Fri, Feb 10, 2023 at 12:19:30PM +0100, Hans de Goede wrote:
>> Hi,
>>
>> On 2/10/23 11:53, Andy Shevchenko wrote:
>>> On Fri, Feb 10, 2023 at 12:47:55PM +0200, Sakari Ailus wrote:
>>>> On Fri, Feb 10, 2023 at 12:29:19PM +0200, Laurent Pinchart wrote:
>>>>> On Fri, Feb 10, 2023 at 12:21:15PM +0200, Sakari Ailus wrote:
>>>>>> On Thu, Feb 09, 2023 at 06:11:12PM +0200, Laurent Pinchart wrote:
>>>
>>> ...
>>>
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
>> It is fairly easy to layer the few 16 and 24 bit register accesses over
>> a standard regmap with 16 bit reg-address and 8 bit reg-data width using
>> regmap_bulk_write() to still do the write in e.g. a single i2c-transfer.
> 
> I think we could also use regmap_raw_write().
> 
>> So if we want regmap for underlying physical layer independence, e.g.
>> spi / i2c / i3c. we can just use standard regmap with a 
>> cci_write_reg helper on top.
> 
> Agreed. We can start experimenting with this, and if somebody has use
> cases outside of the camera sensor drivers space, we could later move
> those helpers to regmap.
> 
>> I think that would be the most KISS solution here. One thing to also keep
>> in mind is the amount of work necessary to convert existing sensor drivers.
>> Also keeping in mind that it is not just the in tree sensor drivers, but
>> also all out of tree sensor drivers which I have seen use similar constructs.
> 
> If this was the only issue to handle when porting drivers to mainline
> and upstreaming them, I'd be happy :-)

True :) The amount of churn on the stating atomisp sensor drivers which
(the few which I have been working on so far) is quite big and that is just
inching them closer to being mainline ready.

>> Requiring drivers to have a list / array of structs of all used register
>> addresses + specifying the width per register address is not going to scale
>> very poorly wrt converting all the code out there and I'm afraid that
>> letting regmap somehow deal with the register-width issue is going to
>> require something like this.
> 
> Did you mean "not going to scale very well" ? I'm not sure to understand
> what you mean here.

Yes my bad I meant to write "not going to scale very well".

I think that having to pass these kinda long lists of registers with
regmap already when you want to use caching (and need to specify volatile
registers which cannot be cached) is a bit of a pain of using regmap (*)

Regards,

Hans


*) Not that I have a better solution for e.g. the volatile registers thing,
it just causes a lot of what feels like boilerplate code

