Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B41EA4A0E
	for <linux-staging@lists.linux.dev>; Tue, 27 Sep 2022 18:19:11 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id z97so14283760ede.8
        for <linux-staging@lists.linux.dev>; Tue, 27 Sep 2022 11:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=ZVANHvzUU8KJ3ZS8cBYERLva/Af0xAUYF76lhI7wYrE=;
        b=BoHowOX+D3tZLwGhG/06ZPgcDKDZv3kLKRompregLvvhfAH1QWQjX6rCweQ2LZw9Wd
         75mgpps+sTgau/njSQA/04ZBDi0z83A91SuyD2btjUAjIVPmJpckZ1Da8GPRKonGQcUU
         +0jTcSV6gxKuag/Kiw8skl3eqSMOZqx4AaJsqXrrcSL2fXEfHLyg93EvPC5ThyiGrSC/
         dmZzNSO+U1x+XdrkSA/v0n23c8cC0PE+suq5Kk6S8eK/c93ymdBEbCzn0j2AgjWRV4OE
         8nN2W5+27beIDgA0hZM/mCvF1/4xUak17+wABhrIj+UUXzVc1SqfEhyLLtH4Li7O3kRi
         YlwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=ZVANHvzUU8KJ3ZS8cBYERLva/Af0xAUYF76lhI7wYrE=;
        b=IrMe8nMKiBx80SuaXz/21GMU5NUJ6zTnHso25ljDE4SxYQ1MYSArpcWbpbp0S27HkK
         20IV7vjcTZITCkB2zUGBpru62T5m+I3JcNZF6mLOYB2wU7PAYoOyPNVoYfzHVDI4aoEC
         eULm/Cr8xOYMNCvNf5LqvDVNQPeAsnPHpncdquLKeOOAnlWj1AtXXKmxvgWJnqaGnbyY
         zqnN5hRb85kGqvSRvWcIqA4JKO/VZTdo7toMJRPFygT85+mr+Ei3AANajqOfPH1P+4QV
         TZNtHu4w0qF/GqqYno0YIRphnfP0N8q/5yMpT8Gd0g4tlMsPk7BvlMIYQvez298oddnh
         kJpg==
X-Gm-Message-State: ACrzQf1PpGqFlCzIpnX+F+4WmIQZSEahCOzWeMGCSX2ArRKR10+/nJ70
	HPO8BrsmWuL9WTlHaRhWtOo=
X-Google-Smtp-Source: AMsMyM7sxOWrJ/Nemw5Lh9Jjcd3BT16x/jmqFfLXeyeDsf6sXy0ev8NCSJqinjqGGHkC61silz4TbA==
X-Received: by 2002:a05:6402:370a:b0:456:d006:6948 with SMTP id ek10-20020a056402370a00b00456d0066948mr22610869edb.90.1664302749830;
        Tue, 27 Sep 2022 11:19:09 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57ba2cf5.dip0.t-ipconnect.de. [87.186.44.245])
        by smtp.gmail.com with ESMTPSA id sc28-20020a1709078a1c00b007801ce34311sm1179602ejc.19.2022.09.27.11.19.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Sep 2022 11:19:09 -0700 (PDT)
Date: Tue, 27 Sep 2022 20:19:07 +0200
From: philipp hortmann <philipp.g.hortmann@gmail.com>
To: Shang XiaoJing <shangxiaojing@huawei.com>
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk, paskripkin@gmail.com,
	gregkh@linuxfoundation.org, martin@kaiser.cx,
	straube.linux@gmail.com, marcus.yu.56@gmail.com, makvihas@gmail.com,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH -next] staging: r8188eu: Use skb_put_data() instead of
 skb_put/memcpy pair
Message-ID: <20220927181907.GA16468@matrix-ESPRIMO-P710>
References: <20220927024050.13556-1-shangxiaojing@huawei.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220927024050.13556-1-shangxiaojing@huawei.com>

On Tue, Sep 27, 2022 at 10:40:50AM +0800, Shang XiaoJing wrote:
> Use skb_put_data() instead of skb_put() and memcpy(), which is shorter
> and clear. Drop the tmp variable that is not needed any more.
> 
> Signed-off-by: Shang XiaoJing <shangxiaojing@huawei.com>
> ---
>  drivers/staging/r8188eu/core/rtw_recv.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/core/rtw_recv.c b/drivers/staging/r8188eu/core/rtw_recv.c
> index 353c7468367a..44f92ce63440 100644
> --- a/drivers/staging/r8188eu/core/rtw_recv.c
> +++ b/drivers/staging/r8188eu/core/rtw_recv.c
> @@ -1412,7 +1412,6 @@ static int amsdu_to_msdu(struct adapter *padapter, struct recv_frame *prframe)
>  	u8	nr_subframes, i;
>  	unsigned char *pdata;
>  	struct rx_pkt_attrib *pattrib;
> -	unsigned char *data_ptr;
>  	struct sk_buff *sub_skb, *subframes[MAX_SUBFRAME_COUNT];
>  
>  	struct recv_priv *precvpriv = &padapter->recvpriv;
> @@ -1447,8 +1446,7 @@ static int amsdu_to_msdu(struct adapter *padapter, struct recv_frame *prframe)
>  		sub_skb = dev_alloc_skb(nSubframe_Length + 12);
>  		if (sub_skb) {
>  			skb_reserve(sub_skb, 12);
> -			data_ptr = (u8 *)skb_put(sub_skb, nSubframe_Length);
> -			memcpy(data_ptr, pdata, nSubframe_Length);
> +			skb_put_data(sub_skb, pdata, nSubframe_Length);
>  		} else {
>  			sub_skb = skb_clone(prframe->pkt, GFP_ATOMIC);
>  			if (sub_skb) {
> -- 
> 2.17.1
>
Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com> # Edimax N150
