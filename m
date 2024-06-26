Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E2B143C49;
	Wed, 26 Jun 2024 05:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719379684; cv=none; b=e663hFJvlGXnlTf5GCnHpr41w7H4nnHyTh/Ez2enPdg06AVIOWS8x9ZwlR/ydoCUWHDCRR4MHxTr4DXZK91QlxBxtRL6p4nWIa+AQ+bEOfi5QKpLqjSUGlZaMKMMebIt4VjQJCGj0ez7BqF9XGKXDnayGTIMdtqOni3utBVNCFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719379684; c=relaxed/simple;
	bh=gqIrlSFN7Q077XmmtzRgBDw2bUKKLUZ3uDf4nCewmNA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=glXAuG7V9XenwxveSw9aYvBgt0BB6wDlWH7Aw6IHBu3N50s2mXRRfumAiL1z4s1pflqC0fNVBFSgQVsJADNFS34NMUBFrqvgNzXiyZutuwa+1aMwElEH0QYE4pWAWG8LOEhK8pTZbdObC4bBhSKPFlsP8ftx+sBxYdSY07L6mic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ev/UUZvs; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ev/UUZvs"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-366dd7b269cso189124f8f.2;
        Tue, 25 Jun 2024 22:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719379680; x=1719984480; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xNjNDp/8w/LBntDpoHkINzJ57LeRYfU/2b/EYE/JleQ=;
        b=ev/UUZvsiV6IM7rz+aoEaCeSVdlrxJnt/wfALJD8t2rI6B7Teh2dR9XB0Y8WBOhhPA
         QaZ/P5OJOzqywQsp+eMBefy7HiSAItxjBOmYsXVJWvwibdFylcqiwdresmQB1zHyynNa
         F9uFv4bwlMl/1mpf42pCoa96HjIdD1ZNrYQ4CJuPBQPFWBYBAiL0F4RS8Yl93U8MXVHX
         OM+uwd59nQBBSAT0lxuzz6HkXTSohcXyrQC5TJY6pUR47fOCIehXoSqunKbopYd65jk5
         bz88BPxDr0xOQZsmlxolqObGP4H4pfnGGEHMUDF9qnLghY0gxGyIdqbsYkXpCCCSLQ9l
         SKvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719379680; x=1719984480;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xNjNDp/8w/LBntDpoHkINzJ57LeRYfU/2b/EYE/JleQ=;
        b=rQUIuR/zVn6otVmPVSK+5wiZU77jLpV2VyFcy1gXiIznlaFPsp3CYC/Q+EK52jxJ8N
         3jcbjKG37lqporlvyRZ1pw5CBExJuJvbJ6c8S4cGCrzfT7OmVGCsZ23Ie4lJqeE0sckF
         o+NAM4Zbojn2DJMCq0dNk4FDL4lmWH23QjrK7cOpMHONZZrqVPZebQ0bLqXPhnBar3mS
         tJkSr2U9tdkWKkhc+4orn6JsYdF4BFsvNKQcfKd/YSdfgLnAsM07NVzyVjxh8wBjqlmg
         LFBIstLa09uJwmAkIlEyz1wTpvzCfNOE6ppUBLbh8SHY2PrL3WLA2JaAWPdQqHo1J3MA
         EaNg==
X-Forwarded-Encrypted: i=1; AJvYcCWtOUt6co//el9iOMU0dg5TjegCitKh9YYxB/nH5wX+8JbotKedgIekCwENAxPNbLQBRqnT/9SWonJ3E9+YRfEaj1DYCfi9tO8qWmtAjF5tYzOSjXqTj2LdfeFYf4uoh+RFL4JtuVk9Wg==
X-Gm-Message-State: AOJu0YxSnl2Dljn9CICqZFI7zmVCSPA3JJ/cZTO5JTKXEZcWBj4Hm/yN
	3i02YwYKJWAg1anxd1XVy3DNpyPOQ0ZJ4hUVblk93nahTpYj7UeK
X-Google-Smtp-Source: AGHT+IEJwIL07uFAbaf5dW8x4d2flONUAUoa75SWzrPDUykhAsl4IaZZP6dli6kK/i8KiqSKjSGPVA==
X-Received: by 2002:a05:6000:1fa9:b0:365:ca95:b6cd with SMTP id ffacd0b85a97d-366e2aa64ddmr7226545f8f.7.1719379680117;
        Tue, 25 Jun 2024 22:28:00 -0700 (PDT)
Received: from [192.168.0.103] (p57935a9b.dip0.t-ipconnect.de. [87.147.90.155])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36638d9bd0fsm14758229f8f.52.2024.06.25.22.27.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Jun 2024 22:27:59 -0700 (PDT)
Message-ID: <c8daf5a0-f511-4071-8c24-3e39aca9e68c@gmail.com>
Date: Wed, 26 Jun 2024 07:27:58 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: nvec: use x instead of x != NULL
To: Julia Lawall <julia.lawall@inria.fr>
Cc: Tom Mounet <tommounet@gmail.com>, Marc Dietrich <marvin24@gmx.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, ac100@lists.launchpad.net,
 linux-tegra@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
References: <667b2ee6.050a0220.f9c1.5426@mx.google.com>
 <c2911f68-d1e2-4b45-af95-590926b7a6f1@gmail.com>
 <21151f5a-059-538c-3cec-7c40d625c5a8@inria.fr>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <21151f5a-059-538c-3cec-7c40d625c5a8@inria.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/26/24 06:48, Julia Lawall wrote:
> 
> 
> On Wed, 26 Jun 2024, Philipp Hortmann wrote:
> 
>> On 6/25/24 22:56, Tom Mounet wrote:
>>> Comply with coding rules defined in checkpatch
>>>
>>> Signed-off-by: Tom Mounet <tommounet@gmail.com>
>>> ---
>>>    drivers/staging/nvec/nvec.c | 4 ++--
>>>    1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
>>> index e5ca78e57..814eb121c 100644
>>> --- a/drivers/staging/nvec/nvec.c
>>> +++ b/drivers/staging/nvec/nvec.c
>>> @@ -300,7 +300,7 @@ int nvec_write_sync(struct nvec_chip *nvec,
>>>    {
>>>    	mutex_lock(&nvec->sync_write_mutex);
>>>    -	if (msg != NULL)
>>> +	if (msg)
>>>    		*msg = NULL;
>>>      	nvec->sync_write_pending = (data[1] << 8) + data[0];
>>> @@ -322,7 +322,7 @@ int nvec_write_sync(struct nvec_chip *nvec,
>>>      	dev_dbg(nvec->dev, "nvec_sync_write: pong!\n");
>>>    -	if (msg != NULL)
>>> +	if (msg)
>>>    		*msg = nvec->last_sync_msg;
>>>    	else
>>>    		nvec_msg_free(nvec, nvec->last_sync_msg);
>>
>>
>> Hi Tom,
>>
>> what you change in this patch is fine. But the Description is not so lucky.
>> Reason is that checkpatch is not defining the coding style. Not at all.
>> Sometimes checkpatch is even wrong. The description I like would be:
>>
>> Use x instead of x != NULL to shorten code.
>>
>> or
>>
>> Use x instead of x != NULL to improve readability.
>>
>> If you send in a second version of this patch please use a change history.
>> Description from Dan under:
>> https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/
> 
> How about adding "Issue identified by checkpatch"?  Checkpatch helped find
> the problem, so it would be nice to acknowledge that.
> 
> julia
> 

Hi Julia,

The following lines sound very authoritative. It is only my opinion and 
can be wrong.

I think checkpatch is valued a lot because every patch send in is 
checked by checkpatch. checkpatch can be mentioned in the description. 
But the developer cannot hide at all behind a checkpatch warning/error 
message. The developer must take full responsibility for the patch. The 
developer needs to use common sense.

Please have a look at this email from Greg:
https://lore.kernel.org/linux-staging/2024062443-udder-spotted-cc0d@gregkh/T/#m280ebb2be94e434234f405e722fc35dc6d1db710

I think that Greg once wrote that he does not care about the tool that 
found the issue. He much more cares about if the change makes sense. The 
"Why" in the description is most important for him. And the why cannot 
be because checkpatch or any other tool told the developer so.

Thanks for your support.

Bye Philipp







