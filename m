Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76AEE819
	for <linux-staging@lists.linux.dev>; Mon, 25 Mar 2024 19:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711393738; cv=none; b=k6qLjB2ap08veCIg1KCpm/Trti8rhlSvYd8slSPNvrSYRWu32oI87Ufy73LC0Q2ofx2tn3u/lY80vR4dhMZZK27fhn0Rsl+2+FN7wL3vUqggEqHmn1BSHp3i2XRB9W1EwLCAxH0O/TR0LVpOvBdjy6oznyi5/NpYB3XssFb4gKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711393738; c=relaxed/simple;
	bh=HHJvcz+9Drm07w87IJvGy60FQW2l2rVZi6DcUs57owE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=auj3qoEFto3vG6yNwf86HQkuCiDAqZ9Uo79rsdyJNClLW7i6qkRmufHTAyrFTHMYLzJ0bFjVO0VTPGoDOxcATra7UwQovkH309VbfrzByXWLE5k/5Cbybm/y95XDDlfzriFdTDHDAf2fsbdr7iAmftRntrriPBQgBVEjtLl6zZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nbI73vBK; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nbI73vBK"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-33ec7e38b84so3372633f8f.1
        for <linux-staging@lists.linux.dev>; Mon, 25 Mar 2024 12:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711393734; x=1711998534; darn=lists.linux.dev;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ivdettvGpltNPeISxFbK8+ZclvtCBGXuV4SmOUszKcE=;
        b=nbI73vBKAVpB6HkoWkrX2i7PwvH45RsFoaFzUwgFP1LSyrz9T0c/w4qdvZv/ItG67T
         74k9WzsAsyRqJ9OQSnZqqZd0XdC/rtr2ihoc3GnLOTTKyyWAPukclRy32rgPeOk6/unh
         KM04pzAAJtMG49hwqxvmzT+XMW65wU74gmdq8KAD0Rp0BFVaOIsJ7V2xHksZWiYd1AwB
         90GNr/3UpH8/8W4miYFV+fZ4pcp3GQobjcnou9y6TCVieub7Wjl/EfXSM8f3NA2OIH62
         DdMvaCvdpwMTcleMB3BC2lukqD87ky9gYNv0x0lg7PrxdKcoFpjbqXcsD8u2cy9x55v6
         rAPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711393734; x=1711998534;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ivdettvGpltNPeISxFbK8+ZclvtCBGXuV4SmOUszKcE=;
        b=BMmlZVZ7LMM1N1EzvqTuqAKj76w7XE35AOX10M1luraz2JyLTEFxnjALkVu0q9Nl/Y
         2JQ1LXxhz9fr0xPh3ZoXsylvijwXIRZ4iyexIFWOw9Zujtt327hiRbTPLKE08Dc6Kpgy
         4wx4zjgDkESQajhspoxjKPK0icF/6I42LJNnbgCALACgmNrfawwIzQC6qaR3Iab0D5nY
         zFfPlNKStfTg6l+51Q4kT4woIqdsPo5HKR1k7QY5HrCgE9GyoEJbJ7ASSCF1ofmjo+GQ
         GAGlg156Re8pUxD7xhb2YBNdrsrQCy5g4IewsYsCCzAEEyVmz7iDxpxARTOwCVs77JTe
         ThDQ==
X-Forwarded-Encrypted: i=1; AJvYcCXru2TuUyOZNvRzCWoAi1m2ClhysgBIMTopJGbpL1yPzgBMZ1CIcj1g1BxhrEpn0J4aZc7jxUMH+ZfP38u72/P1mC4zRizyKN56NG+iTA==
X-Gm-Message-State: AOJu0YwTRnzMVHzj9dUa6DUBSKPAWY5PKE3HS4MuEWYizx3W/uqUYRLB
	nmT7By3U27s3oL9kUa23znT2gAkbg1ajC9sxXXtK4GfFL2RpF0MfSUULtWhBsCM=
X-Google-Smtp-Source: AGHT+IF5YpsNwEMr5DhVdk+y0oO8sPxx6leaiIIRqFMnBG4DybO/Yhkm/g4bGoUhp1EAdgyvtjTaJg==
X-Received: by 2002:a05:6000:1152:b0:33d:2775:1e63 with SMTP id d18-20020a056000115200b0033d27751e63mr5398930wrx.41.1711393733537;
        Mon, 25 Mar 2024 12:08:53 -0700 (PDT)
Received: from localhost (a109-49-32-45.cpe.netcabo.pt. [109.49.32.45])
        by smtp.gmail.com with ESMTPSA id h8-20020a05600004c800b0033b66c2d61esm10139182wri.48.2024.03.25.12.08.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 12:08:53 -0700 (PDT)
From: Rui Miguel Silva <rui.silva@linaro.org>
To: Alex Elder <elder@ieee.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
Cc: greybus-dev@lists.linaro.org, Mikhail Lobanov <m.lobanov@rosalinux.ru>,
 linux-staging@lists.linux.dev
Subject: Re: [PATCH] greybus: lights: check return of get_channel_from_mode
In-Reply-To: <14e1f476-7c3c-40ac-a48e-9af3e43a834d@ieee.org>
References: <20240307094838.688281-1-rmfrfs@gmail.com>
 <2024032543-village-reference-960d@gregkh>
 <9fa87c55-42e2-4449-936f-4835b267d22f@ieee.org>
 <2024032510-planner-caterer-3693@gregkh>
 <14e1f476-7c3c-40ac-a48e-9af3e43a834d@ieee.org>
Date: Mon, 25 Mar 2024 19:08:52 +0000
Message-ID: <m334sedt8b.fsf@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Hey Alex,

Alex Elder <elder@ieee.org> writes:

> On 3/25/24 1:50 PM, Greg Kroah-Hartman wrote:
>> On Mon, Mar 25, 2024 at 01:31:34PM -0500, Alex Elder wrote:
>>> On 3/25/24 12:25 PM, Greg Kroah-Hartman wrote:
>>>> On Thu, Mar 07, 2024 at 09:48:13AM +0000, Rui Miguel Silva wrote:
>>>>> If channel for the given node is not found we return null from
>>>>> get_channel_from_mode. Make sure we validate the return pointer
>>>>> before using it in two of the missing places.
>>>>>
>>>>> This was originally reported in [0]:
>>>>> Found by Linux Verification Center (linuxtesting.org) with SVACE.
>>>>>
>>>>> [0] https://lore.kernel.org/all/20240301190425.120605-1-m.lobanov@rosalinux.ru
>>>>>
>>>>> Fixes: 2870b52bae4c ("greybus: lights: add lights implementation")
>>>>> Reported-by: Mikhail Lobanov <m.lobanov@rosalinux.ru>
>>>>> Suggested-by: Mikhail Lobanov <m.lobanov@rosalinux.ru>
>>>>> Suggested-by: Alex Elder <elder@ieee.org>
>>>>> Signed-off-by: Rui Miguel Silva <rmfrfs@gmail.com>
>>>>> ---
>>>>>    drivers/staging/greybus/light.c | 6 +++++-
>>>>>    1 file changed, 5 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/drivers/staging/greybus/light.c b/drivers/staging/greybus/light.c
>>>>> index c6bd86a5335a..6f10b9e2c053 100644
>>>>> --- a/drivers/staging/greybus/light.c
>>>>> +++ b/drivers/staging/greybus/light.c
>>>>> @@ -147,6 +147,9 @@ static int __gb_lights_flash_brightness_set(struct gb_channel *channel)
>>>>>    		channel = get_channel_from_mode(channel->light,
>>>>>    						GB_CHANNEL_MODE_TORCH);
>>>>> +	if (!channel)
>>>>> +		return -EINVAL;
>>>>> +
>>>>>    	/* For not flash we need to convert brightness to intensity */
>>>>>    	intensity = channel->intensity_uA.min +
>>>>>    			(channel->intensity_uA.step * channel->led->brightness);
>>>>> @@ -549,7 +552,8 @@ static int gb_lights_light_v4l2_register(struct gb_light *light)
>>>>>    	}
>>>>>    	channel_flash = get_channel_from_mode(light, GB_CHANNEL_MODE_FLASH);
>>>>> -	WARN_ON(!channel_flash);
>>>>> +	if (WARN_ON(!channel_flash))
>>>>> +		return -EINVAL;
>>>>
>>>> We should NOT crash machines just because of this, the WARN_ON() should
>>>> be removed and just properly handle the error please.
>>>
>>> Greg, WARN_ON() doesn't normally crash the machine.  That said,
>>> it's reasonable to remove the WARN_ON().
>> 
>> The huge majority of running Linux systems in the world run with
>> panic-on-warn enabled, including the one in your pocket :(
>
> I did not know that.  Then WARN_ON() is no better than BUG_ON().
> I'm still learning.  Thank you.

I also lost track of all this failure cascade options that normally
take the all system down.

Thanks anyway for the comments,
Cheers,
    Rui
    
>
> 					-Alex
>
>>> I think the purpose of the warning is that this is a case that
>>> should "never happen," so if it does, it's making some noise.
>> 
>> Making noise by rebooting the box is not good.
>> 
>> thanks,
>> 
>> greg k-h
