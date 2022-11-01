Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38EF77C
	for <linux-staging@lists.linux.dev>; Tue,  1 Nov 2022 13:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667309285;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TuQrcuKYSmxbYTgmez/0o7iIQmKrnxkqsQehv9iqJF8=;
	b=NbrnaNhNGaXQOCLKNH5mxIcLOKtOmVQcHeZ2cS0hNcuBcmFoL1XCzEJgpmVA4VcVTpLteB
	kJff8QnZhJyVD2RI6IbiH8aD4+Ykfhu+hL/di5QqBTJE0zm0+MDfCN/TkcJ+MmVlWMptKE
	EArR5cAHJB3GBw4oM7msG1M5pNX4QOU=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-265-LfbB_MWpPqiZCWsRsLPHkg-1; Tue, 01 Nov 2022 09:27:56 -0400
X-MC-Unique: LfbB_MWpPqiZCWsRsLPHkg-1
Received: by mail-ed1-f69.google.com with SMTP id w17-20020a056402269100b00461e28a75ccso9904234edd.8
        for <linux-staging@lists.linux.dev>; Tue, 01 Nov 2022 06:27:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TuQrcuKYSmxbYTgmez/0o7iIQmKrnxkqsQehv9iqJF8=;
        b=643Z1haJV9fMrJypNJSY4sg+y+P6tOqY8E+Re18rA+1rAIOPdoOnp6fUoXx8K4KAZK
         lQkJMpCPfXimWPqaON5TGv4PT+NrXI4c4CqxEmW8PTi8SIsxR5HzAMmSrgo/Qeb41un9
         CliYgwYgMemVAM3jPohgR/WopbfyRPs5chPBvjVecvBqe8t5VOcT4JlDWnDwA3Yegn6k
         3G9h4l/+JNjfAvn9JJp+R8togDiimYTp5OFiah0lAITiBzY2nKAFn/oxLUQyJbSQY1Z5
         E2iDw6GRhDuWv/RkMn5J+yFxHNHKkuaD2w+fNyVJKCmwRQ9ibbgXrlst21I9yT/aw5dL
         t3+Q==
X-Gm-Message-State: ACrzQf3Ln4CzEwAtFdWV3aMydIzyxoZ31+KHfTfOv1i1NRSSnDgm7LN/
	rtWScDYVmP3gSpnYV+LVh03ULGgy/02kiO9bC5539Mqz6x3NAzBTV7wMkc+jGNnCo6pG/cRr1w9
	lEXDCUhd9/1aWPEfwcSW7yjOn2A==
X-Received: by 2002:a17:907:da5:b0:7ad:7e95:6513 with SMTP id go37-20020a1709070da500b007ad7e956513mr18872140ejc.442.1667309275373;
        Tue, 01 Nov 2022 06:27:55 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7G9zSldywDkzM/+VU8twoULILd9bDVUvHBmvJahcdwrQ9vJk2UsXR4+PeLwv2QQ+0RgvbxhQ==
X-Received: by 2002:a17:907:da5:b0:7ad:7e95:6513 with SMTP id go37-20020a1709070da500b007ad7e956513mr18872125ejc.442.1667309275190;
        Tue, 01 Nov 2022 06:27:55 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id v27-20020aa7cd5b000000b00458898fe90asm4554226edw.5.2022.11.01.06.27.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Nov 2022 06:27:54 -0700 (PDT)
Message-ID: <48a28601-a3eb-8735-6a15-34436dcbd73e@redhat.com>
Date: Tue, 1 Nov 2022 14:27:53 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH AUTOSEL 6.0 15/34] media: atomisp-ov2680: Fix
 ov2680_set_fmt()
To: Sasha Levin <sashal@kernel.org>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, gregkh@linuxfoundation.org,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev
References: <20221101112726.799368-1-sashal@kernel.org>
 <20221101112726.799368-15-sashal@kernel.org>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20221101112726.799368-15-sashal@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Sasha,

I have no specific objections against the backporting of this
and other atomisp related patches.

But in general the atomisp driver is not yet in a state where
it is ready to be used by normal users. Progress is being made
but atm I don't really expect normal users to have it enabled /
in active use.

As such I'm also not sure if there is much value in backporting
atomisp changes to the stable series.

I don't know if you have a way to opt out certain drivers /
file-paths from stable series backporting, but if you do
you may want to consider opting out everything under:

drivers/staging/media/atomisp/

As said above I don't think doing the backports offers
much (if any) value to end users and I assume it does take
you some time, so opting this path out might be better.

Also given the fragile state of atomisp support atm
it is hard to say for me if partially backporting some of
the changes won't break the driver.

Regards,

Hans




On 11/1/22 12:27, Sasha Levin wrote:
> From: Hans de Goede <hdegoede@redhat.com>
> 
> [ Upstream commit adea153b4f6537f367fe77abada263fde8a1f7b6 ]
> 
> On sets actually store the set (closest) format inside ov2680_device.dev,
> so that it also properly gets returned by get_fmt.
> 
> This fixes the following problem:
> 
> 1. App does an VIDIOC_SET_FMT 640x480, calling ov2680_set_fmt()
> 2. Internal buffers (atomisp_create_pipes_stream()) get allocated
>    at 640x480 size by atomisp_set_fmt()
> 3. ov2680_get_fmt() gets called later on and returns 1600x1200
>    since ov2680_device.dev was not updated. So things get configured
>    to stream at 1600x1200, but the internal buffers created during
>    atomisp_create_pipes_stream() do not get updated in size
> 4. streaming starts, internal buffers overflow and the entire
>    machine freezes eventually due to memory being corrupted
> 
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
>  drivers/staging/media/atomisp/i2c/atomisp-ov2680.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
> index 4ba99c660681..ab52e35266bb 100644
> --- a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
> +++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
> @@ -894,11 +894,7 @@ static int ov2680_set_fmt(struct v4l2_subdev *sd,
>  	if (v_flag)
>  		ov2680_v_flip(sd, v_flag);
>  
> -	/*
> -	 * ret = startup(sd);
> -	 * if (ret)
> -	 * dev_err(&client->dev, "ov2680 startup err\n");
> -	 */
> +	dev->res = res;
>  err:
>  	mutex_unlock(&dev->input_lock);
>  	return ret;

