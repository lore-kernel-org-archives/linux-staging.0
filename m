Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792851245;
	b=h1/7LVzYjnE7cE7neshZaidIKYJRZ+rmgZPy3iSdPe6vqvHV6GN2nQ1AgZt9uJOeNLML
	 VlJyPNvsG4dw/rF+0/9ptqnaR3XPFu3PaYNB1Yi9D+6Kfd2/+FnGc8lNXwT7CfjOvO7Dd
	 jqOM5KtDpqMARBpMgjjx9b/NwbWkv0/xcXs2pGQeSfUVyfUvQe+VCvl06Cl4Axhxc1rNv
	 cxxHhyi8oWuB5tEoiDhviuXBBEH4SMKW4bFuiw+PkDp1OHpNL0DaHAZeCOpJUYaCTzSoS
	 jFXBaL3DxFG8GkKPApM3QZy8s7pPFg7Ml/zsAFvOMJ9z9W9iwunKyRBDVYIF98m/GNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792851245;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=RurSR5QCrb3dOlmzaugDAkyS4iQBb3WW248QweZw5e8=;
	b=5G+tTP75V5gFz82UBsHXhVQGz2l5zr+TmjiOagPhhHt9AN8zGKlIsJ0owcWAbFNZEpvY
	 /xANvLd3YDPJ6sdr3y5xavOqpuJxPz2NxKeb+6SaXir7Sqqf4gp32flTa9aCUwwIbiVNe
	 cgRhEXLpgVj6N3P4i3/bN2yT30wKo1JPGHYbMToCaKSLDphzYutmymXuyS4nEUkUNo+hV
	 aYxEfE29YfUnj8qVVh8UANpdoVDr9hqxOldheVpjOgAqgZzzy1yrTtECMv4dWs1ZuOKzs
	 7JjBuS1Ii+8gREu4/oaC1pKOQqG0Nwz11ptrX4M70abffb4bjuKOIMszUwhOBZte+nw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ieee.org;
	spf=pass smtp.mailfrom=ieee.org;
	dkim=pass header.d=ieee.org header.i=@ieee.org header.a=rsa-sha256 header.s=google header.b=QymJQK4P;
	arc=none smtp.remote-ip=209.85.161.41
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14E56606A321
	for <linux-staging@lists.linux.dev>; Sat, 24 Oct 2026 14:14:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14E56606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ieee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ieee.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ieee.org header.i=@ieee.org header.a=rsa-sha256 header.s=google header.b=QymJQK4P
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-70094949641so1563419eaf.0
        for <linux-staging@lists.linux.dev>; Sat, 24 Oct 2026 07:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1792851243; x=1793456043; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RurSR5QCrb3dOlmzaugDAkyS4iQBb3WW248QweZw5e8=;
        b=QymJQK4PpYyfB0FrvXWDbRJWL0KcwCDYoHQTqogGOZMP4f1SgeOXbDdZzjpgdTEuLy
         /gpvPvaSapGq0nk3NDxmvT15bHqRYnsEOR61KKnae7eCUKduFBw3AxCUTzzVWS/mmFBn
         DjA/KZ72zyWzcj97T+RrBv6pWe1z5xhy+XJWE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792851243; x=1793456043;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RurSR5QCrb3dOlmzaugDAkyS4iQBb3WW248QweZw5e8=;
        b=rFQbT8OPH5Oa9shush0gl5JAUx8II1hoiZftkqgSg2SZm5f9L1F3tM9NEPUXNz9ZGH
         XRhTvTfFiv7x/HtRCHsye1IydbBUDAjp1465vOhyYVAY7AKn5Q4hHB9uT9FzOSaGBkYb
         ai9FrnYcCzlGpRn+5JhoIsXgKgnWnrySq/ffu8I78RjPf57kAJdTg0vm7NtkDorxdk45
         vGMlNosi99MOYQgMXFpd9CdCcqoCnuqHX/3DYbrRJccOnOAHSUl6NK6wOLwgBiW5ufcC
         QeFyPLCIUbWeF0z6U8SF6o+edYkBe5XjSyepjZGnieH7A04frWT+LfDAceG1nq0qrCNM
         P6dg==
X-Forwarded-Encrypted: i=1; AKwUvBwnXvYELbw7EJQMR17wcWjzs3K8UAVe70G+MYOZeZpwRWi1OUwPgWGg7l6sZMV9t7OBl+nTEwCJ9vnZKndS@lists.linux.dev
X-Gm-Message-State: AFq9FYKGY+W8ib1RrkWM3jZq3kRfVbpblga05sXZLGUdFwq8ZGDy+Vyy
	x43zLy2ot6ZWjcJNpycBVcX376APO56ANeikFBJYoQyBfUXk2ewRckfFl25y3HlFlA==
X-Gm-Gg: AYBFou3xkzxUKgX+xCbo9fLnTW+XkL/1pkjvh0iCI8DfakrLNnroAOBheRI4DbdAjKA
	9FK/V/ByMJOqvB/+SF/fq7KIjizKGxYHrrQdXewEMcKcSTQXTCRYsbYld4LkleiYQ4ObGR9G6IY
	IWLJjorExsk5iU5+I+oHdcdZxxsC9eM2Tc4mmcN2HORKbPbUoiKieJ+EUXoi1V6iW1jiRmMAreP
	lbiMliynSrxTUHZkpoRcAWTtTBX7jWel4RY61JcbMKhR8v9Osuw7lFRRDok2S4so5jr1FXXgvIS
	anZTTXmrWwCf03xeQ3sJpthoK8kQ/nAHa7Z+ZYC0KCseW14+UuQ1LitbVdjT1xaxFIRLjspyf+H
	3D/m0/WyooX/EK/cYwuemY/qT7lN1CJbt+BCopsK6K+y++8JsRkJ7MuZ0opjkegUsEnmsFDSASj
	ScklUHm7hIhq48lm7A6Xs1e7aLxQfCsXA1dwifrqXrwCMH/sGgCfhFi4tQ1VsgFPIC7PIluwHWL
	JoEvdaM22MFketturBQDnwLfGXS48D41opyohmrzyYDvcjM0rX7wPYsTl75rFJk/suFYz2Jck2X
	ZFRucA==
X-Received: by 2002:a4a:e907:0:b0:6f4:e301:cc28 with SMTP id 006d021491bc7-70ba0e91903mr844092eaf.24.1792851242978;
        Sat, 24 Oct 2026 07:14:02 -0700 (PDT)
Received: from [10.211.55.5] ([73.62.185.64])
        by smtp.googlemail.com with ESMTPSA id 46e09a7af769-850fc0fc7a1sm2509401a34.25.2026.10.24.07.14.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Oct 2026 07:14:01 -0700 (PDT)
Message-ID: <3d919bc5-0fe0-4afc-a5fe-12c0ef1989dd@ieee.org>
Date: Sat, 24 Oct 2026 09:14:00 -0500
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
To: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>,
 Julia Lawall <julia.lawall@inria.fr>
Cc: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
 outreachy@lists.linux.dev, johan@kernel.org, elder@kernel.org,
 gregkh@linuxfoundation.org, vaibhav.sr@gmail.com, mgreer@animalcreek.com,
 vireshk@kernel.org, rmfrfs@gmail.com, dtwlin@gmail.com,
 pure.logic@nexus-software.ie, linux-kernel@vger.kernel.org
References: <20261021163437.280930-1-pavankumaryalagada@gmail.com>
 <3433f922-bffb-4f1c-8e06-a7a87f5dbcaf@ieee.org>
 <77adf02-43a9-7621-a94-9da41f8c5a56@inria.fr> <atuYWuWeqvEG6j4B@user>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <atuYWuWeqvEG6j4B@user>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/23/26 12:24 PM, Yalagada Pavan Kumar wrote:
> On Thu, Oct 22, 2026 at 09:30:26AM -0400, Julia Lawall wrote:
>>
>> On Thu, 22 Oct 2026, Alex Elder wrote:
>>
>>> On 10/21/26 11:34 AM,pavankumaryalagada@gmail.com wrote:
>>>> From: Yalagada Pavan Kumar<pavankumaryalagada@gmail.com>
>>>>
>>>> Unsigned variables are printed using %d.
>>>> Replace them with %u to match their types.
>>>>
>>>> Signed-off-by: Yalagada Pavan Kumar<pavankumaryalagada@gmail.com>
>>> I have reviewed every one of these and they look good.  Quite a few
>>> of them--because the size of the value being formatted is less than
>>> 32 bits--would print correctly no matter what their value.  But I
>>> think it at least does no harm to convert the format specifier to
>>> unsigned in all of these cases.
>> I was suprised the compiler doesn't complain about this.  It seems to
>> complain a lot about type-related format specifiers.  Yalagada maybe it
>> could be worth adding something clearly invalid in one of the argument
>> lists to see if the code is actually getting compiled, or if you need to
>> set some config option to make that happen.
> The files compiled sucessfully with the normal build settings. I also
> enabled -Wformat-signedness to check for format mismatchse, as this check
> is not enabled by default. It revealed a few more issues, which i'll look
> into as well.

I think you might find that "sparse" complains.  Run your build
with "C=1" to run (by default) sparse, and see if it says something.

					-Alex

> 
> Pavan
> 
>> julia

