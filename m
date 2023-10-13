Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F185E101EF;
	Fri, 13 Oct 2023 07:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bQi0aeXN"
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-1e58a522e41so976932fac.2;
        Fri, 13 Oct 2023 00:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697183426; x=1697788226; darn=lists.linux.dev;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=23xMJA3iDlwbznOB55jgMQYEBmFUfU91Z5L7TT7aK1g=;
        b=bQi0aeXN0kpbtsezJX2bbiP76yd8Y5MBHBGyDj1AFOE+YeicXXz0cmPbxPRVjKkxOa
         v3/c8iZrqxfCRPf9lV7JQ4c7eytAgb34KmVldg6XphrVtZLOsO1wN9+8D2HjfL//UIPW
         x5bMiiKRVsGCQ7EQ8PLUtx+toe1umJ1RQa7RSuMqDU4ASr+5FRLexOP7DJcswDsGtHtC
         hb/ieF8NkowL9PGq5WsT2f5Mf3EvwaLsoH5E7idi+7mEdUZ/wZV8V03TLHZlom9cXBwr
         GyLz/V68GW8SFkaKKVG79nm7D2O5a1lcjqrGls6pQTz8XZea5M30ISdDAdhc8pyGsqqj
         nlJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697183426; x=1697788226;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=23xMJA3iDlwbznOB55jgMQYEBmFUfU91Z5L7TT7aK1g=;
        b=bQMy6gJ+lzirVZlWtAgSNnFDKUP+gCdsMw+FfMZwBgZqn2LldoshUSK/9rtCg/auz0
         oVvWjkZPpTFg6sHAuhcxRQb+ZZU3jDmXS5CK4nPz70KKfnotBglLLeukImhuv2ZFH0lF
         ljar/5KT5jI1yoc7IYph7Zdda15A9dRgviz4wNHZaq2qPYDL5K80O3vTqW5eRAnMU8DJ
         d7SHMdz8U93Q1f9usSIU5rSM/okfAKxH0/CwRbx4j+weGfn2PzzKC1+KhxmZpk3hJy1E
         ntGKZ15XJbGO674EPOMrlBJz7pwfsAuBd57uWy8eA/ZqJ19hTDG4rgiEwG9rK2mofi2E
         ishA==
X-Gm-Message-State: AOJu0YxvrO2svY/GDK9D4hEU2FiypCuDHVFmYqHSKY4NZPnAw4qMob9K
	0mOi+J20UciFRNDbeXgrRIU=
X-Google-Smtp-Source: AGHT+IFx77SK6499gf9gmOkZuF2u14+xaVgoQ45920nZ5DnJubom0bQ/lTdbAKlCzZ9CHIA5VQlcqg==
X-Received: by 2002:a05:6870:b79c:b0:1e9:dd69:2fba with SMTP id ed28-20020a056870b79c00b001e9dd692fbamr1161326oab.9.1697183425874;
        Fri, 13 Oct 2023 00:50:25 -0700 (PDT)
Received: from Negi ([68.181.16.134])
        by smtp.gmail.com with ESMTPSA id y8-20020aa793c8000000b006b2677d3684sm740656pff.206.2023.10.13.00.50.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 00:50:25 -0700 (PDT)
Date: Fri, 13 Oct 2023 00:50:24 -0700
From: Soumya Negi <soumya.negi97@gmail.com>
To: Jonathan Kim <jonathankim@gctsemi.com>, Dean ahn <deanahn@gctsemi.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: outreachy@lists.linux.dev, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] tty: gdm724x: Add blank line after declaration
Message-ID: <20231013075024.GD13814@Negi>
References: <20231013060202.13419-1-soumya.negi97@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231013060202.13419-1-soumya.negi97@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)

On Thu, Oct 12, 2023 at 11:01:57PM -0700, Soumya Negi wrote:
> Fix WARNING: Missing a blank line after declarations
> Issue found by checkpatch.pl
> 
> Signed-off-by: Soumya Negi <soumya.negi97@gmail.com>
> ---
>  drivers/staging/gdm724x/gdm_tty.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/staging/gdm724x/gdm_tty.c b/drivers/staging/gdm724x/gdm_tty.c
> index 4e5cac76db58..0c61eaff6122 100644
> --- a/drivers/staging/gdm724x/gdm_tty.c
> +++ b/drivers/staging/gdm724x/gdm_tty.c
> @@ -160,6 +160,7 @@ static ssize_t gdm_tty_write(struct tty_struct *tty, const u8 *buf, size_t len)
>  
>  	while (remain) {
>  		size_t sending_len = min_t(size_t, MUX_TX_MAX_SIZE, remain);
> +
>  		gdm->tty_dev->send_func(gdm->tty_dev->priv_dev,
>  					(void *)(buf + sent_len),
>  					sending_len,
> -- 

Please ignore this patch. It must be sent as part of a patch set as
suggested by Julia. I'll be doing that shortly.

> 2.42.0
> 
