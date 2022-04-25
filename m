Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 844882562;
	Mon, 25 Apr 2022 15:52:53 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id p4so3348861edx.0;
        Mon, 25 Apr 2022 08:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9Oa5NtzGoFrsnzBgz2IkcumAm6ed+VSYE7BO1a3Ir24=;
        b=EigDBthRvJnsJo+9WGyQqWjg7PowmmzypMiC8CAR7LXfVN0PErUQdRx1RjTfiw4gyH
         Ee/9Tz8scBrSxmd2kS0fEhDXXWDoDEXtwtrlfZHv6FCexExa+hC+Y28nXmIh1BH4NQiZ
         38rCs5GLxbskzJ2hxkt/Idpb8OIRHdqQiNUcHNyGr09IzFxDdD6ZjtDzxbNGVScxWxA8
         gbqfgrntqMiIo1NzquxXzc6b6pQii5YbFQG3SACzOxfdYDrb1dgpTgZu8qP8qYVrJxcD
         XCqcowMpwzVkbsgRfIg8Ygnkkbq/iRf0jNQpNVZ5yWMp9ezfC1mrJWjd9sikNFP5kGHr
         ILFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9Oa5NtzGoFrsnzBgz2IkcumAm6ed+VSYE7BO1a3Ir24=;
        b=U+lT3ahzMUBtNRuGk8woVC0HPLpn4QoLuTIl3bk5Dg9mpfZKJfySaU/FSQ6je5voKC
         ymvGe/+89dqYJ+bv+Efcs2yjY3k9q2KOxBqgzSA4lnRp3i1OiyPxYGM6OAy6ENxoMD3W
         IJ1iRTmUprbXqczjF8yY1evbbxviiwmpkUpKT/X4Qxm7Y4K0YHUwOYYNa52NPOAIc3RY
         3jLTu3zACPSpD0lljIO+0NzoH6bmgNvogIrGUq3uI3rgFdoRp09i+5KzSLIyWhLhwn7T
         ChCAI4Bk8vPrC0sRqjvzJyadJNR/0XSjxzA9oRGV/Vb7HlQKgn98POmq9I6Bg7QPmBSC
         3aiw==
X-Gm-Message-State: AOAM530fFO+Kuzd5ueZ2RUNdBtwkc/VBEwrip5DzY5qUhSGOqPH6Gu8k
	Z/6xYE5gfZOFuZD6JR+byrg=
X-Google-Smtp-Source: ABdhPJzY0KqwmNprJw4wgl5ETDVJprVLMo9vqPy+8A0f/235e2cgQsITwXEEgGimRqQZseTw0/tsbg==
X-Received: by 2002:a05:6402:5189:b0:425:d7ca:caa4 with SMTP id q9-20020a056402518900b00425d7cacaa4mr10535349edd.177.1650901971712;
        Mon, 25 Apr 2022 08:52:51 -0700 (PDT)
Received: from kista.localnet (cpe-86-58-32-107.static.triera.net. [86.58.32.107])
        by smtp.gmail.com with ESMTPSA id d6-20020a170906304600b006ef5da1b1besm3739347ejd.221.2022.04.25.08.52.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Apr 2022 08:52:51 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: mripard@kernel.org, Ian Cowan <ian@linux.cowan.aero>
Cc: paul.kocialkowski@bootlin.com, mchehab@kernel.org, gregkh@linuxfoundation.org, wens@csie.org, samuel@sholland.org, linux-media@vger.kernel.org, linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, ian@linux.cowan.aero
Subject: Re: [PATCH] staging: sunxi: cedrus: centralize cedrus_open exit
Date: Mon, 25 Apr 2022 17:52:50 +0200
Message-ID: <22617338.6Emhk5qWAg@kista>
In-Reply-To: <20220423180111.91602-1-ian@linux.cowan.aero>
References: <20220423180111.91602-1-ian@linux.cowan.aero>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Ian,

Dne sobota, 23. april 2022 ob 20:01:11 CEST je Ian Cowan napisal(a):
> Refactor the cedrus_open() function so that there is only one exit to
> the function instead of 2. This prevents a future change from preventing
> the mutex from being unlocked after a successful exit.
> 
> Signed-off-by: Ian Cowan <ian@linux.cowan.aero>

If this patch would be part of series and "future" would mean next patch, I 
would be ok with that. However, in current form I don't see any benefit in 
changing it. Doing another hop lessens readability IMO. Let us worry about the 
future when/if it comes.

Best regards,
Jernej

> ---
>  drivers/staging/media/sunxi/cedrus/cedrus.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/staging/
media/sunxi/cedrus/cedrus.c
> index 68b3dcdb5df3..5236d9e4f4e8 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
> @@ -348,14 +348,14 @@ static int cedrus_open(struct file *file)
>  
>  	v4l2_fh_add(&ctx->fh);
>  
> -	mutex_unlock(&dev->dev_mutex);
> -
> -	return 0;
> +	ret = 0;
> +	goto succ_unlock;
>  
>  err_ctrls:
>  	v4l2_ctrl_handler_free(&ctx->hdl);
>  err_free:
>  	kfree(ctx);
> +succ_unlock:
>  	mutex_unlock(&dev->dev_mutex);
>  
>  	return ret;
> -- 
> 2.35.1
> 
> 


