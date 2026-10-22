Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792675707;
	b=FTaiQ6sBG+97yfC0kR2wvHgzO7sSfwlXW9/KJA7RMKTzH1JjERaPr7nVJ7MOBR4hz+ag
	 1MewheEv2+gxg+VuM9uLb3xT+YBXvKuhR/sRHB/8E8MhhpdOyJpXZMfGdhGv3KCyCusgH
	 osG8IlMWgLGBpj1FZ+VJ0wzu6I2FMYCP5RW5DRbMl4omzmNaIw70vlo9cgsYPp7tPt6au
	 xi4ynkiMDtUdE3/QfVefWv/8Ug5wJ2EtBmQr6/yCeV47IlBr6Pj5rcKcttZ4zZHHQyrRx
	 inQB1ydBxW8OOG8nYYxNMUiGBhHGXXQAGOu5r+L3o+aJLnxd2knVJZCwUQpIi7AeP7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792675707;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=LcT+KP9K464dUVVNerb9of+gGfIt5gtSXv2jKmAZWX0=;
	b=qynnWAcnd3hrahIF2U6pMmxJG12+psEdHT9KHzdQcLBoV2gofeEbOI4WnmR0O+E/Y1od
	 JK2ShyKiIalfbi6vTJR7jQFjcVGUc5nidGorwzOZFLFLgxq4urB8HXKVBufA43+WGgE+Y
	 yAE+pl5Dd5AMak6Uj162BiB/+XLRfP6zg0jyk8PwIIXY91MnskThid1y4P38PsevLj/kk
	 uEaMLr1jchyUWVsfUUShAB6eGsx/+Ti+9M+WXJEwiGdpHKqQeyfb/rCWkO5HhDmBaZC5H
	 kwEU0K3yUjvgt1L2IJXDPNX7O/YOFhN3CtJYcK493EwwrrninmXAu14F9bJ84CsXTCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=riscstar.com;
	spf=pass smtp.mailfrom=riscstar.com;
	dkim=pass header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=l50oXEsB;
	arc=none smtp.remote-ip=209.85.167.171
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9AA560A2611
	for <linux-staging@lists.linux.dev>; Thu, 22 Oct 2026 13:28:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9AA560A2611
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=l50oXEsB
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-4b1fcd3b1a9so705502b6e.0
        for <linux-staging@lists.linux.dev>; Thu, 22 Oct 2026 06:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1792675706; x=1793280506; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LcT+KP9K464dUVVNerb9of+gGfIt5gtSXv2jKmAZWX0=;
        b=l50oXEsB+FhKLzvQE5uILa2W1IoqjHL/ixBmZSd6d6llmtd/8X3IUZdMo5vLLg5ZdI
         cx64dxotfn6SnxJrY2W+6eP8EYjqbY9Kbqy482DDK/AEcNMda8RzWkANFQcO/lP8oqX5
         A0c2Yysfg6viMUZp0+aSK6P8xCVwuaiu/EUU+cysFGUnm0dR/dLcuVAj2lvC5/5H+UhA
         1DX5Ph1auCQpH00tqRcnFRNwVlBxr7LfLuBktXeAdNHly0CpmC3TQYqRscsCf5ATIHk9
         okkkHpHNx594sRIvhWTaE4JyYO3a2xbZplNH59ouqiwTPGp5P8NDG11iniH76fJ1KvjK
         P1ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792675706; x=1793280506;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LcT+KP9K464dUVVNerb9of+gGfIt5gtSXv2jKmAZWX0=;
        b=ZhG0+SCTTpPu2lbEyKL80aZU4/wD35V6QMj4h/4LsZQQy1OnNWugUj41HCmPq/wJL8
         cRE6AKAs+gxNL6qJQfig46CMCkw8gZUg4p4s2t8dJxesb+bIPVTW1c3BUwUbuosow8ol
         RE8MlltABavp7EvFMOlOMfZLg1lIY9ptT1PIOEerW7OI4L5UAbBafZKWwe9B9DzRONJh
         /YFGZw5GDUA+mcSoEO6Q7CI8ASaHT+O3vDWC8cKQyCo3d5IluurlBMHq3GIIABAgmQwo
         oLTw+qJtHa3/8GbJpYNeM1gwbVW7fKhBV1imxG+RVBekMl6D+t05QEMiwialIuvfanJ4
         lx+g==
X-Forwarded-Encrypted: i=1; AKwUvBxAjeit8aZhTtHn4P2NjhZutWy40SNjlzReI7RjpUOKqj7+FS20vFEwt2rWfk0TPMQuCRr1JwF2317YGDhW@lists.linux.dev
X-Gm-Message-State: AFq9FYKRmoqKl5AjigTuQcDtH72xCKL/471Qf0EvJjPTnDl3zcnSXNaj
	exblKFLoZEbUE3jbTXFpYthgDdldWR3WtCxztECtoTOYiCsBVK0l241ZsJ6tGCa5N+I=
X-Gm-Gg: AYBFou3Gt8Rxm+T+mYjKt5kZwx9NRkDF59XQuQDC467jshAm4rWySz26r6Wpp1rxnow
	E2i5ujbWykRebSgtLwleBAYKoBfnjERqgLJxSxUw+pQcewlgv+SoA+tDYFAg/CWwtVPux5tfo1X
	d99xArR2o0Q4P1oIvQDHupCuaSVQUbqLhMdfOiKxPP2slmnZ0zV1BZKg87TKaJwrXF5ij65o161
	gF7EHpM0NPUGxV4xO2pLvumJnP/x2igt5Hmn9OfCjMkJnfhWe07Ezbi7Ra/sJ7txbEoSlETh1hm
	zbIy6ytbVzWN1Gep1dRCclW6lWT7Pr8XMfcAefafytzwOcPHck7qWCDdXvbqH7bcDjjscZKKRgw
	ublBbncQKzzJrrdOexuws+/oapjOmFn8Qy3UZ//2wLCR2ykMzJpYm4IU/rKC3l6IwUX/8JKO5so
	avyKq8ruXgduVn4p+vWEgJrIb1LnOtO+jUPea3wIJ/I14Coz8fGivBqOlj//9/SAZ0r83bjUSf+
	Cb7fzbJBoJpKycvFtbkPV0oEj2PEE6uLYlNgZDLAQb7kGjIVvY/1wz3
X-Received: by 2002:a05:6808:4482:b0:4d3:9029:5ab3 with SMTP id 5614622812f47-553585760c1mr3346235b6e.35.1792675705007;
        Thu, 22 Oct 2026 06:28:25 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-552b745f968sm4259064b6e.14.2026.10.22.06.28.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 06:28:24 -0700 (PDT)
Message-ID: <6d683673-39de-4986-a593-68a5a495e764@riscstar.com>
Date: Thu, 22 Oct 2026 08:28:23 -0500
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
To: pavankumaryalagada@gmail.com, greybus-dev@lists.linaro.org,
 outreachy@lists.linux.dev
Cc: pure.logic@nexus-software.ie, johan@kernel.org, elder@kernel.org,
 gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20261022110238.38824-1-pavankumaryalagada@gmail.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20261022110238.38824-1-pavankumaryalagada@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/22/26 6:02 AM, pavankumaryalagada@gmail.com wrote:
> From: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
> 
> In the loopback function, usleep_range() is used for short delays
> and msleep() for longer delays. This requires choosing the delay
> function based on the requested time and converting microseconds
> to milliseconds when using msleep().
> 
> Replace both functions with fsleep(), which selects a suitable
> delay method based on the requested time. This avoids the need
> to choose the delay function and convert the time manually.
> 
> Suggested-by: Alex Elder <elder@riscstar.com>
> Signed-off-by: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>

Your description above is pretty good, but I agree with
Johan's comment.  In fact, you should think about and
understand exactly how that behavior changes with the
switch to using fsleep().
- When would the delay be different from before?
- When it differs--by how much does it differ?
- Is this amount significant?
And the third question gets at exactly what Johan was
saying should be included in the patch description.

We want to know not just the mechanics of the change,
but at a higher level, what is its effect?

You don't need to provide a super high level of detail
in this particular change, but you should demonstrate
somehow that you've thought about these things.

Please submit a new version of the patch and reword
the description a bit to concisely capture why it
makes sense to make the change, and why you believe
that the change in behavior is likely harmless.

Thanks.

					-Alex

> ---
>   drivers/staging/greybus/loopback.c | 8 ++------
>   1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/staging/greybus/loopback.c b/drivers/staging/greybus/loopback.c
> index efc69c10cffe..2fe845eaef29 100644
> --- a/drivers/staging/greybus/loopback.c
> +++ b/drivers/staging/greybus/loopback.c
> @@ -898,12 +898,8 @@ static int gb_loopback_fn(void *data)
>   		gb->send_count++;
>   		mutex_unlock(&gb->mutex);
>   
> -		if (us_wait) {
> -			if (us_wait < 20000)
> -				usleep_range(us_wait, us_wait + 100);
> -			else
> -				msleep(us_wait / 1000);
> -		}
> +		if (us_wait)
> +			fsleep(us_wait);
>   	}
>   
>   	gb_pm_runtime_put_autosuspend(bundle);

