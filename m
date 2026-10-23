Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792761488;
	b=n5FlFRsniZtYDJbwhu8W2iUI9QPjWzB3kdGDB8XMBH5tgdghBhBUEGzNguiYPJ2McVCt
	 w5UOxw7gnukulnhkNs4ZloplsZXRYZoCLjofXHkvL79tNqr9diM5H+t4Hu4bSM4D7BFvP
	 PH7Qmt4cL4d6OgOpRsAhAegMewQDbm/mgndJU1phLXfTzAjLqvQtbmharGvq48wJpNWOP
	 iy8EkfyByoXOuuOzxPhI2d4lnrmnnteAi6JteDuCgl2NYoTAaDQ7lO5g0dAx5cA6PTD8o
	 EMcBSG2ROjwMepWRr69oCwasR5DcreBQLUbQEUOHIYVe2uoa6oI/hTTz3IbBOdsJqMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792761488;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=ZO18/VDYKQ9K6+z12qbV2AuMLMhBQkemvCDskvO0ydg=;
	b=WLHvhlDX3tjcRugn3gaLNpWTpqwiPYgr7HDDn40p9koCXRYAp3i6sByNwj1L9Lf0luic
	 o7AwRyXOEm6ncNG6qkYbZQ+YHkZbkIH3Z53s8heaeiW6VK9rShOoPmdBqza94FVLw6y3z
	 8NkHgDlqcK8ssOZKvqTINYdgMJzzQNr/galbyY+Kc678NBoDczdLFR+YADUA0LJT0sPjr
	 Ae8q7Fhs+iq0gy+kwBskBDIc35OSHs3yn6m+gO2h34NA3vdDtEauD7ezwmc+5PfwujIyG
	 56m9uTFTN36a3bR2qFUgsWZP9XAFzzrjXC/BV4bDgoBEeoO1ykMn/rt4EYDM2rj/YGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=riscstar.com;
	spf=pass smtp.mailfrom=riscstar.com;
	dkim=pass header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b="Pevn/TIr";
	arc=none smtp.remote-ip=209.85.161.51
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AADAF606A31B
	for <linux-staging@lists.linux.dev>; Fri, 23 Oct 2026 13:18:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AADAF606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=Pevn/TIr
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-702dedeb70dso542864eaf.1
        for <linux-staging@lists.linux.dev>; Fri, 23 Oct 2026 06:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1792761486; x=1793366286; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZO18/VDYKQ9K6+z12qbV2AuMLMhBQkemvCDskvO0ydg=;
        b=Pevn/TIrB3fCqRotdqi0I0Ti33oWdV0r+TmOSUnQLSuhF2/iAkP1XYCelgIct8DVe6
         yJdK5NVRlBQW/YlNoCoiVOwMt1eVkltrnAqUTzjqLLLi+HXNYL2PtYA0OF18lXO4keFf
         q2VP626PfPcmsnJjWSOzCg6DyEzNQEC+Lj5bYhXrl3HqujPwua+CztuPuMZXLbINERQ7
         tceFELRexV08OaWIeMwaMUwxtVngAgaYZWvVykGRlmTSlPP4XF+sBV1x0zsAXQyPQRP3
         YtjxuVX42ayldA6B5pJBEgd9hVreY/CQqlFv+uwqArZfXhqhENQPu8IQxATtqwkHIa10
         f0sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792761486; x=1793366286;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZO18/VDYKQ9K6+z12qbV2AuMLMhBQkemvCDskvO0ydg=;
        b=u5AYCblYu5WUlanEz8r1eeO1fa2gBAn0cYdGJpTjFCxOGdbX/AuXqC6QF9sMv95dLS
         UszlyeF8jmHMDpCDftzThAUQu0Y0FJsDWtLBxmWChihZ3JgO4VPMLeWkuV3WYdDnxvk4
         qqEsLiV1oW/kiDBDuCt9SIizbbf3c9+dnOQtr4obVrze1SCLq53+rHE8vxIaXqmRwhC8
         lR45w/Mqr1MBT5nLqkyxbGOu8wQULgDLQViGdU0htcFk2A+vR9Svod7yiAVkJPLAgW+b
         +vZI5smDBlROfYu9xnTv0fW8br9wUalDHFFElyy6PrK38GdvCptQxbB07oG5femzzkaB
         1FEg==
X-Forwarded-Encrypted: i=1; AKwUvBwtcC4pK1HCF3oJZ43WKrTrfSFUy1dLYgUKGqFhiOk63gUPRWdrlYiYNzAVBsuy+OI1CC4MZjpAu3IwPeFu@lists.linux.dev
X-Gm-Message-State: AFq9FYIGBnnrnXxPuEA7NPOc2qrJJwiHdPZON2ptpAZvGl3ZdZBRqBGZ
	0d05Pozo1zFC7Td85Tg8Ry/tD3s4R6jRYH4rV1t4FGPfpg+11ag86ejEiDFbMUqZCR0=
X-Gm-Gg: AYBFou2oi1H5brswzR/rzKlNNNpZQu6g1UWE2D59pSD9T9QERQoqqF92uZtJlwMkaZC
	jSR8goqmRbdjOVySr3ADZVpvyhDpkJDfoztVoBJX5nWqyPjTxAPyzrQteFhV7SnayopC3CKQD4E
	WFJhT9iqKObA/87TmY2zIqzBz9iWQbqexcvC3maPhnbVTgrmwlDZU/tzdI/lDBScuV/NJTbHGT8
	3usyWqgTMNx3AuI5qzG3JWZWlLYc1KevtX5KRe5REC5U+FyBC7rGEd10uPDG57MGsR+nF4efTeP
	pzuDLGcGuAN6G/CsKsgUDOj0nKIjrv/Y8dfEuSmWln7e4BAZSEhWykmNUA7LIR4+66G+g9DhEps
	+mjwMqjGWfkKcCctMeDCklDruy9RSHgmVO1WkvpZ/ENny0QkvGMhz+ycrWLDDmZRvhdyhNipXvi
	jSkbqza5j9hPs68TgwYgRu03uD8NheWmkrFU5SqSHn/5vBWYu9g3rgR3Ia5XI4vMXsJupQu5uII
	zzdqNq+Ph4NiFIRkNoXowa/de9tjiudLq/QKjn7ukR7XCXpz8IIqWf6
X-Received: by 2002:a05:6820:498e:b0:700:da68:7398 with SMTP id 006d021491bc7-70b88a4894dmr1285740eaf.43.1792761486541;
        Fri, 23 Oct 2026 06:18:06 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-70b9ae63d9asm8548eaf.8.2026.10.23.06.18.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 06:18:06 -0700 (PDT)
Message-ID: <fc3a1fb9-181d-4994-9bf2-45272dafc86e@riscstar.com>
Date: Fri, 23 Oct 2026 08:18:04 -0500
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
Subject: Re: [PATCH v2] staging: greybus: loopback: Use fsleep() for delay
To: Greg KH <gregkh@linuxfoundation.org>
Cc: pavankumaryalagada@gmail.com, greybus-dev@lists.linaro.org,
 outreachy@lists.linux.dev, pure.logic@nexus-software.ie, johan@kernel.org,
 elder@kernel.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20261022202455.104142-1-pavankumaryalagada@gmail.com>
 <a411ee0e-22c4-4797-9fdc-3ac11fa20d60@riscstar.com>
 <2026102338-rack-garland-2a29@gregkh>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <2026102338-rack-garland-2a29@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/23/26 8:04 AM, Greg KH wrote:
> On Fri, Oct 23, 2026 at 07:48:54AM -0500, Alex Elder wrote:
>> On 10/22/26 3:24 PM, pavankumaryalagada@gmail.com wrote:
>>> From: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
>>>
>>> In the loopback function, usleep_range() is used for short delays
>>> and msleep() for longer delays. This requires choosing the delay
>>> function based on the requested time and converting microseconds
>>> to milliseconds when using msleep().
>>>
>>> Replace both functions with fsleep(), which chooses a delay
>>> delay method based on the requested time. For short delays,
>>
>> s/delay delay/delay/
>>
>> I think "checkpatch.pl" would have caught this.
>>
>> Maybe Greg can fix this up.
> 
> Nope, not for staging patches, this is for "learning" :)

Sounds good.

Please provide version 3.  And given that, I'll add one more
suggestion.

You don't provide the *reason* for making this change in your
description.  You say that fsleep() does roughly the same thing
as the existing code.  But... why make the change?

The answer is roughly that fsleep() is a common or "standard"
function, and it's better to use those where available.  I can
think of at least three reasons:
- It's better to use a well-known common function where available,
   because reviewers will already be familiar with what it does
- A common function might get optimizations and improvements that
   your code would otherwise not benefit from
- It might (slightly) reduce code size

I am not suggesting you include all that, but you should
understand it.  My point is that you should be clear on
the reason for the suggested change in your patch header.

Even something like:
   Replace this block of code with a simple call to fsleep(),
   which does the same thing.
is enough to explain *why*.

Also, before sending *any* patch for review, please *always*
re-run checkpatch.pl so it can find trivial problems for you.

					-Alex

> 
> thanks.
> 
> greg k-h

