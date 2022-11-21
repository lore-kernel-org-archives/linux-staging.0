Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4E6F2578
	for <linux-staging@lists.linux.dev>; Mon, 21 Nov 2022 12:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1669034030;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=meVOHhXRBgs9gnMyNYKv3EIny7niHjL9J4IgWMFVG/A=;
	b=Qn8VcBVqtVjhaVjqEN5RjvnIBwpgbzYUgBdousZ4xwZK6zk3bNim/1ci6QH8My4hJL8S4q
	f66Bm+a/wycUF/M3b9V+yG12qodd0HVPmz4VQudO43mB4a97im7G+pFZ8oaMRvNk7FhsTM
	qVWyYrfvDKDXW+g3QeJVVqgHjTZxsew=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-439-cmGhUM2DMhO8rxhYWidDTg-1; Mon, 21 Nov 2022 07:33:47 -0500
X-MC-Unique: cmGhUM2DMhO8rxhYWidDTg-1
Received: by mail-ed1-f71.google.com with SMTP id l18-20020a056402255200b004633509768bso6691188edb.12
        for <linux-staging@lists.linux.dev>; Mon, 21 Nov 2022 04:33:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=meVOHhXRBgs9gnMyNYKv3EIny7niHjL9J4IgWMFVG/A=;
        b=TyWDrR2KchQZkSISb/EFpEu4gnLePjG5zboOL7zWt+6zMgLBrRnAwNowJHHQkzZ/wC
         KXBA7oLWXcIZWVF9NdTY9f2zwpvWuzBuasCOTqRv2f5GSEyoIVMn0FM1VBiJidVroFXG
         UyViSbQCAb6MXEtVKuhCt5HBIEDJx8Xk+dAFzj8VmuBjbrQSabTuNZBG1hxCJISCNaGT
         VjiGBQk2lhwPkN91rZzMWGanPbhpudjEIYxZurmAmnsp4Ing1ODhwkGnj3xeGPT5d5WG
         F0Y8mti0PBBbues9iNGbiCTVHjF8P1klmlZR3pchnbD+sG3nMihL7OBb7vEFBt9gBMaK
         kT2g==
X-Gm-Message-State: ANoB5pka9bMihMl4vPKVlRSX5/qInc501R/XK5+tZhjC3vtfG6+25em6
	5jG7FkLpGG1If+iclzF9U392c1cEl2PcYwsvF+1cuSBGwxAN4/2kYbP4nT0CCOLwuuBm151x4H0
	uewuzjgDOhWJOv2gppFrO1KOYDQ==
X-Received: by 2002:a05:6402:2993:b0:462:845:ba98 with SMTP id eq19-20020a056402299300b004620845ba98mr15798956edb.12.1669034026240;
        Mon, 21 Nov 2022 04:33:46 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4eCgznlypt31HXqg6iFHx71IOJT/sT0aWZv0mN5+IPcESAXjncwsMlflLBdRBSbnG1BWtvEQ==
X-Received: by 2002:a05:6402:2993:b0:462:845:ba98 with SMTP id eq19-20020a056402299300b004620845ba98mr15798943edb.12.1669034026087;
        Mon, 21 Nov 2022 04:33:46 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id v10-20020a170906292a00b0078e0973d1f5sm4975532ejd.0.2022.11.21.04.33.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Nov 2022 04:33:45 -0800 (PST)
Message-ID: <81220468-86d3-d6ff-07aa-0c5c72c08df2@redhat.com>
Date: Mon, 21 Nov 2022 13:33:44 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 17/20] media: atomisp: Move calling of css_[un]init() to
 power_on()/_off()
To: Andy Shevchenko <andy@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Tsuchiya Yuto <kitakar@gmail.com>, Yury Luneff <yury.lunev@gmail.com>,
 Nable <nable.maininbox@googlemail.com>, andrey.i.trufanov@gmail.com,
 Fabio Aiuto <fabioaiuto83@gmail.com>, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev
References: <20221120224101.746199-1-hdegoede@redhat.com>
 <20221120224101.746199-18-hdegoede@redhat.com>
 <Y3tBc4u/oZ6jacrm@smile.fi.intel.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Y3tBc4u/oZ6jacrm@smile.fi.intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 11/21/22 10:14, Andy Shevchenko wrote:
> On Sun, Nov 20, 2022 at 11:40:58PM +0100, Hans de Goede wrote:
>> atomisp_css_init() is always called after calling atomisp_power_on()
>> either directly or through getting a runtime-pm reference.
>>
>> Likewise atomisp_css_uninit() is always called after calling
>> atomisp_power_off().
>>
>> Move the call site of these 2 functions to inside atomisp_power_on() /
>> atomisp_power_off() to make this more explicit.
> 
> ...
> 
>>  	dev_dbg(isp->dev, "%s\n", __func__);
>> -	atomisp_css_uninit(isp);
>> +
>>  	ret = atomisp_power_off(isp->dev);
>>  	if (ret < 0)
>>  		dev_err(isp->dev, "atomisp_power_off failed, %d\n", ret);
>>  
>>  	ret = atomisp_power_on(isp->dev);
>> -	if (ret < 0)
>> +	if (ret < 0) {
>>  		dev_err(isp->dev, "atomisp_power_on failed, %d\n", ret);
>> -
>> -	ret = atomisp_css_init(isp);
>> -	if (ret)
> 
>>  		isp->isp_fatal_error = true;
> 
> This was only set when css_init() failed, now it may be set even when
> power_on() fails. Why is it not a problem? Commit message doesn't shed
> a light on this change.

Failing to power-on the device is pretty fatal too, but this is indeed
a behavior change. I have updated the commit message to reflect this.

Regards,

Hans


