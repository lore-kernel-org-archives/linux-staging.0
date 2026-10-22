Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792697373;
	b=DPkzMSyRhJvL/AfZ4PP0xnObhFMy+/0CrS8se1GZTZEviReY+BjiZCcLN5PX7jlNNw+X
	 7M84O8/J4yKM4t+DQogVqSEKOryBePUoJmzXLTTN3WGIfyhrym8SCHjVaAc81BdwSnSAd
	 fnOyoX9JL+2sz23X3IKjOtHfSOh/ptx8uR6Xyc9bFHp3AgdWUvWT7RBa97e3Lna2hGD4r
	 PYNDIWonUnwfIEJGUBgFtPnQO9oSZnNmMWzhUDrIqQ9R2IxSM5m4HuPN02s9/TYRN6BRN
	 H7yCsxAW2SsqMh9/TMk4vuNFBaxMGI7qTO61Q0ofn7+PVCxzbANgV899oyXNIVbaAzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792697373;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=dtIDxskl9CL4u3HCClPUlqLnyLEWtYjRFUBbhD8dpoA=;
	b=vMbRPCYWFCcpUygDWOmciCd7pM7w5+yP0PyWlx7/evvBNsTMQMB8PLbgotdtklwr23Rx
	 B9YT/rkS3DQPqtv4myFQOkRtUUUxFvOu0QGi2DWZsThCw7LMzw/h7hnmBfK1adXH4yGIm
	 JuwT7JzKtxIQtNyh0yQyXNKXn0JUK1JnL6oUZAUstUTpo+qjOGR3Bsk7LJZa4BjffPW5E
	 SE6nP6iv/SqvbmHFON2CWlBD1HkAJkw97Q+jIpB0tKmeJ2G3fpGT3HZ5QUOwhCZWg9LS/
	 i+WsRihMWWatJEkFWx1a1Eb5spuaEcpFHR3CxETyGdE7SkiHA8D80ROvHSZ8aYf2VCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=riscstar.com;
	spf=pass smtp.mailfrom=riscstar.com;
	dkim=pass header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=KP9t27Jk;
	arc=none smtp.remote-ip=209.85.161.41
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE434606A319
	for <linux-staging@lists.linux.dev>; Thu, 22 Oct 2026 19:29:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE434606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=KP9t27Jk
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-6d7e06dbcccso93717eaf.3
        for <linux-staging@lists.linux.dev>; Thu, 22 Oct 2026 12:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1792697371; x=1793302171; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dtIDxskl9CL4u3HCClPUlqLnyLEWtYjRFUBbhD8dpoA=;
        b=KP9t27JkAG99PBb2YVhqZ28WkcJX0oIwPkDG+rIgi+K5uSs6m+v8u42qmwrQ9temnw
         lx6jjbVpntShY8ibt9k5q933B+BixD4mqFmTBX5n1MVVCtrHd5b/nEmzCtYlBbSGQDI/
         B4BaLyTvhIyVMGmhrGR6v5D4YwCUy7uZCE7HUpzDi9SKd+38c9wbBUyakXOljsesUT0Y
         B/ZkPSQxDbMuc3EOUiDXexGvAJfAL/Dz0UrXx546ur7ZJSkLNAZGZ6DXHSUFx50rs/gL
         BnO58FtygIQT10ZlQB/yCf3V84Z1hpWcTT81RRGtqkAcH2YdvuMLvsrNUCBqJo9TqmaZ
         7YEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792697371; x=1793302171;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dtIDxskl9CL4u3HCClPUlqLnyLEWtYjRFUBbhD8dpoA=;
        b=jW0iazEBT+ZcNClqyqe/4B20xKHy5Tmg+mg4X7NLJZVkbO2cVG1z59nAJ+2YkpTaQJ
         aYnFvnxG1V75ozMsUbBHpYtPzmc3i5GG/bd3s4sSDjFHdrg9rSPGWsL0eT/0DEbJoeVe
         HVKrcckVOb0rPnk+mZCLdJgkoveG03Xl0Hi99t9YevPrWOoBAoXZmbvNwvUu+ANsIi5M
         jR627+F363PLYw65NgTQCpSGPCJU+nRucoKFAE0JetIy40d0M+cUX47biQngye/LQssD
         PDrPqsE1Z9aBwLDytFyU9jy7YPqaAyjkuCYTwo5mO0b7gWhbx0x+RYZUlmfHQ4E+ycvY
         qppQ==
X-Forwarded-Encrypted: i=1; AKwUvBwCFf5k68woBE6J7hBp4DU5B1bhTBf6eN0rZLEAvye9E9uU+do5IaScPD83JyXis1Gt8S+VgPS3HzUdq/np@lists.linux.dev
X-Gm-Message-State: AFq9FYKZSjnNe1iT6XnFLIRmM0y8Cyz1tNbeeGST64CHZ46Y9r7JiBvB
	2JqB9S8+UzNPbXTIBt3hOtMlh1zDjDARLxjlDexlTEpNBe/UlPMGca0XmoYPq/6Nt5o=
X-Gm-Gg: AYBFou2BLSLf6IQYVwIeunMup6JVSorBaV5l+CSvA5hC3E8rcI7Do15tM2XsiH+VnO1
	vCB2Tr5Ds6mq3+H/SPy9yoMmE59ZJVh8Fkq+brbuvTrCHJu1r/rcprGFzMrpvUx+Esw/3J9lkhQ
	ls8HmkChyN4XGlXG1YlnT9o63+IMQyNtmH1La2SOo7HvFzj02dQ1E65SHpUKQH17c9bP7pnUffM
	pe5V591USNQypUjkB7JAd0fg/RT2Ga6FdJMsRU/jqByc3ru1ixrkYjQ/fTiCmuXSeLNZh6sinSq
	oUumKSCnKWsIr/XZdapKNWcmUTFnBK9uWyWvDpW6TKxGoYny39VpHMjJTi6F6/3LdiRrjid+Btc
	XhltCscc3xSJoNhmTG8tLjmosFnp2xppXGxTPMuAEDiOCgT432Vb31UP+/jhhQ/QYBxf4ZvrUvv
	8g13xGan4PPzQhe11b6EEEI8sUQE1GDY1WYGCmZTiuAVaf8HWDxkFEJdAvn4Hbw7D9Cwgi4O9tO
	/d62W8o3lc4YkBjexcb4qZG2oGFPafnZnaPupXAKeETJHgacNsiG1f8
X-Received: by 2002:a05:6820:5611:b0:6f6:b13f:5d2d with SMTP id 006d021491bc7-70b8884d3acmr221772eaf.12.1792697371436;
        Thu, 22 Oct 2026 12:29:31 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-70b8b266f0bsm19815eaf.6.2026.10.22.12.29.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 12:29:31 -0700 (PDT)
Message-ID: <c482704b-903e-413d-ba7b-5bf31c0a6104@riscstar.com>
Date: Thu, 22 Oct 2026 14:29:29 -0500
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: greybus: Use fsleep() for delay
To: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
Cc: greybus-dev@lists.linaro.org, outreachy@lists.linux.dev,
 pure.logic@nexus-software.ie, johan@kernel.org, elder@kernel.org,
 gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20261022110238.38824-1-pavankumaryalagada@gmail.com>
 <6d683673-39de-4986-a593-68a5a495e764@riscstar.com> <atpggBthwjZIFwXR@user>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <atpggBthwjZIFwXR@user>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/22/26 2:14 PM, Yalagada Pavan Kumar wrote:
> On Thu, Oct 22, 2026 at 08:28:23AM -0500, Alex Elder wrote:
>> On 10/22/26 6:02 AM, pavankumaryalagada@gmail.com wrote:
>>> From: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
>>>
>>> In the loopback function, usleep_range() is used for short delays
>>> and msleep() for longer delays. This requires choosing the delay
>>> function based on the requested time and converting microseconds
>>> to milliseconds when using msleep().
>>>
>>> Replace both functions with fsleep(), which selects a suitable
>>> delay method based on the requested time. This avoids the need
>>> to choose the delay function and convert the time manually.
>>>
>>> Suggested-by: Alex Elder <elder@riscstar.com>
>>> Signed-off-by: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
>>
>> Your description above is pretty good, but I agree with
>> Johan's comment.  In fact, you should think about and
>> understand exactly how that behavior changes with the
>> switch to using fsleep().
>> - When would the delay be different from before?
>> - When it differs--by how much does it differ?

FYI, I was not really looking for a response here
(other than you sending a new version of the patch
that provides some additional information).  I was
simply suggesting the way you should approach
making a change like this.

> The current code uses usleep_range() for delays below 20
> milliseconds and msleep() for longer delays. When using
> msleep(), it converts microseconds to milliseconds by
> rounding down, which can make the delay shorter than
> requested.
> 
> For example, a requested delay of 20,500 microseconds
> becomes msleep(20), which requests a 20 millisecond
> sleep.
> 
> With fsleep(), the kernel selects the delay method
> based on the requested time. For a 1000 microsecond
> delay, the current code allows 100 microseconds of
> extra time, while fsleep() allows up to 250 microseconds.

Well it depends on the value of HZ, but I think it's
typically 1000.

>> - Is this amount significant?
>> And the third question gets at exactly what Johan was
>> saying should be included in the patch description.
>>
>> We want to know not just the mechanics of the change,
>> but at a higher level, what is its effect?
> 
> The change may affect the time between loopback operations
> and the reported performance. The code does not seem to
> need an exact delay, so i think using fsleep() is reasonable.
> However, testing is needed to confirm its actual effect.

This is technically right, but you have already shown
a little intuition about what the change does.  And
my point was that you should approach making changes
to the code with this kind of analysis in mind.

Simple fixups like this are great, but ideally they
should produce *zero* change in behavior.  In this
particular case, there *is* a change, and you should
make sure you understand it, and as Johan suggested,
make a comment on it.

> I do not have Greybus hardware to test the driver at runtime,
> so my assessment is based on reviewing the code and fsleep()
> implementation.
> 
> If possible, could you please check the runtime behavior or
> and let me know if you find any issues with this change?

I am not set up to do any testing like this either.
I don't think you strictly need to test this (other
than doing compile testing and things like checkpatch).
I'm just trying to suggest good practice for you to
follow when proposing changes.

					-Alex>
> Thanks,
> Pavan
> 
>>
>> You don't need to provide a super high level of detail
>> in this particular change, but you should demonstrate
>> somehow that you've thought about these things.
>>
>> Please submit a new version of the patch and reword
>> the description a bit to concisely capture why it
>> makes sense to make the change, and why you believe
>> that the change in behavior is likely harmless.
>>
>> Thanks.
>>
>> 					-Alex
>>
>>> ---
>>>    drivers/staging/greybus/loopback.c | 8 ++------
>>>    1 file changed, 2 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/drivers/staging/greybus/loopback.c b/drivers/staging/greybus/loopback.c
>>> index efc69c10cffe..2fe845eaef29 100644
>>> --- a/drivers/staging/greybus/loopback.c
>>> +++ b/drivers/staging/greybus/loopback.c
>>> @@ -898,12 +898,8 @@ static int gb_loopback_fn(void *data)
>>>    		gb->send_count++;
>>>    		mutex_unlock(&gb->mutex);
>>> -		if (us_wait) {
>>> -			if (us_wait < 20000)
>>> -				usleep_range(us_wait, us_wait + 100);
>>> -			else
>>> -				msleep(us_wait / 1000);
>>> -		}
>>> +		if (us_wait)
>>> +			fsleep(us_wait);
>>>    	}
>>>    	gb_pm_runtime_put_autosuspend(bundle);
>>

