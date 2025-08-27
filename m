Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B5161D5150
	for <linux-staging@lists.linux.dev>; Wed, 27 Aug 2025 09:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756286921; cv=none; b=JuuP91g17d4iIsjl3+KnAD6D3BKZf2F0e6mUXKtJB19Nxhqasg2gv6PLaJxIyyw2KAf9pGUJigQIMdYSjfUn+XKvEHRIunxDuiMALpySZykY2CUBTvbUng/SopFz8KKbkrdwgWqVO5ynmQemYB/QS9TAFUkPYSq67atVJajDA/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756286921; c=relaxed/simple;
	bh=u1JT9esYUPh//8vGQAYEOXy1sSFQYIQb0ssbEMuIBNo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fkZaDHbr+HLo+bEIEiTlmS6pbuJoAjilYIAo/Y3T6fl3R7OhGZ3uyH0l1IXNY2xI6gJuLwSgSWB4s69TTPLv29bOyQuhweOdCTwr40QGna2nlH2ZQE/k7uWKHkEl8L0GVIB4mAmxYvea/68x8AWTFZvYpFJIAg/NR7u91HmBpZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=elSVr/aH; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="elSVr/aH"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6188b793d21so9791158a12.3
        for <linux-staging@lists.linux.dev>; Wed, 27 Aug 2025 02:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756286918; x=1756891718; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5WNhk1ZhM3W2L38lczRb2sJSYi/8+nhFpxpIIZjaaw4=;
        b=elSVr/aHjmWbiRSeRRLHwegjsInCXyeNo5JXPecDnY7XMLXVl15gTVYOotnqy4KbKy
         8zeY3DcAGLW+zQmVJgDvN7SJjKydyJ/eHGXvaLG6323Xze94OhmQrj3qf6dpAmPXsTsw
         FquV8/+ow48fKMQ53QAIQd28Zpy5CAmvhKWFill2YYZt0WR7PQPAvNfSmfS3PaJ2tDdM
         GpKis/4v+7qtOBirx80E1QnAjrqPuXUEqG5KWYumI7vrO6Rzj3ipx4nTzo0ebfV8eZrK
         5J/lxdM938QmjyJv/F+2EpNDQDWEtK2uIjN03Q13GWCqpDEir+rCZpWCJ99huJxsVOBm
         GpPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756286918; x=1756891718;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5WNhk1ZhM3W2L38lczRb2sJSYi/8+nhFpxpIIZjaaw4=;
        b=syYFxvWAE/4Wx8iWK9U63pW5s6Nd3uRWREJmVSKd2anvoMlz5Ekd8GBMFeSyZAFlUJ
         XCI75Lgn7zZpHalZkzUeiEvRrfWsye8wV2dqQs3z1bYU2tsKJHd770EPenS7V9ZFx7dA
         C55zDdUl771lsO2fQEavXRud1xBB8SKEFx8nZmVJcCNcnElCt0/HJJosWfR4fWO8FZu0
         O4PcC0vh7Oslg4xV/xpkbKpq29XrJEMSQw7XSfs5FnEwznECFly9zQrn+sO5UEO4UqKI
         LKs6T+IUCi4n75Z8z0Cip+Fyxl7bvYYY1bwl9Uo5fYoZdDbWB8pa3T9glhWKnYCkT/Re
         1uTg==
X-Forwarded-Encrypted: i=1; AJvYcCW+bZaRniEy9STAnR1g8rwmn5uIsdF7HN9eHl6L3OA369bjXIuQuKfs8jkgZgpEUc9ayHi2ibjVlLHGX9mM@lists.linux.dev
X-Gm-Message-State: AOJu0Yy8723JAHYfr5KatTbzhEwCwGXmhNQWbfewno/dMAWmTjaABmLL
	Y0+FOJvjnYYQyPKRfoHuE+f4Uuf1g5GAhNe2YaOj7tWNYGkcwiB4sCCj
X-Gm-Gg: ASbGncsmCG4gArYj4k+3EYbIpui9apQvqKrmkah46QgewGlNFb9IrMDqH2oX6n/7Tzw
	l1QcHRdYdRAueKwfmhE3ImEu6tVT+rDmBMu1BiPaVsQO8uW7bFghvQDqz4A9A6fHCD61OLxKN+S
	NrzVqhohOeokL69ee35XqceYIhtO/7J3ehufBMjmiJsNCP9BL6soRBGWTxuW8Wrr/9uZVHCuQZY
	hLySFgRkL5GgB3dyVXnPntisiWSaf33Vnp61FxW0dHw32mYxEHx8tbMWSAOrfxrkE90fr2lBVBj
	8Mc/YkZ+YUYPElv8DYkHMLGoIWg4x9xLE0TZXXx1Ct/j2hwpeKm2vs/5JUpnSithDRubQ9Emv/r
	0bM/G/DdiPNzQTNAUux2x++o5dB5jsImLyqO6oa5QcAYEeIrPMd4shtYNMw0Etpi0HufB6WJIbQ
	4HNP4GJv2bKE3HnNzI8AocIkBtRP4/EWPaOM+HdDxyRssHwooRmYJsaXmH
X-Google-Smtp-Source: AGHT+IEiUn0mw0Bd+eWTikezNk1J+BkpH25CzT2HWGH+6VVEhsrZO7sZhbdFaQJFJa9fYRGNuchv1Q==
X-Received: by 2002:a17:907:72c9:b0:afd:d6e0:ee39 with SMTP id a640c23a62f3a-afe295c9153mr1713662666b.50.1756286918192;
        Wed, 27 Aug 2025 02:28:38 -0700 (PDT)
Received: from ?IPV6:2a02:908:1b0:afe0:92e9:ef08:4a92:adcf? ([2a02:908:1b0:afe0:92e9:ef08:4a92:adcf])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afe79b08cfasm684913866b.101.2025.08.27.02.28.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Aug 2025 02:28:37 -0700 (PDT)
Message-ID: <f3ab3c2d-2056-4802-aa73-2b0db4c7fc30@gmail.com>
Date: Wed, 27 Aug 2025 11:28:36 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: gpib: simplify and fix get_data_lines
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: gregkh@linuxfoundation.org, dpenkler@gmail.com,
 matchstick@neverthere.org, arnd@arndb.de, linux-kernel@vger.kernel.org,
 linux-staging@lists.linux.dev
References: <20250826220502.210485-1-osama.abdelkader@gmail.com>
 <aK6wlcLBN1HclMpl@stanley.mountain> <aK68qXqStIwBrejF@stanley.mountain>
Content-Language: en-US
From: Osama Abdelkader <osama.abdelkader@gmail.com>
In-Reply-To: <aK68qXqStIwBrejF@stanley.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 8/27/25 10:07 AM, Dan Carpenter wrote:
> On Wed, Aug 27, 2025 at 10:15:33AM +0300, Dan Carpenter wrote:
>> On Wed, Aug 27, 2025 at 12:05:02AM +0200, Osama Abdelkader wrote:
>>> The function `get_data_lines()` in gpib_bitbang.c currently reads 8
>>> GPIO descriptors individually and combines them into a byte.
>>> This has two issues:
>>>
>>>   * `gpiod_get_value()` returns an `int` which may be negative on
>>>     error. Assigning it directly into a `u8` may propagate unexpected
>>>     values. Masking ensures only the LSB is used.
>> Using the last bit in an error code is not really "error handling"...
>>
>> What you could do instead would be something like:
>>
>> 	int ret;
>>
>> 	for (i = 0; i < 8; i++) {
>> 		ret |= (gpiod_get_value(lines[i]) & 1) << i;
>> 		if (ret < 0) {
>> 			pr_err("something failed\n");
>> 			return -EINVAL;
> I meant to write "return 0;".  It's type u8.
>
> Also that doesn't work.  The masks and shift mess it up.
>
> 	u8 val = 0;
> 	int ret;
>
> 	for (i = 0; i < 8; i++) {
> 		ret = gpiod_get_value(lines[i]);
> 		if (ret < 0) {
> 			pr_err("something failed\n");
> 			continue;
> 		}
> 		val |= ret << i;
> 	}
>
> 	return ~val;

We can change the return type to int and propagate the error, so:

static int get_data_lines(u8 *out)

{

	int val, i;

	u8 ret = 0;

	struct gpio_desc *lines[8] = { D01, D02, D03, D04, D05, D06, D07, D08 };
	for (i = 0; i < 8; i++) { 		val = gpiod_get_value(lines[i]);

		if (val < 0)

			return val; // propagate error

		ret |= (val & 1) << i;

	}

	*out = ~ret; 	return 0;

}

Then in the caller:

u8 data;
if (!get_data_lines(&data))

	priv->rbuf[priv->count++] = data;

or we print the error here, What do you think?

>
> regards,
> dan carpenter
>
