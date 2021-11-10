Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE2EB2C87
	for <linux-staging@lists.linux.dev>; Wed, 10 Nov 2021 13:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1636549998;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=visrAIrttqVR0Qhg0wAKCuRIxyMBo+QeZK/AFJCCiKY=;
	b=N8rgPy5EJQIYyF1diSyvFEdhvb9aOBnTOcG5CKOO4gqwcUP2C3Zm0FsI6czai8mdOcht8M
	vOd7yjLdcY8frVEZFx2HAoIeKjELjUstMuqU0Q6c402Qegm+JvKbZ7I9z2vBwMxXNgBxwW
	WKDjtg3SfxxvTBYePg9kMcWaSZLJM3M=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-32-dLUoXUM8OHCoyJ4bRadTgQ-1; Wed, 10 Nov 2021 08:13:15 -0500
X-MC-Unique: dLUoXUM8OHCoyJ4bRadTgQ-1
Received: by mail-ed1-f69.google.com with SMTP id x13-20020a05640226cd00b003e2bf805a02so2233568edd.23
        for <linux-staging@lists.linux.dev>; Wed, 10 Nov 2021 05:13:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=visrAIrttqVR0Qhg0wAKCuRIxyMBo+QeZK/AFJCCiKY=;
        b=WIdEFnFSMnTAzvYFRTaiMD51KNBU7Wea0H3EnSlfxzbB29sk2dAuPIwJ35Vf1Mfuty
         HRM2Zesm0mEwCguwrum3YZt7nNn6nDRxFbiQaOlU9hbU+ysHU3znP1KTE6KZ4z+zjmYS
         nLDG+hspEm4wyyvSdfnOCFkY+TvqJGLJE4yfk4E93AOEQeP/FBqKaFFQoJE4zoV9R+o0
         xl9UswlPDYhM5jcwUCTvBaBIORaHY/nLndLV+POpRoD+UE8spLtdoN7SAsVSjaZH3P82
         i1q1h+aeMRKMrA+8lbV8vvNctjH3bbygYfwrb1DrbHuC6zfKDijh4A80qNWeA8Bf2qu2
         RWzw==
X-Gm-Message-State: AOAM533/SJXkf0IVmow9IA95iuu5p8QEC3XhHXO/pj/joQ60FLlFaexh
	pNtbLFvjdhyxMzO4GY4PAM5nu5msCKl4hAqvtJTSZ7xQsTMOsWw3wyVGl0NnecStLYBgSRBEL7Q
	JH+yn+RiInynTt86H9i35UlXK1w==
X-Received: by 2002:a17:907:1c9c:: with SMTP id nb28mr19528809ejc.184.1636549994176;
        Wed, 10 Nov 2021 05:13:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzsZeVMKhyqzXRMT2Tt5mW+GV9dQ5b7pgNmjMkK2crXtbT9GQ+RVUtrD/M7/ZdJTobu8NVQVg==
X-Received: by 2002:a17:907:1c9c:: with SMTP id nb28mr19528766ejc.184.1636549993863;
        Wed, 10 Nov 2021 05:13:13 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214? (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id e1sm7529747ejy.82.2021.11.10.05.13.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Nov 2021 05:13:13 -0800 (PST)
Message-ID: <2cff5849-3f59-2bde-b9ff-02b2a423cbb6@redhat.com>
Date: Wed, 10 Nov 2021 14:13:12 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 1/2] media: atomisp-ov2680: initialize return var
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: linuxarm@huawei.com, mauro.chehab@huawei.com,
 Deepak R Varma <drv@mailo.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev, Hans Verkuil <hverkuil@xs4all.nl>
References: <46ec939d911fc94b8a5e217874655e60512ad773.1636541941.git.mchehab+huawei@kernel.org>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <46ec939d911fc94b8a5e217874655e60512ad773.1636541941.git.mchehab+huawei@kernel.org>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 11/10/21 11:59, Mauro Carvalho Chehab wrote:
> As the settings are only applied when the device is powered on,
> it should return 0 when the device is not powered.
> 
> Not doing that causes a warning:
> 
> 	drivers/staging/media/atomisp/i2c/atomisp-ov2680.c: In function 'ov2680_ioctl':
> 	drivers/staging/media/atomisp/i2c/atomisp-ov2680.c:390:16: warning: 'ret' may be used uninitialized in this
> 	function [-Wmaybe-uninitialized]
> 	  390 |         return ov2680_set_exposure(sd, coarse_itg, analog_gain, digital_gain);
> 	      |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 	drivers/staging/media/atomisp/i2c/atomisp-ov2680.c:359:13: note: 'ret' was declared here
> 	  359 |         int ret;
> 	      |             ^~~
> 
> Reported-by: Hans Verkuil <hverkuil@xs4all.nl>
> Cc: Hans de Goede <hdegoede@redhat.com>
> Fixes: 6b5b60687ada ("media: atomisp-ov2680: Save/restore exposure and gain over sensor power-down")
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Thanks, the series looks good to me (weird that my compiler version
did not complain):

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

For the series.

Regards,

Hans

> ---
>  drivers/staging/media/atomisp/i2c/atomisp-ov2680.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
> index 34d008236bd9..497884d332e1 100644
> --- a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
> +++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
> @@ -356,7 +356,7 @@ static int ov2680_set_exposure(struct v4l2_subdev *sd, int exposure,
>  			       int gain, int digitgain)
>  {
>  	struct ov2680_device *dev = to_ov2680_sensor(sd);
> -	int ret;
> +	int ret = 0;
>  
>  	mutex_lock(&dev->input_lock);
>  
> 

