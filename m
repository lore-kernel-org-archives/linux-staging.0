Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C22410F9
	for <linux-staging@lists.linux.dev>; Tue, 24 Jan 2023 11:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674559952;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7n8vB6/xbQ+I/DYw8IeNOlB4GubtM8a9xAp956gIN4k=;
	b=eYYgetGYibdR1WIo6m04eqW/aXx+j5oJuyHoPDPTRxOHHeLsOxLtJlBYGnibnR1vEFRNpc
	G47ra92wpWJbuoKLHQJhztBIi3P8QIaV9SZiao9iGGtQlyTrChwdijNidm2tuTM8ppdduS
	uUD5mHED3oS3+KzleoT1XtA1QiHPW8o=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-164-WmvMBnASPju4fJtDvKfdXg-1; Tue, 24 Jan 2023 06:32:31 -0500
X-MC-Unique: WmvMBnASPju4fJtDvKfdXg-1
Received: by mail-ed1-f70.google.com with SMTP id z18-20020a05640235d200b0049d84165065so10553658edc.18
        for <linux-staging@lists.linux.dev>; Tue, 24 Jan 2023 03:32:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7n8vB6/xbQ+I/DYw8IeNOlB4GubtM8a9xAp956gIN4k=;
        b=zly92E7igWz2IKCBFTjjIknm+sl1gqdS3imM8QJwtl33FQM17Bbd91+BlHbvh2IIdU
         1dSOYcwUsIQnZ4y2bFKK6bJtFRsMZ9FPvmdErJ1hDBb7Z/2wYNsjxcUmXqABJftnVGKG
         EE3XVgBok6Q0/0C+1C/xFjK07xy5Xdslg36f0jCe3AwnlymmKuHWOdSHTi2dqTyYa+Pb
         danu5ghB0kGWwVl9SGatcsToB506oLL0F3BEdEyJTWIHY9e2CcvgERWSw6pDgnrJaibZ
         8rbNHzpPN08BixOwulS/WQyhJ4a9/Ux3SkfRJ7Ns65KFKOVfnmVXGe8/dJs8omMXNVDA
         G73A==
X-Gm-Message-State: AFqh2krEuQArX1ACbmPHNJse/Uv/pDSX8Id0W2U1RIkCs62abmn5e/+G
	6BQ7c7J9/YRicKfEvj1+ikqQNJUBikkkx+bj0Mvu8+EdCdSF+V0PmBdIKsGbf0fodv4z8r7ZYzr
	UOcRHGzXruROb4TV2wQedbt3bEA==
X-Received: by 2002:a17:906:6313:b0:872:6508:190 with SMTP id sk19-20020a170906631300b0087265080190mr32097134ejc.6.1674559949339;
        Tue, 24 Jan 2023 03:32:29 -0800 (PST)
X-Google-Smtp-Source: AMrXdXv5L7M8WbENml9bhRRc624KgKSuCEmyZVMDifzuwhmBzWwr1sSg3coWR552tlp8Zmi0J8Lf5w==
X-Received: by 2002:a17:906:6313:b0:872:6508:190 with SMTP id sk19-20020a170906631300b0087265080190mr32097111ejc.6.1674559949172;
        Tue, 24 Jan 2023 03:32:29 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id ka11-20020a170907990b00b007aea1dc1840sm761971ejc.111.2023.01.24.03.32.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jan 2023 03:32:28 -0800 (PST)
Message-ID: <d5cad6ed-34c0-44fe-1507-e59bdd0e64fb@redhat.com>
Date: Tue, 24 Jan 2023 12:32:27 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 54/57] media: atomisp: ov2722: Power on sensor from
 set_fmt() callback
To: Andy Shevchenko <andy@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Tsuchiya Yuto <kitakar@gmail.com>, Yury Luneff <yury.lunev@gmail.com>,
 Nable <nable.maininbox@googlemail.com>, andrey.i.trufanov@gmail.com,
 Fabio Aiuto <fabioaiuto83@gmail.com>, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev
References: <20230123125205.622152-1-hdegoede@redhat.com>
 <20230123125205.622152-55-hdegoede@redhat.com>
 <Y87U/UGWKyW4soys@smile.fi.intel.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Y87U/UGWKyW4soys@smile.fi.intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 1/23/23 19:42, Andy Shevchenko wrote:
> On Mon, Jan 23, 2023 at 01:52:02PM +0100, Hans de Goede wrote:
>> Depending on which order userspace makes various v4l2 calls, the sensor
>> might still be powered down when set_fmt is called.
>>
>> What should really happen here is delay the writing of the mode-related
>> registers till streaming is started, but for now use the same quick fix
>> as the atomisp_ov2680 / atomisp_gc0310 code and call power_up() from
>> set_fmt() in combination with keeping track of the power-state to avoid
>> doing the power-up sequence twice.
> 
> OK.
> Reviewed-by: Andy Shevchenko <andy@kernel.org>
> 
> Is there a plan to drop this hack from all of the (AtomISP) sensor drivers?

Yes this is the next one on my list to convert to runtime-pm +
ACPI powermanagement. Which needs to be done on a sensor by sensor
basis :|

Regards,

Hans




> 
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>  drivers/staging/media/atomisp/i2c/atomisp-ov2722.c | 12 ++++++++++++
>>  drivers/staging/media/atomisp/i2c/ov2722.h         |  2 +-
>>  2 files changed, 13 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
>> index e09c80d1f9ec..5d2e6e2e72f0 100644
>> --- a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
>> +++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
>> @@ -528,6 +528,9 @@ static int power_up(struct v4l2_subdev *sd)
>>  		return -ENODEV;
>>  	}
>>  
>> +	if (dev->power_on == 1)
>> +		return 0; /* Already on */
>> +
>>  	/* power control */
>>  	ret = power_ctrl(sd, 1);
>>  	if (ret)
>> @@ -552,6 +555,7 @@ static int power_up(struct v4l2_subdev *sd)
>>  	/* according to DS, 20ms is needed between PWDN and i2c access */
>>  	msleep(20);
>>  
>> +	dev->power_on = 1;
>>  	return 0;
>>  
>>  fail_clk:
>> @@ -575,6 +579,9 @@ static int power_down(struct v4l2_subdev *sd)
>>  		return -ENODEV;
>>  	}
>>  
>> +	if (dev->power_on == 0)
>> +		return 0; /* Already off */
>> +
>>  	ret = dev->platform_data->flisclk_ctrl(sd, 0);
>>  	if (ret)
>>  		dev_err(&client->dev, "flisclk failed\n");
>> @@ -592,6 +599,7 @@ static int power_down(struct v4l2_subdev *sd)
>>  	if (ret)
>>  		dev_err(&client->dev, "vprog failed.\n");
>>  
>> +	dev->power_on = 0;
>>  	return ret;
>>  }
>>  
>> @@ -669,6 +677,9 @@ static int ov2722_set_fmt(struct v4l2_subdev *sd,
>>  
>>  	mutex_lock(&dev->input_lock);
>>  
>> +	/* s_power has not been called yet for std v4l2 clients (camorama) */
>> +	power_up(sd);
>> +
>>  	dev->pixels_per_line = dev->res->pixels_per_line;
>>  	dev->lines_per_frame = dev->res->lines_per_frame;
>>  
>> @@ -959,6 +970,7 @@ static int ov2722_probe(struct i2c_client *client)
>>  		return -ENOMEM;
>>  
>>  	mutex_init(&dev->input_lock);
>> +	dev->power_on = -1;
>>  
>>  	dev->res = &ov2722_res_preview[0];
>>  	v4l2_i2c_subdev_init(&dev->sd, client, &ov2722_ops);
>> diff --git a/drivers/staging/media/atomisp/i2c/ov2722.h b/drivers/staging/media/atomisp/i2c/ov2722.h
>> index 020743a944c4..640d3ffcaa5c 100644
>> --- a/drivers/staging/media/atomisp/i2c/ov2722.h
>> +++ b/drivers/staging/media/atomisp/i2c/ov2722.h
>> @@ -198,7 +198,7 @@ struct ov2722_device {
>>  	struct ov2722_resolution *res;
>>  
>>  	struct camera_sensor_platform_data *platform_data;
>> -	int run_mode;
>> +	int power_on;
>>  	u16 pixels_per_line;
>>  	u16 lines_per_frame;
>>  	u8 type;
>> -- 
>> 2.39.0
>>
> 

