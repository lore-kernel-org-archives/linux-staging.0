Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B5981CB310
	for <linux-staging@lists.linux.dev>; Wed,  6 Nov 2024 13:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730899402; cv=none; b=V9G5KYbsjrhT1KhNE6uNI0mj5etRjkhX1CEweRrvT6MbZCmlSX7EHieJMP3mJ+hP0LP3wmpya8pLWyzsDLWM9ctTVVcMz5Hdlulwm2wxswfpRvKZNWhNdKTAGUeJABZ15TBB8FRIPFpTtBzHKlLyqKxkR/fKL2YJGkhLDneA/aI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730899402; c=relaxed/simple;
	bh=MYzngtFP/0VquOc39xPDda1muKV2r7FBWa/dVjhLMB8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RXE18TkfdiC+Br2xOn637txON1CEhA1mkpw31bbhI39XrEHglqFQHoMfM0mO4GVMvpqNvCQ9T/y/EWbK2kI1luHjvW3xm/8wj7Wv3FrjG8s7OZyZB7JHPdCDmVqltjEdkd+ldxbIgqzu9r11OWY3kNFaRHIHsSPRxbu5nvriVvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ieee.org; spf=pass smtp.mailfrom=ieee.org; dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b=Rseb4ght; arc=none smtp.client-ip=209.85.166.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ieee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ieee.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b="Rseb4ght"
Received: by mail-io1-f54.google.com with SMTP id ca18e2360f4ac-83ac4dacaf9so243632739f.2
        for <linux-staging@lists.linux.dev>; Wed, 06 Nov 2024 05:23:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1730899398; x=1731504198; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lvbC08yvW1+eqm0ij3BDRpcWHRsnk8Vwjo+EayjDVtU=;
        b=Rseb4ghtq+stdkexRypgy1IMzqDXMeqh+ZPtA98vLwGD0m1N/uvYZ6oOr8q1RO5YNX
         /fT4uTlxpg7X/IGeUEj5Dp1+M9xptND7Xt54JbaDreW6Cesi8DaEskyiw+WeMn0y+FlN
         HlrEpeUEwS86J6ApTPrirN/QXFlJmj72Q+ZgQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730899398; x=1731504198;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lvbC08yvW1+eqm0ij3BDRpcWHRsnk8Vwjo+EayjDVtU=;
        b=cp4PH0aeT9p+swbMy48lTVxFbViYR3uvaoLADjkls0yOtwXL6Txnz3uoylsvdBPS0G
         zJPS7RfTJ4vy1nOf8/Rzeh7xEl2+rRNOOW2VFO/3gqJGKJ/WwaLLppIwpzzOjTbUxhtk
         R4quYX5tLiLpbtRzzvNSRnerMpYkq5/Jvsgh1T+aKRwJ7nIBi7UKov+vXhARNye+rMRc
         /vizBptg4jBhYQrCJ7vfB9AbeCF2p487BNiSi7STykONQdzYYjbWB0S5dixN3IFxdblH
         Giakb4hRelbtKdycuxs4+6Pak0flm0qARUPg8HQGjb4oPPMh2Zwj8E656w+qiNWiAOEO
         u5CQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHGzs/5dH2o9tVu2vZBKZ4Vo148oJGLupdUAfNCWVa5Ysw23RtH5neLaGSdriwaasLoWaS54jNDGvsgBG+@lists.linux.dev
X-Gm-Message-State: AOJu0Ywt1WeBwKU90WwVe8UWxW4YUuxAuA+zRoMIDJWZ0RrGEjfYxN03
	Jkt2UGcOOurIF4EmieOA6aWmSko8QB+KhHxEm7cMX/oEqN8ovQjjkVPDdQXeGA==
X-Google-Smtp-Source: AGHT+IHbqwR7B3eVmE9F/lWy/V/XK5+ENJpr7w8o5TU778A+kAokEQDMU/5iZGUsEydWO8j+npXxNA==
X-Received: by 2002:a05:6602:1695:b0:83b:2167:650f with SMTP id ca18e2360f4ac-83b6503964emr2926999139f.10.1730899398332;
        Wed, 06 Nov 2024 05:23:18 -0800 (PST)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.googlemail.com with ESMTPSA id ca18e2360f4ac-83b67b23aafsm313767039f.13.2024.11.06.05.23.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Nov 2024 05:23:16 -0800 (PST)
Message-ID: <6c36f9d8-b6ee-476c-9daf-feb2fd7ef15c@ieee.org>
Date: Wed, 6 Nov 2024 07:23:14 -0600
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] greybus/uart: Fix atomicity violation in
 get_serial_info()
To: Qiu-ji Chen <chenqiuji666@gmail.com>, dtwlin@gmail.com, johan@kernel.org,
 elder@kernel.org, gregkh@linuxfoundation.org
Cc: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, baijiaju1990@gmail.com
References: <20241106095819.15194-1-chenqiuji666@gmail.com>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20241106095819.15194-1-chenqiuji666@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/6/24 3:58 AM, Qiu-ji Chen wrote:
> Our static checker found a bug where set_serial_info() uses a mutex, but
> get_serial_info() does not. Fortunately, the impact of this is relatively
> minor. It doesn't cause a crash or any other serious issues. However, if a
> race condition occurs between set_serial_info() and get_serial_info(),
> there is a chance that the data returned by get_serial_info() will be
> meaningless.
> 
> Signed-off-by: Qiu-ji Chen <chenqiuji666@gmail.com>
> Fixes: 0aad5ad563c8 ("greybus/uart: switch to ->[sg]et_serial()")

Looks good.

Reviewed-by: Alex Elder <elder@riscstar.com>

PS  I was going to suggest computing the close delay and closing wait
     outside the mutex, as get_serial_info() above it does.  But it's
     minor and there's no reason to hold up your patch for that.

> ---
> V2:
> Modified the patch description to make it more concise and easier to understand.
> Changed the fix code to ensure the logic is correct.
> Thanks to Johan Hovold and Dan Carpenter for helpful suggestion.
> ---
>   drivers/staging/greybus/uart.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/staging/greybus/uart.c b/drivers/staging/greybus/uart.c
> index cdf4ebb93b10..8eab94cb06fa 100644
> --- a/drivers/staging/greybus/uart.c
> +++ b/drivers/staging/greybus/uart.c
> @@ -596,11 +596,13 @@ static int get_serial_info(struct tty_struct *tty,
>   	struct gb_tty *gb_tty = tty->driver_data;
>   
>   	ss->line = gb_tty->minor;
> +	mutex_lock(&gb_tty->port.mutex);
>   	ss->close_delay = jiffies_to_msecs(gb_tty->port.close_delay) / 10;
>   	ss->closing_wait =
>   		gb_tty->port.closing_wait == ASYNC_CLOSING_WAIT_NONE ?
>   		ASYNC_CLOSING_WAIT_NONE :
>   		jiffies_to_msecs(gb_tty->port.closing_wait) / 10;
> +	mutex_unlock(&gb_tty->port.mutex);
>   
>   	return 0;
>   }

