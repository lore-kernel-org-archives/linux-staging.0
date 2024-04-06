Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A55633BBDC
	for <linux-staging@lists.linux.dev>; Sat,  6 Apr 2024 16:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712421957; cv=none; b=foc1JbU8yfirTilyl4sDlQb/qSmwWfDfdL7XpdzJB6pBv3xmskeM4bYiN34aKMjdoTqgtj0kV1SG/9Z7H95O413C8tRbmZfnqYq8xcHrGSUgta03+dg+K20UidB1ByrumufPBGXaIo3UYb8HEONivCR08xxMlqiTXXnLj2bjZRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712421957; c=relaxed/simple;
	bh=7yQ+QmR4Ay0dnL1lrEcKdS/T+SzwCs+q9uObIrWoPs0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sFJblmpniZLEylwVkIceiiIc1Cfpu7m6H44nxo5G/E/gWjBxrvBdL/yhIRSjaLh10HbP0l3t/Pc6YqFE5gRIKDtD6ZbCdLQy9NZQFoCEZCujW27Yc2Ns9a5MBKqzj8Z0w/K3Sbne/jOLWILleYay2Z1CSvnoIir21urL8/7x/hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ieee.org; spf=pass smtp.mailfrom=ieee.org; dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b=e/e/SPBu; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ieee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ieee.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b="e/e/SPBu"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-432ffed0423so15827631cf.1
        for <linux-staging@lists.linux.dev>; Sat, 06 Apr 2024 09:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1712421953; x=1713026753; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xUzxhIyO9Z42EWr6hvKS7Qfwp4EqErW6SFdavLE1o5g=;
        b=e/e/SPBuT2KY9gPeokT+FUzCB5MDw0fgJyJOyUcl8KJaLvEctdGwQ4ImuzI5MdFz95
         rmzXsmEJbVj1tEvq2HMCKmjuPYCaj2vGD4n/ilElyecVofSRyO5OZSXVHp4t+UHm1GCy
         nERzyYOAeGTMIdqepXVp7vbshx7ioFDlek4Fk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712421953; x=1713026753;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xUzxhIyO9Z42EWr6hvKS7Qfwp4EqErW6SFdavLE1o5g=;
        b=sbxDiA9WFoGzuvZrbYeFM6dRKKEef5YqRDH2GMCkJTw4IxvN/vwI9QK0LZfyU2317x
         QYqjeoHEedZLfk4k7+qU3fp1HCEKFD3woIyKJjKbt+G+HLEJepaPJAW3JafwRRXMGb+v
         l1xlrGlxrtKLBBhWwiqVaKkWOwvqqNU27ApnJ7HeZYpAobZczfijpgUw3tqRWD+GQBrd
         mGB9zEUfb7PRNBnh1rz6AQoVZdy+S0W6BueeeSnKbmCVDGryZzaISyUXTnJE7O0fHWPN
         s9gKKq+JDCGKq/DfZ+ERlSW6TREK/nommPU/3aWh7Eib8dEQ/nspU3qdATQEUNENnlPJ
         uL6w==
X-Forwarded-Encrypted: i=1; AJvYcCU/MPjZsDkTR3mZ7IqNkoFQgqn7vi71Yn87XcTnwEHj3vjqVAt3OzWL1MjT8rvS2GuXxjyyXqpAUPq8vKQEuOeRNCyp9gbRvdO4k7yCVw==
X-Gm-Message-State: AOJu0YxXa2Kk/HmHGEs48zVz3bPTIHLlwvIee7eXoMEuvb8BdSr5VF29
	gEPHb9ydAPVZKnt4MzprtqLviO5nnOm/KW0tUPK0yobtWQeROm3smjrKfmB6MA==
X-Google-Smtp-Source: AGHT+IEvslkQ6rXgUW5EvmlGfHPFV2jcGN7xIZ4kQjPo99VaaKYYs8/WO0XY1HAROkySf3cJQl69Jw==
X-Received: by 2002:ac8:594a:0:b0:431:5f09:83cb with SMTP id 10-20020ac8594a000000b004315f0983cbmr5549704qtz.32.1712421953535;
        Sat, 06 Apr 2024 09:45:53 -0700 (PDT)
Received: from [10.211.55.3] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.googlemail.com with ESMTPSA id e1-20020ac81301000000b004317c90d0d6sm3321qtj.65.2024.04.06.09.45.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Apr 2024 09:45:53 -0700 (PDT)
Message-ID: <5e1c5156-d906-4473-970b-bff71e4dcd96@ieee.org>
Date: Sat, 6 Apr 2024 11:45:51 -0500
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: greybus: Clear up precedence for gcam logging
 macros
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@linaro.org>,
 Jackson Chui <jacksonchui.qwerty@gmail.com>
Cc: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20240404001627.94858-1-jacksonchui.qwerty@gmail.com>
 <658e1f40-d1eb-4ba7-9ba3-0aa05a1ed06e@ieee.org>
 <ZhBrff8qkkmum4wc@jc-ubuntu-dev-korn-1>
 <5eb3afe2-da7b-4f98-aac2-bff529a02cea@moroto.mountain>
From: Alex Elder <elder@ieee.org>
In-Reply-To: <5eb3afe2-da7b-4f98-aac2-bff529a02cea@moroto.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/6/24 4:09 AM, Dan Carpenter wrote:
> On Fri, Apr 05, 2024 at 02:22:05PM -0700, Jackson Chui wrote:
>> On Thu, Apr 04, 2024 at 05:05:09PM -0500, Alex Elder wrote:
>>> On 4/3/24 7:16 PM, Jackson Chui wrote:
>>>> Reported by checkpatch:
>>>>
>>>> CHECK: Macro argument 'gcam' may be better as '(gcam)' to avoid
>>>> precedence issues
>>>
>>> I agree with your argument about the way the macro should be
>>> defined.  But perhaps these gcam_*() functions could just
>>> be eliminated?
>>>
>>> I see 15 calls to gcam_err(), 1 call to gcam_dbg(), and none
>>> to gcam_info().  It would be a different patch, but maybe
>>> you could do that instead?
>>>
>>> 					-Alex
>>>
>>>
>>>>
>>>> Disambiguates '&' (address-of) operator and '->' operator precedence,
>>>> accounting for how '(gcam)->bundle->dev' is a 'struct device' and not a
>>>> 'struct device*', which is required by the dev_{dbg,info,err} driver
>>>> model diagnostic macros. Issue found by checkpatch.
>>>>
>>>> Signed-off-by: Jackson Chui <jacksonchui.qwerty@gmail.com>
>>>> ---
>>>>    drivers/staging/greybus/camera.c | 6 +++---
>>>>    1 file changed, 3 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/drivers/staging/greybus/camera.c b/drivers/staging/greybus/camera.c
>>>> index a8173aa3a995..d82a2d2abdca 100644
>>>> --- a/drivers/staging/greybus/camera.c
>>>> +++ b/drivers/staging/greybus/camera.c
>>>> @@ -180,9 +180,9 @@ static const struct gb_camera_fmt_info *gb_camera_get_format_info(u16 gb_fmt)
>>>>    #define GB_CAMERA_MAX_SETTINGS_SIZE	8192
>>>> -#define gcam_dbg(gcam, format...)	dev_dbg(&gcam->bundle->dev, format)
>>>> -#define gcam_info(gcam, format...)	dev_info(&gcam->bundle->dev, format)
>>>> -#define gcam_err(gcam, format...)	dev_err(&gcam->bundle->dev, format)
>>>> +#define gcam_dbg(gcam, format...)	dev_dbg(&((gcam)->bundle->dev), format)
>>>> +#define gcam_info(gcam, format...)	dev_info(&((gcam)->bundle->dev), format)
>>>> +#define gcam_err(gcam, format...)	dev_err(&((gcam)->bundle->dev), format)
>>>>    static int gb_camera_operation_sync_flags(struct gb_connection *connection,
>>>>    					  int type, unsigned int flags,
>>>
>>
>> Thanks for the feedback, Alex!
>>
>> I thought about refactoring it, but I feel it is worth keeping
>> the macro around. It acts as an apdater between callers, who
>> have 'gcam' and want to log and what the dynamic debug macros
>> expect. Without it, the code gets pretty ugly.
> 
> Another idea would be to create a function:
> 
> struct device *gcam_dev(struct gb_camera *gcam)
> {
> 	return &gcam->bundle->dev;
> }
> 
> 	dev_dbg(gcam_dev(gcam), "received metadata ...
> 
> (I don't know how to actually compile this code so I haven't tried it).

Yes, I prefer this over the original suggestion.  But
even here the gcam_dev() function doesn't add all that
much value; it saves four characters I guess.

Jackson, the basic principle that makes me say I don't
like the wrapper macros is that the wrapper obscures
the simple call(s) to dev_dbg(), etc.  If there was
something you wanted to do every time--along with
calling dev_dbg()--then maybe the wrapper would be
helpful, but instead it simply hides the standard call.
Better to have the code just use the functions kernel
programmers recognize.

					-Alex
> 
> regards,
> dan carpenter

