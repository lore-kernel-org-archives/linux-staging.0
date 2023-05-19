Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 408996FAF
	for <linux-staging@lists.linux.dev>; Fri, 19 May 2023 10:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684492514;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4oiYFKF2ugMD0sw+r8TK6rHGBZgsXSE7VHswmxOaISI=;
	b=CQtS+pOACxZNrSSiCvVnpfqNl9hjw0bTgntY2Gce1f3JviAkac0t8ZJpYRVpLqlsmGDXR+
	zeutbEDnOFULaPIqq/KOSiMNnIOzET6IOiTI0M/4MAwQcHvvLVG5yP53/fu7XOzSeV0KJJ
	9LK6pokC8BT6X1E7YMJn0u1qnt9EvIg=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-150-2elnxwmvNqa2ViIaZtNQ3g-1; Fri, 19 May 2023 06:35:13 -0400
X-MC-Unique: 2elnxwmvNqa2ViIaZtNQ3g-1
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-506b21104faso1899618a12.1
        for <linux-staging@lists.linux.dev>; Fri, 19 May 2023 03:35:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684492512; x=1687084512;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4oiYFKF2ugMD0sw+r8TK6rHGBZgsXSE7VHswmxOaISI=;
        b=kGE/X5Q4FjlLB6eAe3wLLjDCrAHsXjch0vTv2k7uMWzuk03rtkGkE79XEL5/fCbEkp
         +Fs9HDSaaDG1sKnVBtoHcmdaRNuVaiFvtMXf7KrNdrT+vRvK93cLY4R7jEp0txDTYOZc
         u/Ap/xzKySrhyRVJWVJoZBVDkP4aYUk/ztbniMfpx6tlWU2m69UIlUs2ai97CCGEzYC7
         S8W4uq7zrs3bkj4oLpR0L1d47k7mhx/BHw/xWLDQc3jNt3P3uY0JnGCUZZBmRZCNzM3k
         22lKV15rMH5v+DezwT5XGsSerhl9noR5p3DKnuDAgPP0DLiN0p75xSr1Yf3sOe+dfQfK
         HXfQ==
X-Gm-Message-State: AC+VfDy4E/SSwgpgDpmqcuM46oaN/7uSYXFE4OoI/DEMAe1CnKMlyUVw
	d6EQ6coFJQqFsckqk30wuje7yclA2mVZPw2Vfb/WGp29kQxa2XfBuhbwTQ/tvYA1XqWXXhnQt4z
	KEtdBm5pQDyaHG8ffKBfB2lw/9Q==
X-Received: by 2002:aa7:d9d2:0:b0:506:83fc:2dab with SMTP id v18-20020aa7d9d2000000b0050683fc2dabmr1257740eds.22.1684492512589;
        Fri, 19 May 2023 03:35:12 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6PDN6DC+R6+VJHY1CRMB1hRVFb5nwZRIO8XORwzgXUe0GWqQDS7FD+nSE0QIfKdL4fmCo4lg==
X-Received: by 2002:aa7:d9d2:0:b0:506:83fc:2dab with SMTP id v18-20020aa7d9d2000000b0050683fc2dabmr1257728eds.22.1684492512325;
        Fri, 19 May 2023 03:35:12 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id y13-20020aa7d50d000000b00504ecc4fa96sm1520283edq.95.2023.05.19.03.35.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 May 2023 03:35:11 -0700 (PDT)
Message-ID: <e7dd784e-5273-a66b-ce1b-7959ac55d596@redhat.com>
Date: Fri, 19 May 2023 12:35:10 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 7/9] media: atomisp: gc0310: Remove gc0310_s_config()
 function
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
 Tsuchiya Yuto <kitakar@gmail.com>, Yury Luneff <yury.lunev@gmail.com>,
 Nable <nable.maininbox@googlemail.com>, andrey.i.trufanov@gmail.com,
 Fabio Aiuto <fabioaiuto83@gmail.com>, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev
References: <20230518153214.194976-1-hdegoede@redhat.com>
 <20230518153214.194976-8-hdegoede@redhat.com>
 <CAHp75VcnXs3wmE0waf6oQM2-sax83RaEh5ESi-jN9f7FpQ0HXQ@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75VcnXs3wmE0waf6oQM2-sax83RaEh5ESi-jN9f7FpQ0HXQ@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

HI,

On 5/19/23 12:32, Andy Shevchenko wrote:
> On Thu, May 18, 2023 at 6:32 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> gc0310_s_config() used to call camera_sensor_platform_data.csi_cfg() back
>> when the gc0310 driver was still using the atomisp_gmin_platform code
>> for power-management.
>>
>> Now it is just a weirdly named wrapper around gc0310_detect(), drop
>> gc0310_s_config() and make probe() call gc0310_detect() directly.
> 
> ...
> 
>> -       ret = i2c_smbus_read_word_swapped(client, GC0310_SC_CMMN_CHIP_ID_H);
>> +       ret = pm_runtime_get_sync(&client->dev);
>> +       if (ret >= 0)
>> +               ret = i2c_smbus_read_word_swapped(client, GC0310_SC_CMMN_CHIP_ID_H);
>> +       pm_runtime_put(&client->dev);
>>         if (ret < 0) {
>>                 dev_err(&client->dev, "read sensor_id failed: %d\n", ret);
>>                 return -ENODEV;
> 
> Not sure if it's good to have in this patch, but above can be cleaned up to
> 
>       pm_runtime_get_sync(&client->dev);
>       ret = i2c_smbus_read_word_swapped(client, GC0310_SC_CMMN_CHIP_ID_H);
>       pm_runtime_put(&client->dev);
>       if (ret < 0) {
>                dev_err(&client->dev, "read sensor_id failed: %d\n", ret);
>                return ret;
>       }
> 
> But I don't know what will be the response on the I2C bus if the
> device is powered off.

In my experience the i2c bus tends to get stuck when using it with
the sensor powered down and unsticking it is tricky (seems to
require a full i2c-controller reset).

So it is best to not even try if the pm_runtime_get_sync() fails
for some reason.

Regards,

Hans




