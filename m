Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B498110D
	for <linux-staging@lists.linux.dev>; Fri,  2 Sep 2022 09:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1662109468;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mYJgNCoJS9c+rxqFeOlaYN9sT0D37ykA0TCLZEWJUgU=;
	b=Zj6aCzfvufbSWM33QLa6FuG0dI7ZegooihPPW3qbNvOhXr9k03ZKifVyplAeH6elud9msD
	BsSS7em6JPR3vn/Vi+sAqcZZX/2htdi0EzF5bN4YNDwCyHsI3UnFc+m/t/+C90XW8H+NPL
	FfmDtsoWBuJhNtPV1uI3jky51nGuea8=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-67--HNFpI8MOF6IC3wlruGZ8g-1; Fri, 02 Sep 2022 05:04:26 -0400
X-MC-Unique: -HNFpI8MOF6IC3wlruGZ8g-1
Received: by mail-ed1-f71.google.com with SMTP id h6-20020aa7de06000000b004483647900fso986058edv.21
        for <linux-staging@lists.linux.dev>; Fri, 02 Sep 2022 02:04:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=mYJgNCoJS9c+rxqFeOlaYN9sT0D37ykA0TCLZEWJUgU=;
        b=6WSYzwBAK51R2MWYQ8mSRn7Owg0+gO88nnEb/mjyBoRgsxsCsXAjxzY0C4kXNdVV9c
         RSw0sG2Crp1YUGEyAEwg+UQBfDIyvV6EGnB5blXXNBsvWmsUg8mYUgYStni+qKco3uBn
         KbEIaaS9lMqWljlRE2ezxi0FFNgwn181vuDTgy3jqevwJALaZR5v8PTDHogkSU1Ltfpq
         uFpu3FBHN5T4uohQ0DZ3llugpSlXk9Wc/igjuVm3qs9efYdRdymzUtFTKLqEMnTjEOvr
         74nxQJ149cHAytDbOyE4v6W9iOj7TAdckl4GUEh681HqxwS39ueqynPAQ26wPUKPLjDT
         pcyA==
X-Gm-Message-State: ACgBeo0scYbQPsGhIT7lV/ONEtwLznUAA0Szny1IGmNsaOlED28qRg2k
	ZTmP9r8gI+mXKYCZJJ8jgHOZ79mdifPs3QEiRc0RE8rpmEe2rFQXrPU1NJnGkdPO9QeznVHEvGJ
	pejUEA/A94bNKuZXSr3aniXcnsA==
X-Received: by 2002:a17:906:7106:b0:73d:c534:1adc with SMTP id x6-20020a170906710600b0073dc5341adcmr26231918ejj.238.1662109465829;
        Fri, 02 Sep 2022 02:04:25 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4yjLTQimVvytP7KasoZWuO9wMQeTQmGA3S9Nb5YzxanqBHhxsFsPlzFirx8LSawOzF/cylag==
X-Received: by 2002:a17:906:7106:b0:73d:c534:1adc with SMTP id x6-20020a170906710600b0073dc5341adcmr26231895ejj.238.1662109465557;
        Fri, 02 Sep 2022 02:04:25 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id p23-20020a056402045700b0044792480994sm980694edw.68.2022.09.02.02.04.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Sep 2022 02:04:24 -0700 (PDT)
Message-ID: <ce0d2ec6-3ec7-9f9f-59f9-0bf2a6078c9c@redhat.com>
Date: Fri, 2 Sep 2022 11:04:24 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 10/14] media: atomisp: Register /dev/* nodes at the end of
 atomisp_pci_probe()
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Tsuchiya Yuto <kitakar@gmail.com>, Andy Shevchenko <andy@kernel.org>,
 Yury Luneff <yury.lunev@gmail.com>, Nable <nable.maininbox@googlemail.com>,
 andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev
References: <20220901094626.11513-1-hdegoede@redhat.com>
 <20220901094626.11513-11-hdegoede@redhat.com>
 <YxEOhy0YPnBuZiQs@smile.fi.intel.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <YxEOhy0YPnBuZiQs@smile.fi.intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

Thank you for reviewing this series.

On 9/1/22 21:56, Andy Shevchenko wrote:
> On Thu, Sep 01, 2022 at 11:46:22AM +0200, Hans de Goede wrote:
>> Register /dev/* nodes at the end of atomisp_pci_probe(), this is
>> a prerequisite for dropping the loading mutex + ready flag kludge
>> for delaying open() calls on the /dev/* nodes .
> 
> ...
> 
>>  			for (; i > 0; i--)
>>  				atomisp_subdev_unregister_entities(
>>  				    &isp->asd[i - 1]);
> 
> This...

I presume you mean the few lines above that actually:

@@ -1194,11 +1194,8 @@ static int atomisp_register_entities(struct atomisp_device *isp)
 		struct atomisp_sub_device *asd = &isp->asd[i];
 
 		ret = atomisp_subdev_register_subdev(asd, &isp->v4l2_dev);
-		if (ret == 0)
-			ret = atomisp_subdev_register_video_nodes(asd, &isp->v4l2_dev);
 		if (ret < 0) {
-			dev_err(isp->dev,
-				"atomisp_subdev_register_entities fail\n");
+			dev_err(isp->dev, "atomisp_subdev_register_subdev fail\n");
 			for (; i > 0; i--)
 				atomisp_subdev_unregister_entities(
 				    &isp->asd[i - 1]);


Notice the atomisp_subdev_register_video_nodes() call is removed there,
leaving only atomisp_subdev_register_subdev() (which is also why the dev_err
msg is changed).

Actually moving that call (+ a few others) to later is the whole
purpose of this patch.

> 
>> +	for (i = 0; i < isp->num_of_streams; i++) {
>> +		err = atomisp_subdev_register_video_nodes(&isp->asd[i], &isp->v4l2_dev);
>> +		if (err)
>> +			return err;
>> +	}
> 
> ...and this looks like a dup.

Where as this time while looping over the stream the code is calling
atomisp_subdev_register_video_nodes().

So yes we have 2 "for (i = 0; i < isp->num_of_streams; i++) {}"
loops, but:

Loop 1 does: atomisp_subdev_register_subdev()
Loop 2 does: atomisp_subdev_register_video_nodes()

So I see no duplication here?

Regards,

Hans



