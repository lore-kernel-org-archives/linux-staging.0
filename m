Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46358210C
	for <linux-staging@lists.linux.dev>; Mon, 21 Nov 2022 12:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1669033648;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wKxH9/fWSqKGEkCfEcHmUeJnfpLMxgDZZRQLqro+QtU=;
	b=UfhWM29cPOamE7FgPLNOm322PpGh0uyU5+7z4ZRjtV33E8rZ/KQfKKuOqZOGNWU2CzqwfW
	1REqXnR/H0J9J9fDmeQk5GxNdLrI03LpOJJxyEBrVU/mHUm85a6/dl71EIgfjlBcVaVuD0
	mak6srAZyR7dxio3gkwajJ2m7cKkkc8=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-578-hokix2QvP5SObVITs2vAQQ-1; Mon, 21 Nov 2022 07:27:24 -0500
X-MC-Unique: hokix2QvP5SObVITs2vAQQ-1
Received: by mail-ej1-f70.google.com with SMTP id ne36-20020a1709077ba400b007aeaf3dcbcaso6430270ejc.6
        for <linux-staging@lists.linux.dev>; Mon, 21 Nov 2022 04:27:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wKxH9/fWSqKGEkCfEcHmUeJnfpLMxgDZZRQLqro+QtU=;
        b=LtXjMEjxXKfIdLLfpgG4lbErKo+8WE504dlEiXYLdP2lFiJah6WcbFw76dMve6trZI
         M0fzo/knu5j7n05215OS2x+8h3e52bNNjdbEEzbDgawXoy/UzqeOiJoBrMWr2865fYYB
         +ei1gVinDpzb2wTEd1vWIaC9DEM51MqNXY1oHcvE0xP+5Jp1kSHhrTg/n9FOGzqTV5pG
         GdY8vT6KikIZ2AZo/TArzPq1XVZBgirS6oQn8J+wk8Tui6NvW62yRq/KWdVAVCeD0geB
         ddwdK833989o6MQmTKsJO8RWy9QT7RgoYwjeFpEyCQNu4Q1poiLqFGoVbGcaKykdL3/R
         3CYw==
X-Gm-Message-State: ANoB5pltw7K8TH3oh6jeHSgq9WZzQ5l56tLx/Hk1RsFVYobpXca3WKFZ
	rrnwx+hasHm5qJliVpAuEG5bjoQ/a+uc7CTfRRyU1Sh2OSw1l29ioFIDhlq/FLCPdlP8yVx98I/
	dhDvhs6jHMpPiDGR107p+tnp5HA==
X-Received: by 2002:a17:907:7782:b0:7b6:dd6d:b829 with SMTP id ky2-20020a170907778200b007b6dd6db829mr2456655ejc.602.1669033643582;
        Mon, 21 Nov 2022 04:27:23 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5ca6+OaZv/0S/phi/znpxDmtprdtWtxlfAkP2Y7dCPF6UJn5q16s1ThL3qZr3Xb02QVOsGTA==
X-Received: by 2002:a17:907:7782:b0:7b6:dd6d:b829 with SMTP id ky2-20020a170907778200b007b6dd6db829mr2456640ejc.602.1669033643352;
        Mon, 21 Nov 2022 04:27:23 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id g18-20020a17090604d200b007415f8ffcbbsm4999398eja.98.2022.11.21.04.27.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Nov 2022 04:27:22 -0800 (PST)
Message-ID: <37d912ae-b33a-3be2-30d1-4fa6b6ddf098@redhat.com>
Date: Mon, 21 Nov 2022 13:27:21 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 01/20] media: atomisp: Silence: 'atomisp_q_one_s3a_buffer:
 drop one s3a stat which has exp_id xx' log messages
To: Andy Shevchenko <andy@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Tsuchiya Yuto <kitakar@gmail.com>, Yury Luneff <yury.lunev@gmail.com>,
 Nable <nable.maininbox@googlemail.com>, andrey.i.trufanov@gmail.com,
 Fabio Aiuto <fabioaiuto83@gmail.com>, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev
References: <20221120224101.746199-1-hdegoede@redhat.com>
 <20221120224101.746199-2-hdegoede@redhat.com>
 <Y3s84dzxX3ARSZPb@smile.fi.intel.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Y3s84dzxX3ARSZPb@smile.fi.intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 11/21/22 09:54, Andy Shevchenko wrote:
> On Sun, Nov 20, 2022 at 11:40:42PM +0100, Hans de Goede wrote:
>> Standard v4l2 userspace apps do not consume the s3a statistics block
>> data. Until we have a userspace consumer for this (libcamera), which
>> might also involve changing the API for this, lower the log level
>> of these messages to dev_dbg() to avoid them filling up the logs.
> 
> ...
> 
>> -			dev_warn(asd->isp->dev, "%s: drop one s3a stat which has exp_id %d!\n",
>> -				 __func__, exp_id);
>> +			dev_dbg(asd->isp->dev, "%s: drop one s3a stat which has exp_id %d!\n",
>> +				__func__, exp_id);
> 
> Please, drop __func__ as well. Most probably this can be run on the systems
> with Dynamic Debug enabled, meaning that __func__ and __LINE__ can be enabled
> at runtime.

Fixed in my media-atomisp branch.

Regards,

Hans

