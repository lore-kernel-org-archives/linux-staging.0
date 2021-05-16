Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43E2570
	for <linux-staging@lists.linux.dev>; Sun, 16 May 2021 07:27:27 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id r11so3118128edt.13
        for <linux-staging@lists.linux.dev>; Sun, 16 May 2021 00:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=A0tTgMY8zDhsLM5hlWhtg9vpMN4c0fMAEAyObepaAV4=;
        b=M5xxzZSaqywHzeORxsywgo7EUwWSyN6Jfx5XgFr+PWQzYoaI33gONeeBCjkvRE7at1
         sp2BuDpaBxypz5Sh4oho1YPNiBaLJjnRJacVHxCG6ArmoqT6oHmN6nzG8+VPJwkYfO2o
         pDP9B4USno70YFwoJOr0YC5bw7zb51CTEDoOPqpC2E7q4JP2GFgLQK0RP+XE5HCSMuJd
         WPra3GBmIZPHNKApI5/3ectyB18JddluCrUGAAed5Uaon5eFLRIe4JJeEkOVE1F+CoR2
         otVzDSOXMyz5xAXSLLzI5AZ/wtDroFT1Q4M4jXlwxPkUplgxy3kZYjFnKAhU6SyGVhCH
         Pr7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=A0tTgMY8zDhsLM5hlWhtg9vpMN4c0fMAEAyObepaAV4=;
        b=Gcj0bhcNUc/GvVaHx+MIMiKcQ8T1bbxQrkUYIaq7j2kpzNS89jXkagCKn/i6+p2PLj
         MX6lzUX7WW8hPjd4BuYiMavxmc5o9nGmKVpvIN28+8Xe09+N1gHKI9D30HFjd8A1OIj0
         LBnk9RQFcaAoBn7S8PYIWadoFEuKc102/d9cj5tHTP+Yz3u7J8DeZ5e29RViM+mlB+cm
         vovCK1YUtBwGy78EnSIkhkSApv68vtOCmqfa+n7kz/XOABLQybyOmLbNSL1MacDXvOkI
         tTTy9zZCd19UnNWUddp3uUyXZHwxpUZ2tRTgWfOn0/3gPOUVCU+dmbuhH5y6K25m7wWq
         3G7w==
X-Gm-Message-State: AOAM530XjOeIlfg7wUqDgDZMS2Y4tukW53flTwHbQ2NIijW0Dxj7pFco
	T/vbB8ZU5GzFE3l5/UMZA5KIbK+U4EH8DA==
X-Google-Smtp-Source: ABdhPJxzu0E7/pM6uO/VvZoZ6XdYWocQ1XLWuJtf3meJjbQ9AREcuuCk2Y6uc8GRnHUR/BAjEuLf9Q==
X-Received: by 2002:aa7:d58b:: with SMTP id r11mr21487730edq.231.1621150045869;
        Sun, 16 May 2021 00:27:25 -0700 (PDT)
Received: from agape.jhs ([5.171.80.208])
        by smtp.gmail.com with ESMTPSA id by20sm6441559ejc.74.2021.05.16.00.27.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 May 2021 00:27:25 -0700 (PDT)
Date: Sun, 16 May 2021 09:27:23 +0200
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: Stefan Wahren <stefan.wahren@i2se.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH 01/20] staging: vchiq_core: fix return type of
 vchiq_init_state
Message-ID: <20210516072722.GA1410@agape.jhs>
References: <1621105859-30215-1-git-send-email-stefan.wahren@i2se.com>
 <1621105859-30215-2-git-send-email-stefan.wahren@i2se.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1621105859-30215-2-git-send-email-stefan.wahren@i2se.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Stefan,

On Sat, May 15, 2021 at 09:10:40PM +0200, Stefan Wahren wrote:
> Recent commit "staging: vchiq_core: drop vchiq_status from vchiq_init_state"
> missed to change the return type in the definition. Let's fix this now.

if this patch fixes something that a previous commit broke,
it's better adding Fixes: tag

> 
> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
> ---
>  drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
> index ff85327..9b6c626 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
> @@ -2157,7 +2157,7 @@ vchiq_init_slots(void *mem_base, int mem_size)
>  	return slot_zero;
>  }
>  
> -enum vchiq_status
> +int
>  vchiq_init_state(struct vchiq_state *state, struct vchiq_slot_zero *slot_zero)
>  {
>  	struct vchiq_shared_state *local;
> -- 
> 2.7.4
> 
> 

thank you,

fabio
