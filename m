Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF8ED372684
	for <linux-staging@lists.linux.dev>; Mon, 16 Mar 2026 08:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773650037; cv=none; b=m3JDXqnjGXJgYywvpYEP1d+tLOrTd1xCn9lw4NWLeUXm3Qkq3VWL1+F2hTA3TX35ZcB2+m7WkwXgpls7xrJunJ/NCkdZphOMsPJEVk1Ih7zTPj3tofuoaHH0GFz6rmqqaLPS2V/lFVNv7fSHqsJLoTlrhC1aLmlgVtQRe0hQQ0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773650037; c=relaxed/simple;
	bh=lHrB/4hDHRhFds72r4s9TnjVlNG6rrpTgu9hqoYz6+0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kkIDkdPdxx94NjRlCvUghBUOL0mvLkWRKn4N/STcMMEnW7zxvZ/BQPDIesyUmxC/A3NnG+eebtZ6qaxlmRvuRJMjVchYG7Xk0f4R7u8zAj/TIxr7MJhRCUWSxoaLoEEfufQ3M7X6hKJO058LuvmasR4khfhdvEzrxivn7h6fpsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LIdztmrC; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LIdztmrC"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-485410a0a8aso39374695e9.2
        for <linux-staging@lists.linux.dev>; Mon, 16 Mar 2026 01:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773650034; x=1774254834; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lsgV9c/6tvdEl8DRlHGHmrjfY2sUr7937TDTOUo3+rQ=;
        b=LIdztmrCiju4sJT2sjD644gV8VjZlGo/bP8dKHor7bxgw/lGMbKH30lsfRGVLYKzN1
         9h4B/BaIpa43mO1hXEmZI5vBFKxaGR+zP5WK6RjLuluSztQTqF/0zO3i++ccwVf0X540
         TBygDQ1Ds9IMLvD2ViYwyOQxuUFrZTFsP42+NJofHy0MYz1gtJbzb93pVqQIvvuwzTCl
         4IJDB/AjOGjRVQWppF1mwfzqxRAn9iyrFnabgzOUDGqW3Pa0aprM0X+WvHPGWuk0U4bf
         qsCirazSUW5sAj6GjlHzMK8R0hhykyu4chjwXZhzywbQ1TND2q3euH5y/li0Ea3x1JqD
         /s3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773650034; x=1774254834;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lsgV9c/6tvdEl8DRlHGHmrjfY2sUr7937TDTOUo3+rQ=;
        b=IfwQzbgt6csQ2SwMW3BpLkVAlrt1cYtFV79Z/he7fasrZEHs5BA+A/HtUDTbgxD0WX
         Ja4z9/mKaXrEH/qD0l6YxwLA39s6WG4gpTIhg37MrfBpYEgCuoq/xlJI1M7fD9yZXpHm
         38Cs0eVIwkAJBNRQrTFynwUhPRC4FYIUI2IyTxNUerdBxO38Vj6W6U8SOymTcAKi2XyD
         6gV2Ihq7umZcAi0XjgnFb+CbcQsaDCtRwrKyN9oiPujze5tzNp6NpQsMxM9u8iibMwB6
         3hT+wMoAu1z9XOFd9txCqlJb97aDzTZYqtYbC4ouj22Sk3q49+gyKngXRSJRDDNiXR0+
         XQzg==
X-Forwarded-Encrypted: i=1; AJvYcCVL+JB/Q5EhzVWrqNJxK1nR9dXrxT7R+5AJWGQ7UmaR9cHowAdMSjjKatypQMCLqXYSgbjk1XH89rL3kY/E@lists.linux.dev
X-Gm-Message-State: AOJu0Yz6Lo/uJsmzDcjdy2AnzSynH4rA5tEgy8ly6GTqflCKATWxdoBX
	8SWHYFZphqsBJge8wvCXr34qkEdpSFuVB15w5YjBdz5tyPkE02/PmZM/cZqvenJ0IW0=
X-Gm-Gg: ATEYQzzOoxxc4Mja7AyzNycXZAzelK2p2chbLmyWsX+Astk8UYwS5ntzYDSbozXxp7/
	rCqm0mm5H2IL82OnswADOyclrqrYghOyQYmKFrSlyPhuYhhOzGqIhiyDw8hlfCad1bxw15sTJ39
	f8AmQ5dnJMGj0mfqvU0IYSYdpSREC1yUFoocs89yiyPxAjMdBzyZxKfof9UAnMQa0KLvQdBW5oN
	UbpfKfmUlS9D6W3POCJHl2Eyw6taGBvS7oLO97cqUZkZ91MtTEULvxrhHpSdo+A77a0kexfvTRU
	tWBzlO3ds3/0cgYRa0iKBhAeaoKvfyXRG+Y7EDM9SM+MI3my0Ayj0Lq6m51yKKXtt267wPQdhrL
	LJpoa7TgRffStlRrWD4W2+dcB4kJHrMBemqogRa7IQd9eSkSyL9+drkquoqCgYHKtoVdGDaB0YJ
	qX/u448fUb7d/+C1SeC0uUvLcsgwfaGSaq1KVp8u8=
X-Received: by 2002:a05:600c:3590:b0:485:3b34:2f61 with SMTP id 5b1f17b1804b1-485566c9464mr230364565e9.7.1773650034267;
        Mon, 16 Mar 2026 01:33:54 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4855777bd37sm140232655e9.3.2026.03.16.01.33.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 01:33:53 -0700 (PDT)
Date: Mon, 16 Mar 2026 11:33:50 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Azamat Rakhim <azamatrakhim8@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] staging: rtl8723bs: remove unused
 rtl8192c_translate_rx_signal_stuff declaration
Message-ID: <abfAbpPiiOYWF1Ug@stanley.mountain>
References: <20260313190658.13525-1-azamatrakhim8@gmail.com>
 <20260313190658.13525-2-azamatrakhim8@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260313190658.13525-2-azamatrakhim8@gmail.com>

On Sat, Mar 14, 2026 at 12:06:58AM +0500, Azamat Rakhim wrote:
> The function rtl8192c_translate_rx_signal_stuff is declared in rtl8192c_recv.h
> but never defined or called anywhere in the driver
> 
> Signed-off-by: Azamat Rakhim <azamatrakhim8@gmail.com>
> ---
>  drivers/staging/rtl8723bs/include/rtl8192c_recv.h | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8723bs/include/rtl8192c_recv.h b/drivers/staging/rtl8723bs/include/rtl8192c_recv.h
> index abc7a7c418af..1a04c3454b80 100644
> --- a/drivers/staging/rtl8723bs/include/rtl8192c_recv.h
> +++ b/drivers/staging/rtl8723bs/include/rtl8192c_recv.h
> @@ -34,6 +34,5 @@ struct phy_stat {
>  /*  Rx smooth factor */
>  #define	Rx_Smooth_Factor (20)
>  
> -void rtl8192c_query_rx_desc_status(union recv_frame *precvframe, struct recv_stat *pdesc);
>  

Need to delete the blank line as well.

regards,
dan carpenter

