Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C52C360
	for <linux-staging@lists.linux.dev>; Sun,  2 Apr 2023 12:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680439322;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1UFywKmJCh/dH+J1dNKAlPeVeb9RVoeM21gHDg/rCAw=;
	b=BXXYEM6L/z5enpFOYH/biFqjp241Z37mQEke/KlL9EBvo92kQJGscLfPo0hnqVKcCs44W1
	o4XXlz8yIQtaJY7HCufDhk0oYZ3QWvUy7hrLy1AtzQIcdlj8C1dPP/XWuMKGZxToY5yb2H
	r8E+cXhQ4c7GywCK/CnuN6qEm9RijxE=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-474-DIB4STepPKyl8pxMHBk5XA-1; Sun, 02 Apr 2023 08:42:01 -0400
X-MC-Unique: DIB4STepPKyl8pxMHBk5XA-1
Received: by mail-ed1-f72.google.com with SMTP id a27-20020a50c31b000000b0050047ecf4bfso37557781edb.19
        for <linux-staging@lists.linux.dev>; Sun, 02 Apr 2023 05:42:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680439320;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1UFywKmJCh/dH+J1dNKAlPeVeb9RVoeM21gHDg/rCAw=;
        b=uK3xib0UHu1tmKdQNft+zINBxm2ZwTHR0S8c+2tzee4kCSy42Vk4B7DfWf2r0JYz42
         GXt9tEODhKPKlRL1vXoD0q8qcU+AzJatb6SSF/+P445vDd8AdLn3uZMfiqfSZluDEItx
         qgPVB7KtwhIL+VFCrX5rirBFdctIEgHkIw3MUz7+ZUus9bJAEVuyza9bm/RjfmhVwdF1
         VphK6kBHa4AP/KZVe0jbTrQFs57LRNMPg7XJlQaMphlm/kIfiDOZU18gWmh7LNKLltp6
         oEfNgrn9pE9JQ175SA+ZMvwRghBSxIhADSpxNu1fS/Uuir2EAi3VvkcOHQQGtU3WhXYj
         cg6g==
X-Gm-Message-State: AAQBX9fgGDvZ0DdACdi8RhsJcaSylIuYrVTz0+Lj9WPNIDkjh1vhU2tW
	D1EgaXDkp2xi4E/+xC8ZNLCiezq9S2EynOH4X89adXaMj6XpewXdKOe6IXXg41LeFJKHy8wBxd8
	PSRqB5nK0SIjb2rjuWiu98nYVEQ==
X-Received: by 2002:a05:6402:b37:b0:502:91c6:d776 with SMTP id bo23-20020a0564020b3700b0050291c6d776mr4142243edb.11.1680439320438;
        Sun, 02 Apr 2023 05:42:00 -0700 (PDT)
X-Google-Smtp-Source: AKy350agRhrwAvV3oV7MopgFqLQJJYZB9wFQunVGH9UNrd7fmBfahLVGNdRcJRXA9I8tuZgoQu60gg==
X-Received: by 2002:a05:6402:b37:b0:502:91c6:d776 with SMTP id bo23-20020a0564020b3700b0050291c6d776mr4142233edb.11.1680439320167;
        Sun, 02 Apr 2023 05:42:00 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id bq18-20020a056402215200b00501c2a9e16dsm3165264edb.74.2023.04.02.05.41.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Apr 2023 05:41:59 -0700 (PDT)
Message-ID: <058628fe-8ade-4ab6-1822-9edb4152fe6a@redhat.com>
Date: Sun, 2 Apr 2023 14:41:58 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 02/10] media: atomisp: Remove continuous mode support
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Kate Hsuan <hpa@redhat.com>,
 Tsuchiya Yuto <kitakar@gmail.com>, Yury Luneff <yury.lunev@gmail.com>,
 Nable <nable.maininbox@googlemail.com>, andrey.i.trufanov@gmail.com,
 Fabio Aiuto <fabioaiuto83@gmail.com>, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev
References: <20230221145906.8113-1-hdegoede@redhat.com>
 <20230221145906.8113-3-hdegoede@redhat.com>
 <Y/TqBBdU7dbYPIsW@smile.fi.intel.com>
 <109be822-9439-cd5a-c7f7-c63516f92099@redhat.com>
 <CAHp75Vd+sgvgQRQhi9FZOL9=ura9g8+xr8ez73XcmRf7Uy11LQ@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75Vd+sgvgQRQhi9FZOL9=ura9g8+xr8ez73XcmRf7Uy11LQ@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Andy,

On 4/2/23 08:06, Andy Shevchenko wrote:
> On Sat, Apr 1, 2023 at 12:59 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Hi Andy,
>>
>> Thank you for the reviews!
>>
>> On 2/21/23 16:57, Andy Shevchenko wrote:
>>> On Tue, Feb 21, 2023 at 03:58:58PM +0100, Hans de Goede wrote:
>>>> Continues mode is a special mode where 2 /dev/video devices can be active
>>>> at the same time. Either the video-preview + video nodes or the
>>>> viewfinder (for still capture) + capture nodes.
>>>>
>>>> For the video-preview + video-recording case modern userspace will
>>>> use a single stream multiplexed by pipewire.
>>>>
>>>> The still-capture case is extra special only starting the preview
>>>> stream and then relying on a custom ATOMISP_IOC_S_CONT_CAPTURE_CONFIG
>>>> ioctl to set things up followed by a second stream on to capture
>>>> the amount of configured still pictures. While running the sensor
>>>> at full resolution all the time. This case too is better handled
>>>> with dma-buf + GPU downscaling for the view-finder rather then all this
>>>> custom special code. Besises this the ioctl expects a bunch of special
>>>> non error checked conditions to be met otherwise things will crash/hang.
>>>>
>>>> The continues mode also involves a special cases all over the code
>>>> getting in the way of further cleanups and simplifying the code to
>>>> using just 1 /dev/video# node. So lets remove it and the
>>>> related custom ATOMISP_IOC_S_CONT_CAPTURE_CONFIG ioctl.
>>>
>>> ...
>>>
>>>> +    ret = atomisp_set_fmt_to_snr(vdev, &s_fmt,
>>>> +                                 f->fmt.pix.pixelformat, padding_w,
>>>
>>> At least one parameter can be moved to the previous line.
>>
>> Ack, fixed in my local tree which I will push to:
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git/log/?h=media-atomisp
>>
>> When I'm done processing your other review remarks.
>>
>>>
>>>> +                                 padding_h, dvs_env_w, dvs_env_h);
>>>> +    if (ret) {
>>>> +            dev_warn(isp->dev,
>>>> +                     "Set format to sensor failed with %d\n", ret);
>>>> +            return -EINVAL;
>>>
>>> ...
>>>
>>>>      case ATOMISP_RUN_MODE_PREVIEW:
>>>> -            if (!asd->continuous_mode->val) {
>>>> -                    if (pipe_id == IA_CSS_PIPE_ID_PREVIEW)
>>>> -                            return true;
>>>> +            if (pipe_id == IA_CSS_PIPE_ID_PREVIEW)
>>>> +                    return true;
>>>>
>>>> -                    return false;
>>>> -            }
>>>> -            fallthrough;
>>>> +            return false;
>>>
>>>               return pipe_id == IA_CSS_PIPE_ID_PREVIEW;
>>
>> I agree that that is cleaner, but there are a bunch of other cases
>> in this switch case which are not touched by this patch and
>> they all follow the same pattern as which the modified cases
>> use after this patch, e.g. :
>>
>>         case ATOMISP_RUN_MODE_STILL_CAPTURE:
>>                 if (pipe_id == IA_CSS_PIPE_ID_CAPTURE)
>>                         return true;
>>
>>                 return false;
>>
>> So this patch basically makes all of them consistent with
>> each other. So I'm going to keep this as is.
> 
> So, I haven't checked the patch series of 28, but perhaps the above is
> a good candidate to have across the entire code, so we reduce the
> codebase.
> ...

I agree I have added a note about this to my list of possible code
cleanups (which is quite long) but there are many higher priority
issues to solve first.

Regards,

Hans


