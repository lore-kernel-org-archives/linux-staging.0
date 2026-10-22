Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792676494;
	b=drJtBj/LNCIcPw4EMhS0SkqE1ORIVePTXh2tR3EiCL/rcgXMoGojfSEOzSgvcbzKFmte
	 Cb3pNSHCPvfLsNAnmu08XT1PbAyUxuFxvvTz/zZHqGGgwLMAnsFFbTxbDdex8rUVMIe0h
	 /Fhz9ZMMAQ4H2SpeNdj1NrErEJSwwjH2mMU7+LcopTpCSXIf0makDFLm0tl3LWTZThGAp
	 Vao8CnG96oA/ptULGj6o7/VGUHskszZ2GidKvl0JyJqsntpY5LzwdpZ5TTB2lorP525KI
	 OSu6NLGi0ZpB9sJl+wtQBrKo33au15/5Z3MBfo0qVa66aDS5B9RIaizBdmLnA6HnMWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792676494;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=gehmgppZeEU7bmBwwBNEsm7rSVlUxWbD/W3/fn7p9JQ=;
	b=SEYZxCPvq5ZU/yvewYhS/W44oiz2aN/BQCuNbvbdFyDO8GscpKKwrw1mk+2CFfLywxzy
	 BNxk2qH1WMPQRMm7tlL9HEnKd9JaOOjL5kj0cJS7gPI21Bh7I52nkMcwH8V7w8toSHUaX
	 6WdFdQ0eHbPRM1HLoHZFYIqOzWIKez/1eKG+cmL2IbDkehLLmteactbrgxDSLtxgtuazd
	 Ovq0jEJ+QPnLGV/MLcFtYmCpJ4FybZxrWcDjbUm6N1cCy+QCa9OijI817WpC/RZ8WhPkx
	 BumcpJa9u4mJo7JBKMAnry59M7pv7xLhimjs0Aycs0zjxzXf/j8+NfktfV0xpPFktZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ieee.org;
	spf=pass smtp.mailfrom=ieee.org;
	dkim=pass header.d=ieee.org header.i=@ieee.org header.a=rsa-sha256 header.s=google header.b=K1fju1dH;
	arc=none smtp.remote-ip=209.85.160.47
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 217C1606A321
	for <linux-staging@lists.linux.dev>; Thu, 22 Oct 2026 13:41:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 217C1606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ieee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ieee.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ieee.org header.i=@ieee.org header.a=rsa-sha256 header.s=google header.b=K1fju1dH
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-47b47de8b4cso1078623fac.3
        for <linux-staging@lists.linux.dev>; Thu, 22 Oct 2026 06:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1792676492; x=1793281292; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gehmgppZeEU7bmBwwBNEsm7rSVlUxWbD/W3/fn7p9JQ=;
        b=K1fju1dHpDUGfQ3cdoWESOhbcI9wu643IqdWzMa4WTpu7ESs445vKgjQmLJDWGq9BQ
         BUhvJaDb2bSi3p+10C5A0AOAGSB7r+zF6iWOJ19EOshJq+7HbiPSa2mjzr420XnChLBn
         KxsfBKj8Go617skuFLXKVqSF9XbkhtEPZc8QA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792676492; x=1793281292;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gehmgppZeEU7bmBwwBNEsm7rSVlUxWbD/W3/fn7p9JQ=;
        b=UIuh6xQMhlXYT18tG43xk8TWBXeIonghKflFh7wpD2YAexRbWxo93SY+tmdgSPwooP
         aU3ZZUDpEic4NX/hQkCZplRNMdo8jCEU+ngUigS9FW2zJFuPqsPGhlfvGaZT98OoLy6F
         rop0qD7i7rzhie0OvuayFAceA00gAZYpox9suj4u/3jChQnczAMcHe2X05rw1HMai0+t
         2q8GTUhRyzO9n964JBb7PKs072GNmb5REhq4Tn9HtqydmytKdOrlrO2y1C2ooi40qVro
         YsZtz+oF9IZl5YqBCIBomXirxj7h2sZH7o629P+EhYIaa5EZaVVSfNfzcogRPnnARzrS
         L2wg==
X-Forwarded-Encrypted: i=1; AKwUvBwqFjGB6o4W9ROPfXGtumeHFLlsXFxCJ3u6G4hv+DcqE6Yzt+fLeuajdR0+Zt5F8HSx4fhHvqt4h3gpI6TZ@lists.linux.dev
X-Gm-Message-State: AFq9FYJe6x80CQ0/HyLhSiU01F3G4Af/hTlpaaoiIv2YAfdpPjfVz5MM
	+Z2bmqXyGtxRnAg4yy0aAsyqC+0yt5IUBUxsuPdLDyN/uX9m4QH8gxA9nOF3zGXLbw==
X-Gm-Gg: AYBFou2Fzh248ak2O5RzJY7oc9WCqP9r+Qh//fP0l8gthE/UCSXUjpHBC7mb0ib1pZY
	UeQUzLtGHZR7UGO1k5ZxATI2f9I/UgVk65bzGP+Cjkf44RV2zVyFA8cq2eMrwm/Mry67eAFxKwU
	PGWQl2casNRgokIeYTCRzUrI+e3GrMk9kO8ABWG158LGxW1ZPy7BLNp6qXZz5l6kiKUo/uAS/78
	Nmg16ADJgcTkmTfWvfoCJq1L4/KZ+y/Nfoxu7WjFxi97XPkvknt84+pRlTcIiSbxBWV1/5LNXiw
	NSReBOx3v47GA2uFYmRynbu5c4lOiWcX5E9Qfzb5nVlwWDQ3yX30mkR/WBPuJhJ6x4kkpwBnyeQ
	hkpRAwUbE53jZVjoa0feloaW3PAGA6Ue347lfO5NyWnfjPEgt6fuyFUHj6hbUi6/qcaIjjRbG+R
	MJpcYROIj723sJwuGF67Pr67L7rK1/C4EKg160w4VfI9atFJfO6D3wPdAOaAUPRifFWJodPmHv7
	HY1pT7PeO3bzPsHWazctE5plZ2fFuoNpFPQe9IXwlBRMAr2tzE=
X-Received: by 2002:a05:6870:9a8f:b0:4a2:4dcb:fa75 with SMTP id 586e51a60fabf-4a7dbf5c94cmr3318921fac.2.1792676491930;
        Thu, 22 Oct 2026 06:41:31 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.googlemail.com with ESMTPSA id 586e51a60fabf-4a7d5eb8fc0sm4501140fac.1.2026.10.22.06.41.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 06:41:31 -0700 (PDT)
Message-ID: <4c393ce3-41ae-4f4e-9af0-4eb7cf1c425a@ieee.org>
Date: Thu, 22 Oct 2026 08:41:29 -0500
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
Subject: Re: [PATCH] staging: greybus: Replace format specifiers
To: Julia Lawall <julia.lawall@inria.fr>
Cc: pavankumaryalagada@gmail.com, greybus-dev@lists.linaro.org,
 linux-staging@lists.linux.dev, outreachy@lists.linux.dev, johan@kernel.org,
 elder@kernel.org, gregkh@linuxfoundation.org, vaibhav.sr@gmail.com,
 mgreer@animalcreek.com, vireshk@kernel.org, rmfrfs@gmail.com,
 dtwlin@gmail.com, linux-kernel@vger.kernel.org
References: <20261021163437.280930-1-pavankumaryalagada@gmail.com>
 <3433f922-bffb-4f1c-8e06-a7a87f5dbcaf@ieee.org>
 <d0a4a257-1ec9-7096-11db-5ff4b3244bac@inria.fr>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <d0a4a257-1ec9-7096-11db-5ff4b3244bac@inria.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/22/26 8:35 AM, Julia Lawall wrote:
> Does anyone on the greybus list know anything about this person:
> 
> Bryan O'Donoghue <pure.logic@nexus-software.ie>
> 
> The email address is not valid, which is somewhat tiresome...

Bryan was on the Greybus kernel team.  Remove that address from
the list.  I'll let him know that e-mail is bouncing so he can
add himself back.

					-Alex

> 
> julia
> 
> 
> 
> On Thu, 22 Oct 2026, Alex Elder wrote:
> 
>> On 10/21/26 11:34 AM, pavankumaryalagada@gmail.com wrote:
>>> From: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
>>>
>>> Unsigned variables are printed using %d.
>>> Replace them with %u to match their types.
>>>
>>> Signed-off-by: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
>>
>> I have reviewed every one of these and they look good.  Quite a few
>> of them--because the size of the value being formatted is less than
>> 32 bits--would print correctly no matter what their value.  But I
>> think it at least does no harm to convert the format specifier to
>> unsigned in all of these cases.
>>
>> I have highlighted below an existing bug that should be fixed.  It
>> gives an example of something to look for when you do this sort of
>> activity.  Please arrange to get that bug fixed.
>>
>> I also pointed out one other observation for you to think about.
>>
>> Thanks for sending this.  I didn't check to find any other instances
>> you might have missed, but you seem to have found quite a few.
>>
>> Reviewed-by: Alex Elder <elder@riscstar.com>
>>
>>> ---
>>>    drivers/staging/greybus/audio_codec.c    | 20 ++++++++--------
>>>    drivers/staging/greybus/audio_topology.c | 30 ++++++++++++------------
>>>    drivers/staging/greybus/bootrom.c        |  2 +-
>>>    drivers/staging/greybus/fw-download.c    |  2 +-
>>>    drivers/staging/greybus/fw-management.c  |  2 +-
>>>    drivers/staging/greybus/gpio.c           |  2 +-
>>>    drivers/staging/greybus/light.c          |  2 +-
>>>    drivers/staging/greybus/log.c            |  4 ++--
>>>    drivers/staging/greybus/loopback.c       |  4 ++--
>>>    drivers/staging/greybus/power_supply.c   |  2 +-
>>>    drivers/staging/greybus/raw.c            |  2 +-
>>>    drivers/staging/greybus/sdio.c           |  4 ++--
>>>    drivers/staging/greybus/spilib.c         |  2 +-
>>>    drivers/staging/greybus/uart.c           |  4 ++--
>>>    14 files changed, 41 insertions(+), 41 deletions(-)
>>>
>>
>> . . .
>>
>>> diff --git a/drivers/staging/greybus/bootrom.c
>>> b/drivers/staging/greybus/bootrom.c
>>> index 83921d90c322..fb1fbd3f7b99 100644
>>> --- a/drivers/staging/greybus/bootrom.c
>>> +++ b/drivers/staging/greybus/bootrom.c
>>> @@ -222,7 +222,7 @@ static int gb_bootrom_firmware_size_request(struct
>>> gb_operation *op)
>>>    	size_response = op->response->payload;
>>>    	size_response->size = cpu_to_le32(bootrom->fw->size);
>>>    -	dev_dbg(dev, "%s: firmware size %d bytes\n",
>>> +	dev_dbg(dev, "%s: firmware size %u bytes\n",
>>>    		__func__, size_response->size);
>>
>> This line actually contains an error (and it was there before).
>>
>> The type of gb_bootrom_firmware_size_response->size is __le32.
>> So the value being formatted needs to be converted into CPU
>> byte order before being used.  That could be done this way:
>> 	le32_to_cpu(size_response->size)
>> or just use this, which is known from a few lines above to
>> have the proper value and byte order:
>> 	bootrom->fw->size
>>
>> Please add this to your list of things to fix, and submit it
>> as a separate patch.  This would be a bug fix, which would
>> also give you a little bit of a new experience.
>>
>>>      unlock:
>>
>> . . .
>>
>>> diff --git a/drivers/staging/greybus/raw.c b/drivers/staging/greybus/raw.c
>>> index 4f1b3f4db404..2314496a858a 100644
>>> --- a/drivers/staging/greybus/raw.c
>>> +++ b/drivers/staging/greybus/raw.c
>>> @@ -112,7 +112,7 @@ static int gb_raw_request_handler(struct gb_operation
>>> *op)
>>>    	receive = op->request->payload;
>>>    	len = le32_to_cpu(receive->len);
>>>    	if (len != (int)(op->request->payload_size - sizeof(__le32))) {
>>> -		dev_err(dev, "raw receive request wrong size %d vs %d\n", len,
>>> +		dev_err(dev, "raw receive request wrong size %u vs %d\n", len,
>>>    			(int)(op->request->payload_size - sizeof(__le32)));
>>
>> The above size calculation was done somewhere else without the
>> (int) cast, and the format specifier was %zu in that case.
>> I don't think this needs to be changed necessarily, but it's
>> something inconsistent across the Greybus code.  Consistency
>> helps readability and maintainability.
>>   >   		return -EINVAL;
>>>    	}
>>
>> . . .
>>
>>

