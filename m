Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59BDB803
	for <linux-staging@lists.linux.dev>; Mon, 25 Mar 2024 18:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711392941; cv=none; b=E78se2w0bugVGbZnMfZyIX/Q2lJIQXMxrHw6iNsRX8g8EgoDpuBqU7q1hS9LLQCubwFBOtlduvMuDrAXFIPUC/q63TSs/KRI0GM8k+FUVhDzlqt6pc98qKwxVllsQ+iIthJws3pj4LhzmexUhJpGk8+cAiTE01bCqar391Go99E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711392941; c=relaxed/simple;
	bh=05W5AIDZr3L2PG2/Sv9vJkMsqnn0+XrBmSkjmzTBWLI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HjLwEmbUhHqrl4UWRNNEjVKkorGGeaBtsO4Ww0Men6cpCB+0YtxTJZ75M3/+D+00YGgouVnHQd011UiGezgjcIywJVH6Lr6Yy7sriG2yXs6XozvA/RBeuCd40Dsf+1H2vrxClO4v/MjBe2XvFeGoJeQfNTdY90hzRz8D9WdriiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ieee.org; spf=pass smtp.mailfrom=ieee.org; dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b=OvjJmDwi; arc=none smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ieee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ieee.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b="OvjJmDwi"
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-3c396fec63aso1628842b6e.0
        for <linux-staging@lists.linux.dev>; Mon, 25 Mar 2024 11:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1711392937; x=1711997737; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Cj/zBkshsC4lwntiD0vAyA9XrZfVrKKDmooPQjZW7Qo=;
        b=OvjJmDwiK9ndXIclQcYbwI5cJDoBoRFvnq3Jm2jcvBXZs/O15d6EO6hOrgh7kcKdSz
         Djo/XP9vWQxaqVRQxp/pIOn2xdZtkqB9kgU/vY5bN23cTo/PnOhk6vKEzqsWngz8yevk
         QZzr87Ik1z2TVTLT9uvoaQJ/aSnORSOBOXujM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711392937; x=1711997737;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Cj/zBkshsC4lwntiD0vAyA9XrZfVrKKDmooPQjZW7Qo=;
        b=ZOJvw2OIGSHVahzBD8LU1IwnxhxnNb2c70Cm3yfwoWbf/ADTG7n+a9cqSz2QEP76vF
         aB7dUvbjgk7re9UGS+GF9Yj/x4lIyJW/+V7DoEGQmzi35Hfin+6UvY3gKkFRuQiYHbLZ
         IrSWSKiMgKVLE2nDTNX5A4UvRoc7JiLRNPZXg3AbhxIbyNiVPBqOKEDvtL6Tz8QjI/KH
         mivUqhvSm3c9cZFFMV/2cflJ19TsTJ6nkEM6sGUOOvXl0Ohm4PfFKuuKlCAWeksLv4Rf
         OW49Uzil2uEvcu3Uo6BghypHokTeTfxKeteI0nNtheQWcTlvSQoNGmsiLsmdzetb1tWW
         6iTg==
X-Forwarded-Encrypted: i=1; AJvYcCWb+oTrN24sVnxDBXe1iC3hg3wu9/NpV23aTnuryNX5Uvh14TrbWn+wZwPPZAZa4N2sMqXcIQitGpRfv0NQKV1pLk87Hf7n8YdhHfAtwA==
X-Gm-Message-State: AOJu0YwPbfOOZB2FBN1i6Cl56SaN1lTMfolabgrHEMKKSqlesTvp5Jl/
	8CTmwp7L0RvLV8d5G4aBkNgs0l9hBk/ufSnfkGzrq0JbylcAdcKZ4E8tkiMOUw==
X-Google-Smtp-Source: AGHT+IFCQ6dTAsXuH06ZelNXQ9c4Skk+OgXPlQ2HLWUVAZX/lzuTI4GSeawmlVG2sWPirElQOitZ7g==
X-Received: by 2002:a05:6808:291:b0:3c3:9c24:dc6e with SMTP id z17-20020a056808029100b003c39c24dc6emr611265oic.24.1711392937256;
        Mon, 25 Mar 2024 11:55:37 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.googlemail.com with ESMTPSA id gb13-20020a05622a598d00b00430d494c75asm2857127qtb.19.2024.03.25.11.55.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Mar 2024 11:55:37 -0700 (PDT)
Message-ID: <14e1f476-7c3c-40ac-a48e-9af3e43a834d@ieee.org>
Date: Mon, 25 Mar 2024 13:55:36 -0500
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] greybus: lights: check return of get_channel_from_mode
Content-Language: en-US
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Rui Miguel Silva <rui.silva@linaro.org>, greybus-dev@lists.linaro.org,
 Mikhail Lobanov <m.lobanov@rosalinux.ru>, linux-staging@lists.linux.dev,
 Rui Miguel Silva <rmfrfs@gmail.com>
References: <20240307094838.688281-1-rmfrfs@gmail.com>
 <2024032543-village-reference-960d@gregkh>
 <9fa87c55-42e2-4449-936f-4835b267d22f@ieee.org>
 <2024032510-planner-caterer-3693@gregkh>
From: Alex Elder <elder@ieee.org>
In-Reply-To: <2024032510-planner-caterer-3693@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/25/24 1:50 PM, Greg Kroah-Hartman wrote:
> On Mon, Mar 25, 2024 at 01:31:34PM -0500, Alex Elder wrote:
>> On 3/25/24 12:25 PM, Greg Kroah-Hartman wrote:
>>> On Thu, Mar 07, 2024 at 09:48:13AM +0000, Rui Miguel Silva wrote:
>>>> If channel for the given node is not found we return null from
>>>> get_channel_from_mode. Make sure we validate the return pointer
>>>> before using it in two of the missing places.
>>>>
>>>> This was originally reported in [0]:
>>>> Found by Linux Verification Center (linuxtesting.org) with SVACE.
>>>>
>>>> [0] https://lore.kernel.org/all/20240301190425.120605-1-m.lobanov@rosalinux.ru
>>>>
>>>> Fixes: 2870b52bae4c ("greybus: lights: add lights implementation")
>>>> Reported-by: Mikhail Lobanov <m.lobanov@rosalinux.ru>
>>>> Suggested-by: Mikhail Lobanov <m.lobanov@rosalinux.ru>
>>>> Suggested-by: Alex Elder <elder@ieee.org>
>>>> Signed-off-by: Rui Miguel Silva <rmfrfs@gmail.com>
>>>> ---
>>>>    drivers/staging/greybus/light.c | 6 +++++-
>>>>    1 file changed, 5 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/staging/greybus/light.c b/drivers/staging/greybus/light.c
>>>> index c6bd86a5335a..6f10b9e2c053 100644
>>>> --- a/drivers/staging/greybus/light.c
>>>> +++ b/drivers/staging/greybus/light.c
>>>> @@ -147,6 +147,9 @@ static int __gb_lights_flash_brightness_set(struct gb_channel *channel)
>>>>    		channel = get_channel_from_mode(channel->light,
>>>>    						GB_CHANNEL_MODE_TORCH);
>>>> +	if (!channel)
>>>> +		return -EINVAL;
>>>> +
>>>>    	/* For not flash we need to convert brightness to intensity */
>>>>    	intensity = channel->intensity_uA.min +
>>>>    			(channel->intensity_uA.step * channel->led->brightness);
>>>> @@ -549,7 +552,8 @@ static int gb_lights_light_v4l2_register(struct gb_light *light)
>>>>    	}
>>>>    	channel_flash = get_channel_from_mode(light, GB_CHANNEL_MODE_FLASH);
>>>> -	WARN_ON(!channel_flash);
>>>> +	if (WARN_ON(!channel_flash))
>>>> +		return -EINVAL;
>>>
>>> We should NOT crash machines just because of this, the WARN_ON() should
>>> be removed and just properly handle the error please.
>>
>> Greg, WARN_ON() doesn't normally crash the machine.  That said,
>> it's reasonable to remove the WARN_ON().
> 
> The huge majority of running Linux systems in the world run with
> panic-on-warn enabled, including the one in your pocket :(

I did not know that.  Then WARN_ON() is no better than BUG_ON().
I'm still learning.  Thank you.

					-Alex

>> I think the purpose of the warning is that this is a case that
>> should "never happen," so if it does, it's making some noise.
> 
> Making noise by rebooting the box is not good.
> 
> thanks,
> 
> greg k-h

