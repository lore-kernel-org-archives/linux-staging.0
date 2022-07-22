Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0971B15A4
	for <linux-staging@lists.linux.dev>; Fri, 22 Jul 2022 04:54:51 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id ez10so6535940ejc.13
        for <linux-staging@lists.linux.dev>; Thu, 21 Jul 2022 21:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=BAspDEPCtXjW6B387M1BEwowk25i6EDgUSDlagLj1Hk=;
        b=LGnXKOwviOg2k81AVWVpNLFmzOUc5v70JFyf7x43iWW2Hh0JUjh2YK4xmryjna91dF
         ZucFalVj9ZG/7e8avCiu9XE5b1O4rX3UEGx3wj4uIj4g1OAX5d2sfDZtzQz2WADF0GI/
         SjnazoFgrEmEbXuZM/h2zjjr+X61q+OwGTwmoXFevCYp5gWTKHudLHabEJGW8wcwmhtr
         35Dbfu7NAaLJ/zDMp9nbpTvnN/0KQYpFtK5r8LhLiqFjxSZUS+8PmmIbHo/URaFT6mnX
         qnp7wwq00SnFpHD/3ZIQQF0EAULCUTJYdaR1sAr5RsmwCA3piXhbaLj3R1kr80JwxU1D
         B3qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=BAspDEPCtXjW6B387M1BEwowk25i6EDgUSDlagLj1Hk=;
        b=mT4f4eKtgi3+VUWTBhiYJzGO+x7RZq9RrzDxR8OFEqVSXaI443ILLBOEWrJ1mWyzSH
         YXBNUWt3tNsHsFRl2aKb7gOLneRst9TR7/TSSaBu0L1IQdfcd16EOgg6c1Yr5mmgDU56
         xElzxzUd5SHqCFp88j9uZL2AJZNdsgLclRU2GBexgwI9YateF1bdLEG+nAwUS79dlOoD
         pKZHJkXZPxMNcFJi9x7ZKTY5lQXvmrEBDNMoQ5HfTZvzOU/L8Dg8ERl1bPVqoiw9NmbM
         UOsu4Rl4tcHIgVvQVGzXtmgXL79UCtqv4D1XxY3Nb4mLrerV8b+8ItGE0tzInRy5g3/5
         ZENg==
X-Gm-Message-State: AJIora/6JA169oElqIv2BpzMxPmwZxxrYj5fgEPBE1c03LBfSwVJ8dnA
	850Cn/S+QKl8qhKdufzS8iw6ouqW2Pw=
X-Google-Smtp-Source: AGRyM1sHXShGR6o1qcwrokXbBl+lV1+M3JghaQXqCevUiOPwb4M9Sy+r3nydB9pqTt5VqYROK9/k3A==
X-Received: by 2002:a17:907:7290:b0:72b:3799:624c with SMTP id dt16-20020a170907729000b0072b3799624cmr1648824ejc.108.1658465690190;
        Thu, 21 Jul 2022 21:54:50 -0700 (PDT)
Received: from ?IPV6:2003:c7:8f2e:6979:bc71:385a:5363:16f9? (p200300c78f2e6979bc71385a536316f9.dip0.t-ipconnect.de. [2003:c7:8f2e:6979:bc71:385a:5363:16f9])
        by smtp.gmail.com with ESMTPSA id c1-20020a17090618a100b0072321c99b78sm1560487ejf.57.2022.07.21.21.54.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Jul 2022 21:54:49 -0700 (PDT)
Message-ID: <11b4ef15-9fb5-2c40-90ae-11ee434bbea3@gmail.com>
Date: Fri, 22 Jul 2022 06:54:48 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] media: staging: media: zoran: Removed braces for single
 statement block
Content-Language: en-US
To: Abhijeet Srivastava <abhijeet.srivastava2308@gmail.com>
Cc: Corentin Labbe <clabbe@baylibre.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 mjpeg-users@lists.sourceforge.net, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20220721150055.52096-1-abhijeet.srivastava2308@gmail.com>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20220721150055.52096-1-abhijeet.srivastava2308@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/21/22 17:00, Abhijeet Srivastava wrote:
> Warning found by checkpatch.pl script.
> 
> Signed-off-by: Abhijeet Srivastava <abhijeet.srivastava2308@gmail.com>
> ---
>   drivers/staging/media/zoran/zoran_card.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/zoran/zoran_card.c b/drivers/staging/media/zoran/zoran_card.c
> index 26f978a1cc72..0c138d47d0c3 100644
> --- a/drivers/staging/media/zoran/zoran_card.c
> +++ b/drivers/staging/media/zoran/zoran_card.c
> @@ -1038,9 +1038,9 @@ static int zr36057_init(struct zoran *zr)
>   	zr->stat_com = dma_alloc_coherent(&zr->pci_dev->dev,
>   					  BUZ_NUM_STAT_COM * sizeof(u32),
>   					  &zr->p_sc, GFP_KERNEL);
> -	if (!zr->stat_com) {
> +	if (!zr->stat_com)
>   		return -ENOMEM;
> -	}
> +
>   	for (j = 0; j < BUZ_NUM_STAT_COM; j++)
>   		zr->stat_com[j] = cpu_to_le32(1); /* mark as unavailable to zr36057 */
>   


Why does the subject line start with "media:" The subsystem is 
"staging:" so the subject should start with "staging: media: ..."

I have no clue if this is accepted.

Regards,

Philipp
