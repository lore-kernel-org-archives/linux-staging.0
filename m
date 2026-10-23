Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792722604;
	b=G8Z0Aj65HoFe/wb2nhvMUQ/zWvegJTjnuifLbV4/9ruMtANBpUQy9UTJLkpYx0HOP3nQ
	 NxSSIBJDEL6UoDOhryWLv6mhZj7N87l4kJH4RK8mpMmRH7bUtmziwPTKjp5zBX5zp91JZ
	 0qqx0miL9up/UJPrPdLtD/sfYGKlQFq1NY+2U8vK/1YMhZN+0DliN/T6RrqUUKKZ1OUDk
	 BWtsrGhwf6Gg6UCFKY4HLHJKinFs7XoXyfOU4m2d5MTNExhASm9DY7xI63qWguG4DHKSi
	 84Hf5pwyTkh4yoMjwsWDVz7H7XoOQ9YolJY3hzdlvSr9m07Z1wSDXfvJDJ0NBxR2f7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792722604;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=PdL9lRrDABEAZ0rJfjxtsf4RmpFyqkToBsIy06Xtq1c=;
	b=qGPQwf/YTrIRsdyJe0GfAlmqWFGF4CgL25Y6moBW5H6JhlpVz6FuT/WVqTjiBL9tLW0+
	 J0fB8cuWmvOlJb/QPQe+X4qYwu96GtpkKlc2wlumTWRlHzGL88VraY+rREdbNKBAdzMfz
	 5mzNDwdZ4Gdv5KwvxLvck95ixZtxBV/sZpl5aAtsTMfcVXhqZgvuSKVCUnW/lsMPRUzl5
	 gnFMoakxqlkIZRjB84yaE8scLkqYyWoRlzhwYwWAyY9H1wGx2q38QL4LAAwkBwV/Dao6h
	 6REvV3XUbOJZQKTzxjtN0zkceZ/iIGqSJhv8AVHyGYLWsrmIOIVXKKxw82PhpwDcuAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=b5KhIckr;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10452606A31B
	for <linux-staging@lists.linux.dev>; Fri, 23 Oct 2026 02:30:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10452606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=b5KhIckr
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a1df4c0966so1593185e9.1
        for <linux-staging@lists.linux.dev>; Thu, 22 Oct 2026 19:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792722602; x=1793327402; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PdL9lRrDABEAZ0rJfjxtsf4RmpFyqkToBsIy06Xtq1c=;
        b=b5KhIckrpYa0gotRpbo75CQRla2FN6dXY6DlxL1XqRh2XaD+euYVCksMmk11DJkWzf
         ohc3PaXVv4tZxU6J1hNh9O0RHD8iiFqeGxstrR96QC8V9fjCg5cjzEBESK4D+XCIieII
         gGj5MVVLRH3FOyR/z4ngyd1KnKzp+c0C8/ZbZmSiULBBqI3WiSVONd4NItt84hgjWAad
         EpR/fuQVEcsqbNyKEPOQieS7zWnOvMLCgxqK6EW8zL6UMvZwpXhz3pZEf3a00HxYGu8l
         wANsJ9bBiVJm4+1YM+eEGDJOj3P/zCgyZeGZ97DSXqoa7AiNkoliuTq0LC+aU8Cjkmtj
         +T4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792722602; x=1793327402;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PdL9lRrDABEAZ0rJfjxtsf4RmpFyqkToBsIy06Xtq1c=;
        b=sOSeyGm4toem7vFHYHwjFhjjujZ+ib0Zrx8AvC1nbJY7Gi7fYiHURBQEAbLB75bQfs
         gBEUDzLUqVYfD2zS0gkxZE0J78xEMAGPKsxjNahnTY4QIvLQEX6Kqznh91nfVCrLaqtd
         0PmjIA0u+5WkzjFTvuBfe7xOBaALEW42FxAmF24/Fn/nZbxF2f5+JeUauOz/u2ue8Vif
         i2Jg70hdA1s1tWfv7WBtsza/2K4+OQ17xfx5inyMTG2EA46JAZSNqR3UffQMqGUF/VCA
         6d7ulSehAPNXE/s+b2zdIBqF7zyVEvMpplsrDPTITa89YITVj2e0GCl3SG/3+BsNNS+K
         WUvg==
X-Forwarded-Encrypted: i=1; AKwUvBwB7iZ7Ah4OCQcD2cXZ+PIDNEEj0IWIOqrqm/kN97LksJ78StSRDvbSl63NY5GYMWlWwZ2TcX6l7Nx0uMik@lists.linux.dev
X-Gm-Message-State: AFq9FYIuynCEoFTBS9j2ib+9X46tzkxe/NhlzKDMBFH1nNm/F+D8w6NY
	uxAJe4sndie7hLEIaj8pGDvQNNXl+t1pssns25HT3WjfOUsuCqMCblOPUQrKSuQqBC0=
X-Gm-Gg: AYBFou1oE/Nocw0v5QVuhJXxxLYZkMurbvQo+QWqYEspMhGclqKdl4IbvJc5toHKyAk
	1JMGiQHewL8wSqncTxkhoRYl+Sme0b68hWuBk9WkMxwOwiu5J/10wfQYTk3Wt1H5EWeG+aFJEFh
	PwtBav6VsF7fT7ti8U0QQ3RLWymbYeokMbpNQIqXTgf1wv4oD9ecpYP5kzlSWCrsAtVfNmXVFuZ
	UbBeiPH6hF1FITPw+gmFXFJxEOZVNc9sKl4Os4SQ/nFI8xV9j652fnaQt1CLnJvEs2Q6yPK3ycj
	HelFrtP0CnrDpG41JqU+khTPaY054Gsb5GdhQE9O3k2uk7AxsJ5kH+6RxuNAJqHo/xqFfMbe7w1
	6M60J2yjwJUqVowjuDL/z7NEkVT9St7g8ekuGp9noXW0EelRZRUH5YOS6tVbwxGxfd8VUWl/Ajl
	/ppTe/lvsNxqu9PUy79HtQ5Ha8rwCns4Y1dCslOLDQEGGtuqnRNIpL2UydHLMHr714Jw2UCfDCl
	UDQLNET4xY9oJoC1jitBjSZNBybk9jmxCvNxjWqM76g1XSEl6S8IupUHIt1Hd33ZFX29fvjDwSt
	Id1N0zHC0zYB
X-Received: by 2002:a05:600c:3542:b0:4a2:b73:d15c with SMTP id 5b1f17b1804b1-4a211c51a9bmr12422005e9.3.1792722602389;
        Thu, 22 Oct 2026 19:30:02 -0700 (PDT)
Received: from [192.168.0.167] ([51.37.82.204])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a211bba03esm20901525e9.9.2026.10.22.19.30.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 19:30:01 -0700 (PDT)
Message-ID: <237b20f5-3354-49d7-add8-71170d450306@linaro.org>
Date: Fri, 23 Oct 2026 03:30:00 +0100
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
To: Johan Hovold <johan@kernel.org>, Julia Lawall <julia.lawall@inria.fr>
Cc: Alex Elder <elder@ieee.org>, pavankumaryalagada@gmail.com,
 greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
 outreachy@lists.linux.dev, elder@kernel.org, gregkh@linuxfoundation.org,
 vaibhav.sr@gmail.com, mgreer@animalcreek.com, vireshk@kernel.org,
 rmfrfs@gmail.com, dtwlin@gmail.com, linux-kernel@vger.kernel.org
References: <20261021163437.280930-1-pavankumaryalagada@gmail.com>
 <3433f922-bffb-4f1c-8e06-a7a87f5dbcaf@ieee.org>
 <d0a4a257-1ec9-7096-11db-5ff4b3244bac@inria.fr>
 <4c393ce3-41ae-4f4e-9af0-4eb7cf1c425a@ieee.org>
 <6b5a87f-3ca-ddc4-1ea8-f3ee7f45d83@inria.fr>
 <atoVKX09VDnak7EZ@hovoldconsulting.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <atoVKX09VDnak7EZ@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/10/2026 14:52, Johan Hovold wrote:
> On Thu, Oct 22, 2026 at 09:45:51AM -0400, Julia Lawall wrote:
>> On Thu, 22 Oct 2026, Alex Elder wrote:
>>> On 10/22/26 8:35 AM, Julia Lawall wrote:
>>>> Does anyone on the greybus list know anything about this person:
>>>>
>>>> Bryan O'Donoghue <pure.logic@nexus-software.ie>
>>>>
>>>> The email address is not valid, which is somewhat tiresome...
>>>
>>> Bryan was on the Greybus kernel team.  Remove that address from
>>> the list.  I'll let him know that e-mail is bouncing so he can
>>> add himself back.
>>
>> Actually, the email comes from the MAINTAINERS file.
> 
> Hmm. I haven't seen any such bounces (and I CC:ed that address a couple
> of hours ago).
> 
> Bryan, is your nexus-software address still valid?
> 
> Johan

Not at all.

20261023022913.3763777-1-bod@kernel.org

---
bod
