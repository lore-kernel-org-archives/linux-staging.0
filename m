Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2FF722FF39
	for <linux-staging@lists.linux.dev>; Mon, 17 Mar 2025 12:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742214912; cv=none; b=iv8vevmL9aiGB9IdmsGDMR8c1OxOkeedz8oo5nuF8oY/GVgycK7LPXyoM/VVN01nxauNTrf9x5WnuaIuFlQ95o4ONr9DL/uNv9ifsGBCmesAmy9T4j4HIDTX8ZLPIiiX4jyXVwGZogwBgXR7uxDy0jAMto43AXPLIjIZr42UG2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742214912; c=relaxed/simple;
	bh=2hhxamJKnEYjgJz9HCPDDBlgMOFyLWxFx7AWrATtYGo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AfVc54hy54F893zwrS2OrerWAd2/q69s1je6FCOqIAP+zGo1jg/Wbvp8gLTtUc0maouf9pywPMYKNIk7J/1ygO7WEFPI9d0QXsq/k/ozRNrOcWei3SdLA4hpgvWFPaU5cpMDtMR4E0s9DG4XXkdCWu6KBGBNuASCXTISpNygXIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=1OY6CZeW; arc=none smtp.client-ip=209.85.166.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="1OY6CZeW"
Received: by mail-io1-f52.google.com with SMTP id ca18e2360f4ac-85b4277d0fbso149660239f.0
        for <linux-staging@lists.linux.dev>; Mon, 17 Mar 2025 05:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1742214910; x=1742819710; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=00q0lF62iZBDilWeDRlriXLySeQsOfJjRaqFJoh5fG8=;
        b=1OY6CZeWRWRH7TU3p6MBT20ailLFu7Z2VBRjeTzql7f8XS2sieN45fjoqlYBDLWuhV
         4OKxk4nzxHdjkAsvr5RiCMao3uOLxJF65WL7Uc9/gGQx2HexGzSuTfecKyqlSboC6P0x
         /3JHfThhNzGMIabCzOX/uaMI+I0/RqTlvtjsb6mt9YA1eJ61SXT8c6yrwxYErqg3mJvH
         vnN/ZeuYpjR/rJ4Pd/FU9HMc4NEuO/ig6sMp0Mpon15GYlaAfR0C8iJISijYj6zsc9Yc
         0tHPAwaWvVKGiiOjZpFqbT+cZGxuNdbMPbcW72JMgynTYBqKQ1GNWecC+0E6XGWeukc3
         NuUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742214910; x=1742819710;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=00q0lF62iZBDilWeDRlriXLySeQsOfJjRaqFJoh5fG8=;
        b=wnmx6e0Ue8JWiHeevqTOlHu0AIx6pLRzxj02bzMu+Q4v8syQjk8fmcmZ1OXR1ytQWm
         u9Gm6iefgtpNx96Q4mW4HvDmxWRHvDr6PV9vn6kCjASkrf9THq0Wk5jn+WYRqMabZAgd
         MYshGAGyCyUCD6MZ/Ed5hmOTm9SSYa5IyIo9vJMSL0eT7g/Z8btRMvg/C/y9nG+uDj2B
         nU59QviGph3DbZnckuor6IFxOm5vttOwHVS7JlH6d1WrL6L+5cgt1OzncDzTX59DVRBk
         j4hGO5AVQgv+/u0899DMFbGg1aJEuPZsgLOc8tqnmiFcYMHmvdlYzczi2+dN2VbAplQB
         VPsA==
X-Forwarded-Encrypted: i=1; AJvYcCU72yLTFazJyyCWI0P1SrBXiB7f13AddolNgBG85ZbnadtrQxJ3JL8jHg/iQLRLwsOwUBQA4r4Xz1V94wxD@lists.linux.dev
X-Gm-Message-State: AOJu0YwuMN+gKKlN0xetnxmt5xZLS/XaMtX917SUtBmg9kZ3gPcqU0NF
	D2/220DoRMS6VTqK/GAOlLAIVFSP5WWMg1uD5iNDpuUGXXMHTyJ9MsInayE7INU=
X-Gm-Gg: ASbGncsqA/nrbzz8OMtKxEkQDAiDeez277pm+PyllohNN2O+UwdTBsqi6ttagjBwzsf
	TqZdZ+FMumbEpIymjFOHeLMoiI5SCtl84ciFgkboimvQKZw8iZVbeldt3XGld1bCN6RDMG7SL0q
	C5M6x3yt+yHlBVFOo9KE/21y8+sP5bu1CkvT/FBL5RQgrJ+QOBwAwJWCqSnIVhupqfNgTPjC2/Z
	wu7PnCdg5Jdn4DtttR+G8HWv8T62pJH+OyVbBbTsBLUTsiX8q+umz5zVZdQKlqvHFbejUtTuBQO
	FuM1wCrBXbP8KchrjDC3j08uvVRlFnmhSBbmqaqvHJ1oFl7jnHHSWwb4/9MACfeny8vnCyqJLKt
	YoaDibkdA
X-Google-Smtp-Source: AGHT+IHVpD7/mZoav16FzU6IphNyJrgQsnIiWZ2iM1qY0DQdugl/0lXuxuk7bx2DwfBAOuvC4HPD+Q==
X-Received: by 2002:a05:6e02:1a26:b0:3d3:f64a:38b9 with SMTP id e9e14a558f8ab-3d483a63552mr114188275ab.15.1742214909989;
        Mon, 17 Mar 2025 05:35:09 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d47a83817dsm26967285ab.61.2025.03.17.05.35.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Mar 2025 05:35:09 -0700 (PDT)
Message-ID: <abdaa38e-77e4-435e-94c4-91bc24b49b02@riscstar.com>
Date: Mon, 17 Mar 2025 07:35:08 -0500
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 22/31] tty: staging/greybus: pass tty_driver flags to
 tty_alloc_driver()
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>, gregkh@linuxfoundation.org
Cc: linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org,
 Johan Hovold <johan@kernel.org>, David Lin <dtwlin@gmail.com>,
 Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org,
 linux-staging@lists.linux.dev
References: <20250317070046.24386-1-jirislaby@kernel.org>
 <20250317070046.24386-23-jirislaby@kernel.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250317070046.24386-23-jirislaby@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/17/25 2:00 AM, Jiri Slaby (SUSE) wrote:
> tty_alloc_driver() is supposed to receive tty driver flags.

Looks like tty_alloc_driver() doesn't directly depend on the
two flags passed in this case, but this corrects the code.

Looks good to me.

Reviewed-by: Alex Elder <elder@riscstar.com>

> 
> Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
> Acked-by: Johan Hovold <johan@kernel.org>
> Cc: David Lin <dtwlin@gmail.com>
> Cc: Alex Elder <elder@kernel.org>
> Cc: greybus-dev@lists.linaro.org
> Cc: linux-staging@lists.linux.dev
> ---
>   drivers/staging/greybus/uart.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/greybus/uart.c b/drivers/staging/greybus/uart.c
> index 8eab94cb06fa..308ed1ca9947 100644
> --- a/drivers/staging/greybus/uart.c
> +++ b/drivers/staging/greybus/uart.c
> @@ -948,7 +948,8 @@ static int gb_tty_init(void)
>   {
>   	int retval = 0;
>   
> -	gb_tty_driver = tty_alloc_driver(GB_NUM_MINORS, 0);
> +	gb_tty_driver = tty_alloc_driver(GB_NUM_MINORS, TTY_DRIVER_REAL_RAW |
> +					 TTY_DRIVER_DYNAMIC_DEV);
>   	if (IS_ERR(gb_tty_driver)) {
>   		pr_err("Can not allocate tty driver\n");
>   		retval = -ENOMEM;
> @@ -961,7 +962,6 @@ static int gb_tty_init(void)
>   	gb_tty_driver->minor_start = 0;
>   	gb_tty_driver->type = TTY_DRIVER_TYPE_SERIAL;
>   	gb_tty_driver->subtype = SERIAL_TYPE_NORMAL;
> -	gb_tty_driver->flags = TTY_DRIVER_REAL_RAW | TTY_DRIVER_DYNAMIC_DEV;
>   	gb_tty_driver->init_termios = tty_std_termios;
>   	gb_tty_driver->init_termios.c_cflag = B9600 | CS8 |
>   		CREAD | HUPCL | CLOCAL;

