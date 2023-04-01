Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E49D19C
	for <linux-staging@lists.linux.dev>; Sat,  1 Apr 2023 10:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680346739;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n0m9899QyNGgz290CASKStrnyLjXT/71L/LfFmt6KFA=;
	b=is82sWbhtgM1EcxVbohw9jy6DaRHFsZh+AhTaz9DvIyDLZPfz1+WzfJHVyWVbu4vowzx17
	vgDZ8TjdZOhQeYF6ur4Ezvlypi0rhhyLIBV5C3WzbNhXQzKMrk60fawGGIsAIiHED8CzRc
	7WlBK05Zlvf08xnx/pYCQLvtCkjOrB8=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-620-Rj5EXjjZOTyYSKh8MnU-7Q-1; Sat, 01 Apr 2023 06:58:57 -0400
X-MC-Unique: Rj5EXjjZOTyYSKh8MnU-7Q-1
Received: by mail-ed1-f72.google.com with SMTP id m18-20020a50d7d2000000b00501dfd867a4so35417245edj.20
        for <linux-staging@lists.linux.dev>; Sat, 01 Apr 2023 03:58:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680346736;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n0m9899QyNGgz290CASKStrnyLjXT/71L/LfFmt6KFA=;
        b=3Y46sYtXN/bGkxlDDjcJ1nfUYxh3c4TCcTGhjb1aAosCQ6L1A0GMuBGCHNZYLbrBza
         T7qUAa23F7quLMxbACqW/RP8LimeWSUDHHHQA6T0RCU0nqmaMd32weWRxoPbt0RRmFVw
         /d3UHj/gck3z+fHkMTCDRWUAL14WEc3CK/yDdfQ+VX3S6Tw4XYFBfJjIDmXxoXov/U0/
         gckuvA4f35H4nN7XySSLHh8CbXk4M20u5e7YwLtZyVE4BKMndghCMtCaLwoQCj+/20Pe
         yLdWINBAGUhgQQ37bUBujTnlpXVYlC2wRb2w0fhNIYKLAbRH0IGxl/2cfnyJQeSTzyaf
         OCNA==
X-Gm-Message-State: AAQBX9c13FhObgG5p8G2lzi8E8SH414xAQRbUlALTtTLbBuZCFV/b7se
	1t8gIBn5hjgCosIr8u5jKUQIu+uvDMIj9Va/T3wD/iVAUHbb4RV3PJn0qiI7eb47iiVnJRuCfMD
	hF3VjWZn6zWxi/vGCX75RJt96wg==
X-Received: by 2002:a17:906:3a45:b0:88a:cbd1:e663 with SMTP id a5-20020a1709063a4500b0088acbd1e663mr31508682ejf.6.1680346736710;
        Sat, 01 Apr 2023 03:58:56 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZtIShdxbTjbgmzNxznavZmuyezGlgZdr5OMmOztDE+cRHOW3xJQH9hVSALTDDGl9RQcTxppg==
X-Received: by 2002:a17:906:3a45:b0:88a:cbd1:e663 with SMTP id a5-20020a1709063a4500b0088acbd1e663mr31508674ejf.6.1680346736398;
        Sat, 01 Apr 2023 03:58:56 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 11-20020a170906010b00b0093344ef3764sm1949606eje.57.2023.04.01.03.58.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Apr 2023 03:58:55 -0700 (PDT)
Message-ID: <109be822-9439-cd5a-c7f7-c63516f92099@redhat.com>
Date: Sat, 1 Apr 2023 12:58:55 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 02/10] media: atomisp: Remove continuous mode support
To: Andy Shevchenko <andy@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Kate Hsuan <hpa@redhat.com>,
 Tsuchiya Yuto <kitakar@gmail.com>, Yury Luneff <yury.lunev@gmail.com>,
 Nable <nable.maininbox@googlemail.com>, andrey.i.trufanov@gmail.com,
 Fabio Aiuto <fabioaiuto83@gmail.com>, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev
References: <20230221145906.8113-1-hdegoede@redhat.com>
 <20230221145906.8113-3-hdegoede@redhat.com>
 <Y/TqBBdU7dbYPIsW@smile.fi.intel.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Y/TqBBdU7dbYPIsW@smile.fi.intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Andy,

Thank you for the reviews!

On 2/21/23 16:57, Andy Shevchenko wrote:
> On Tue, Feb 21, 2023 at 03:58:58PM +0100, Hans de Goede wrote:
>> Continues mode is a special mode where 2 /dev/video devices can be active
>> at the same time. Either the video-preview + video nodes or the
>> viewfinder (for still capture) + capture nodes.
>>
>> For the video-preview + video-recording case modern userspace will
>> use a single stream multiplexed by pipewire.
>>
>> The still-capture case is extra special only starting the preview
>> stream and then relying on a custom ATOMISP_IOC_S_CONT_CAPTURE_CONFIG
>> ioctl to set things up followed by a second stream on to capture
>> the amount of configured still pictures. While running the sensor
>> at full resolution all the time. This case too is better handled
>> with dma-buf + GPU downscaling for the view-finder rather then all this
>> custom special code. Besises this the ioctl expects a bunch of special
>> non error checked conditions to be met otherwise things will crash/hang.
>>
>> The continues mode also involves a special cases all over the code
>> getting in the way of further cleanups and simplifying the code to
>> using just 1 /dev/video# node. So lets remove it and the
>> related custom ATOMISP_IOC_S_CONT_CAPTURE_CONFIG ioctl.
> 
> ...
> 
>> +	ret = atomisp_set_fmt_to_snr(vdev, &s_fmt,
>> +				     f->fmt.pix.pixelformat, padding_w,
> 
> At least one parameter can be moved to the previous line.

Ack, fixed in my local tree which I will push to:

https://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git/log/?h=media-atomisp

When I'm done processing your other review remarks.

> 
>> +				     padding_h, dvs_env_w, dvs_env_h);
>> +	if (ret) {
>> +		dev_warn(isp->dev,
>> +			 "Set format to sensor failed with %d\n", ret);
>> +		return -EINVAL;
> 
> ...
> 
>>  	case ATOMISP_RUN_MODE_PREVIEW:
>> -		if (!asd->continuous_mode->val) {
>> -			if (pipe_id == IA_CSS_PIPE_ID_PREVIEW)
>> -				return true;
>> +		if (pipe_id == IA_CSS_PIPE_ID_PREVIEW)
>> +			return true;
>>  
>> -			return false;
>> -		}
>> -		fallthrough;
>> +		return false;
> 
> 		return pipe_id == IA_CSS_PIPE_ID_PREVIEW;

I agree that that is cleaner, but there are a bunch of other cases
in this switch case which are not touched by this patch and
they all follow the same pattern as which the modified cases
use after this patch, e.g. :

        case ATOMISP_RUN_MODE_STILL_CAPTURE:
                if (pipe_id == IA_CSS_PIPE_ID_CAPTURE)
                        return true;

                return false;

So this patch basically makes all of them consistent with
each other. So I'm going to keep this as is.

Regards,

Hans



> 
> ...
> 
>>  	case ATOMISP_RUN_MODE_VIDEO:
>> -		if (!asd->continuous_mode->val) {
>> -			if (pipe_id == IA_CSS_PIPE_ID_VIDEO ||
>> -			    pipe_id == IA_CSS_PIPE_ID_YUVPP)
>> -				return true;
>> -			else
>> -				return false;
>> -		}
>> -		fallthrough;
>> +		if (pipe_id == IA_CSS_PIPE_ID_VIDEO || pipe_id == IA_CSS_PIPE_ID_YUVPP)
>> +			return true;
>> +
>> +		return false;
> 
> Similar.
> 

