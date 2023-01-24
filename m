Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADF2610F9
	for <linux-staging@lists.linux.dev>; Tue, 24 Jan 2023 11:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674558338;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mldeiZ/0LilNfm4f6bf1Ojg1+ZCogrbaufjbQhZdAD4=;
	b=aOithe7Lxpwvv+GDbY7w695l/tpNiP0WIvbikzL1hkIEsNyj4IH3FvBaQ9Nu8I6jlEXYcR
	9QJOC0KovdClP3x0/xttGoVT2dDx2SIIJvg4awWpHrZTFmhm93LmCD2CYuyJtEqQdBqbj9
	TmMwErotLtp/GxToZmgsa7CJu/KueX4=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-478-9W9IMX1eO6GpetLrg0prpg-1; Tue, 24 Jan 2023 06:05:37 -0500
X-MC-Unique: 9W9IMX1eO6GpetLrg0prpg-1
Received: by mail-ej1-f72.google.com with SMTP id hp2-20020a1709073e0200b0084d47e3fe82so9560779ejc.8
        for <linux-staging@lists.linux.dev>; Tue, 24 Jan 2023 03:05:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mldeiZ/0LilNfm4f6bf1Ojg1+ZCogrbaufjbQhZdAD4=;
        b=0Ei/iDcAAZ0aRGokPqkNyjVyr5Ka1MIj9rrh8zBtUZRxvg1TZ5Ed1Yy2/KIKyUy5Ac
         X7scRsbNXPqm41fb14sn+Z9M2TD2Co6q7AUB4fR9NGbVqROgUM4DmmJHL6AFzbnct9XD
         BTsi3uRl33o5YwPZVjv8DZ9ZdfoB72giNu2FoZGC0UVFL0dNG8UynqvdFdgd3WIl379V
         8N6TaUPaCMwUbQrbe20g8LTY/W789hzmlagnLwEQms1//iUE0icFBFsrNnWl3mnfx3fl
         oyI0sqYZ1qr2e7MvHnTfz0colTphbBbP1pgPHsyr8SPsuAogG5YXwxCIYVbKH5wQ9iE1
         87QA==
X-Gm-Message-State: AFqh2kpItrZBHCfsftifL425+0CCeDSe4uNpLyzXw5EKRez+RHoaPQJA
	ukqRE8xK5M+p0rnRq6reuKgldizcYtgH9fT9hlBcgsnYiLW3oMXrL++y4RVsYJcTng8XxBv0FHF
	MnVlSqJ3F1KPN3kRBW24KVzxDAA==
X-Received: by 2002:a17:907:2587:b0:847:410:ecf0 with SMTP id ad7-20020a170907258700b008470410ecf0mr25630294ejc.20.1674558336002;
        Tue, 24 Jan 2023 03:05:36 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtgPQHtzpYTYnB2IcCOyacyrwh8CF42BvHsvwfWOcRjuNm5j76ixtRWdYTFSeVKsE3vWcrecw==
X-Received: by 2002:a17:907:2587:b0:847:410:ecf0 with SMTP id ad7-20020a170907258700b008470410ecf0mr25630288ejc.20.1674558335805;
        Tue, 24 Jan 2023 03:05:35 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id s15-20020a170906454f00b00872c0bccab2sm741539ejq.35.2023.01.24.03.05.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jan 2023 03:05:35 -0800 (PST)
Message-ID: <19c0b6c3-ef5d-b56c-45fe-b15f98d0d4b2@redhat.com>
Date: Tue, 24 Jan 2023 12:05:34 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 00/57] media: atomisp: Big power-management changes + lots
 of fixes
To: Andy Shevchenko <andy@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Tsuchiya Yuto <kitakar@gmail.com>, Yury Luneff <yury.lunev@gmail.com>,
 Nable <nable.maininbox@googlemail.com>, andrey.i.trufanov@gmail.com,
 Fabio Aiuto <fabioaiuto83@gmail.com>, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev
References: <20230123125205.622152-1-hdegoede@redhat.com>
 <Y8+6euqoTP0GtlMN@smile.fi.intel.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Y8+6euqoTP0GtlMN@smile.fi.intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Andy,

On 1/24/23 12:01, Andy Shevchenko wrote:
> On Mon, Jan 23, 2023 at 01:51:08PM +0100, Hans de Goede wrote:
>> Hi All,
>>
>> Here is another set of patches resulting from my continued work
>> on cleaning up / improving the atomisp driver.
>>
>> The main changes here are power-management related, divided
>> into 2 sets:
>>
>> 1. Move the pm of the core atomisp device to its own custom PM
>>    domain. We turn the ISP on/off through the P-Unit and when
>>    off the PCI subsystem resume method complains about the PCI
>>    config space not being reachable. Changing to a custom PM
>>    domain fixes the logs getting filled with PCI subsys errors
>>    on every open of a /dev/video# node
>>
>> 2. Except for devices shipped with Android as factory image,
>>    all the DSDTs I have seen have proper ACPI pm code for
>>    the sensors. So we really should be using ACPI pm for this.
>>
>>    This series contains a lot of ov2680 patches, including
>>    reworking the controls (so that control changes can be
>>    delayed to stream on time instead of directly trying to do
>>    i2c writes to the turned off sensor). Basically modernizing
>>    the ov2680 driver a lot (there are still some atomisp-isms left).
>>
>>    And then finally after all the ov2680 cleanups it moves
>>    the ov2680 code over to using runtime-pm + ACPI pm,
>>    dropping all the direct PMIC + clk poking done by the
>>    atomisp_gmin_platform code.
>>
>> Besides that this also contains quite a few other fixes / cleanups
>> for things which I encountered during the way and it contains the
>> start of making the ov2722 driver work. With the changes present
>> in that driver I get a working (but very dark) stream. I expect
>> that once I add a proper exposure control this will start working
> 
> The non-commented patches were reviewed, but I'm not so familiar with the
> details of the functionality of the PM parts there. So I left them for others
> to review.

Thank you very much for reviewing this monster series!

I agree with all your code remarks / requested changes.

I'll make this changes in my personal tree and then prepare
a pull-req for Mauro with the updated patches.

I'll go over the couple of cases where you had questions
about things now.

I'll process the requested code changes (and add your Reviewed-by-s)
when I can make some time to work on this later this week.

Regards,

Hans

