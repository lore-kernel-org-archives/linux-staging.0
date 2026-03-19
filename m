Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 879FF4A07
	for <linux-staging@lists.linux.dev>; Thu, 19 Mar 2026 07:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773907133; cv=none; b=aVi0ISPCqTh+Q9BWf0Welk1JuISbYsWrefBj+cEinB6kQ8NZeOA/BB/FajLSWkA9rD+pXdW07uxu4JS+DHE0JCIJM6+tub1b7Sh+dcGovUqwGcciEsyO6NNMtbQpbXbFHTf7hLiQZzhuo5MQEcoG/n+VWQkMZJhf4Uop+C7oC+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773907133; c=relaxed/simple;
	bh=gXnB9rJQh5XurpsGkIQqpGPse2nqLdGCPUwu0JaXUpw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IBOR5mXI6+IVfswsMkSbD+01EST+ZpdyZdnOAkt8/1+P0Uw2D4lBxg5/foqm4RPk0cU1xH1xmKA2ABrLVDfPenVuCFPPHpLzjeCtTSKH+GZSq9cQ519kSGxWClvF0196go5GMYaJ+6elBLQKhIJuCu4qc8IiTLY0W06l3Qm2weY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mS+ks9Pn; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mS+ks9Pn"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-439c6fc2910so391166f8f.0
        for <linux-staging@lists.linux.dev>; Thu, 19 Mar 2026 00:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773907130; x=1774511930; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2kB0mxxv7Bfgii9SpWshoNf7rclVYOnoBd7uWBzC6EQ=;
        b=mS+ks9PnOYTgAPeeaZnkSXMNq+KZSmJTtH406Zc5iSl+N3J9h7E6peAda2XnkxiH+d
         tBcz+Schoe7Sge7egV35mlsJwZP+1sg8+QNgMASss0gUeBf7DaKyZjMONBzYnNuTiau1
         udv+qWOUWcpwa919PGRkzVeROop7Loe+m6Rfn0T03pZ3AOTu2PO5YdsbrHP2o7J+PlzI
         ryJCEKududoOWWJ1BRroWeo96GqrmEy/oOkoYzLi+CJlqVlpaZbZLW+qN4/MYk9m3pNM
         ghKWIv7t1Oc8hx0CEvjsHQCqsNcF2hPN3LwJMZFe2kaz4GZbTzP+xDxMVcCHycjjadBh
         h5Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773907130; x=1774511930;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2kB0mxxv7Bfgii9SpWshoNf7rclVYOnoBd7uWBzC6EQ=;
        b=CrhgQYP+Cb3PAk32OHBEFomz9aRnCC9dXMxolsAfFuolajhaJobY8OA8gr7JTig6J7
         Afcw0cBlC/50Syki13InzERfUZ8y42M3fPftKA7MTd+OLb6EfO78EkBqMOzNOybWhA+J
         L2IqGjtpPpWPjBHxOHxHsRYfFT4P+zQtI/y/vIs1Lk8Koe2y9PEB3iJ85xYqszjaS1CQ
         /URwyvYTiCwXCwuOKBp04zmS2MxySVIRtQVw3/zsjvUPXcLo+QANbel/rWuWOTEn1dyS
         h/D8/YAUu88+DGglKBEPW3ntMiW4tC/N+KWbhqZPcn6HBQuQCLAmydgpDU8F7vT9/3NP
         sPxg==
X-Forwarded-Encrypted: i=1; AJvYcCVfGPzEtuLUH2mQ6EjEEUHWyl7souaX/ZdblrmSJW4iqLBzYjaQs8jjwy5RhEoULI9m+/L2QGK2F+2ahZxC@lists.linux.dev
X-Gm-Message-State: AOJu0YwRPT754g1OfDEibDUu2dvjdDxZ/6EJyOLha9nwGDsNiYDVgTv7
	ciD1KGCWa+pauZEvCr3SOBRXr6ZLbXNFeil1YaB/CAUFCgbiKhBgLxm1e9ZKr2cGPQI=
X-Gm-Gg: ATEYQzzmaZ4q6myODb3MBWVyNuY8lwvv4T9AsqhJje8i/ETTIB3sqH9PkjMYUzFsNOq
	Qz2JDweS3LSBJjYGgo5q18Q/vFcLftF2hPUvYNDz4p8rSU7i27sSM+FM+MWd91/q5Mair1poo3W
	Fc2V7bd7PAf7TGpkdTDqY9f/+hcxAn86k8wPEkeQ4jXQJyMPMwJl4cGtuFy/gOW1JDlKXd1pY2d
	oxCwC+HRTRQKRBuDXHTXwfbxB0SwR5dqd8nptAW3FOe3o+Z18q+tDdSq9FAnbHM59dqx4p9+5nB
	DZZCUpvnkitrUiJxLdER5ScGeVqWL2T95arlw6wF0iIOnibUJHglnVw37lDideI/qhEN+FNf6ul
	Ai8MS5cgkoVP45bvDprOt9z8jc7rywfo69vHYUBhbIbVTfhNVEmcYtnCJVRTlI4mXIXdXxMec7X
	UdozMOA8hoHR5hMLt5FkH+06T0qb5+
X-Received: by 2002:a5d:588a:0:b0:43a:4e5:73b0 with SMTP id ffacd0b85a97d-43b527a925emr11186842f8f.17.1773907129702;
        Thu, 19 Mar 2026 00:58:49 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b51852a64sm14284186f8f.14.2026.03.19.00.58.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 00:58:48 -0700 (PDT)
Date: Thu, 19 Mar 2026 10:58:45 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Lin YuChen <starpt.official@gmail.com>
Cc: gregkh@linuxfoundation.org, straube.linux@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: refactor rtw_aes_decrypt() to reduce
 nesting
Message-ID: <abustSUaXYf70Js1@stanley.mountain>
References: <20260317165149.16751-1-starpt.official@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260317165149.16751-1-starpt.official@gmail.com>

What often happens is that I write a review email and then decide not
to send it.  I probably would have merged your patch as-is, but since
Greg has decided not to then we as well fix this as well.

On Wed, Mar 18, 2026 at 12:51:49AM +0800, Lin YuChen wrote:
> Improve code readability by refactoring rtw_aes_decrypt() to use
> guard clauses and early exits. This reduces the maximum indentation
> level and flattens the logic flow for key assignment and decryption.
> 
> Signed-off-by: Lin YuChen <starpt.official@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_security.c | 91 ++++++++++---------
>  1 file changed, 46 insertions(+), 45 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
> index b489babe7432..9229e0a1c792 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_security.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_security.c
> @@ -1213,69 +1213,70 @@ u32 rtw_aes_decrypt(struct adapter *padapter, u8 *precvframe)
>  
>  	pframe = (unsigned char *)((union recv_frame *)precvframe)->u.hdr.rx_data;
>  	/* 4 start to encrypt each fragment */
> -	if (prxattrib->encrypt == _AES_) {
> -		stainfo = rtw_get_stainfo(&padapter->stapriv, &prxattrib->ta[0]);
> -		if (stainfo) {
> -			if (is_multicast_ether_addr(prxattrib->ra)) {
> -				static unsigned long start;
> -				static u32 no_gkey_bc_cnt;
> -				static u32 no_gkey_mc_cnt;
> +	if (prxattrib->encrypt != _AES_)
> +		goto exit;

Just return directly.  When I'm reading this patch, I have to think
"Oh, what does goto exit do?"  So I scroll down to the bottom, and I
see it returns res.  So then I scroll up here and I think "what is
res?" but it's not included in the email.  Compare that to just doing
"return _SUCCESS;" where anyone can instantly see what it does without
scrolling up and down and changing to a different window.

>  
> -				if (!psecuritypriv->binstallGrpkey) {
> -					res = _FAIL;
> +	stainfo = rtw_get_stainfo(&padapter->stapriv, &prxattrib->ta[0]);
> +	if (!stainfo) {
> +		res = _FAIL;
> +		goto exit;
> +	}

Same.  Just return directly.

> +	if (is_multicast_ether_addr(prxattrib->ra)) {
> +		static unsigned long start;
> +		static u32 no_gkey_bc_cnt;
> +		static u32 no_gkey_mc_cnt;
>  
> -					if (start == 0)
> -						start = jiffies;
> +		if (!psecuritypriv->binstallGrpkey) {
> +			res = _FAIL;
>  
> -					if (is_broadcast_mac_addr(prxattrib->ra))
> -						no_gkey_bc_cnt++;
> -					else
> -						no_gkey_mc_cnt++;
> +			if (start == 0)
> +				start = jiffies;
>  
> -					if (jiffies_to_msecs(jiffies - start) > 1000) {
> -						if (no_gkey_bc_cnt || no_gkey_mc_cnt) {
> -							netdev_dbg(padapter->pnetdev,
> -								   FUNC_ADPT_FMT " no_gkey_bc_cnt:%u, no_gkey_mc_cnt:%u\n",
> -								   FUNC_ADPT_ARG(padapter),
> -								   no_gkey_bc_cnt,
> -								   no_gkey_mc_cnt);
> -						}
> -						start = jiffies;
> -						no_gkey_bc_cnt = 0;
> -						no_gkey_mc_cnt = 0;
> -					}
> -
> -					goto exit;

Leave this goto exit because changing it would be an unrelated change.
The line is that adding a new goto is related because you were either
going to add a return or a goto.  Changing existing code is an unrelated
change and we want to leave those lines as-is except for pulling them
in a tab.

> -				}
> +			if (is_broadcast_mac_addr(prxattrib->ra))
> +				no_gkey_bc_cnt++;
> +			else
> +				no_gkey_mc_cnt++;
>  
> +			if (jiffies_to_msecs(jiffies - start) > 1000) {
>  				if (no_gkey_bc_cnt || no_gkey_mc_cnt) {
>  					netdev_dbg(padapter->pnetdev,
> -						   FUNC_ADPT_FMT " gkey installed. no_gkey_bc_cnt:%u, no_gkey_mc_cnt:%u\n",
> -						   FUNC_ADPT_ARG(padapter),
> -						   no_gkey_bc_cnt,
> +						   FUNC_ADPT_FMT " no_gkey_bc_cnt:%u, no_gkey_mc_cnt:%u\n",
> +						   FUNC_ADPT_ARG(padapter), no_gkey_bc_cnt,
>  						   no_gkey_mc_cnt);
>  				}
> -				start = 0;
> +				start = jiffies;
>  				no_gkey_bc_cnt = 0;
>  				no_gkey_mc_cnt = 0;
> -
> -				prwskey = psecuritypriv->dot118021XGrpKey[prxattrib->key_index].skey;
> -				if (psecuritypriv->dot118021XGrpKeyid != prxattrib->key_index) {
> -					res = _FAIL;
> -					goto exit;
> -				}
> -			} else {
> -				prwskey = &stainfo->dot118021x_UncstKey.skey[0];
>  			}
>  
> -			length = ((union recv_frame *)precvframe)->u.hdr.len - prxattrib->hdrlen - prxattrib->iv_len;
> +			goto exit;
> +		}
>  
> -			res = aes_decipher(prwskey, prxattrib->hdrlen, pframe, length);
> +		if (no_gkey_bc_cnt || no_gkey_mc_cnt) {
> +			netdev_dbg(padapter->pnetdev,
> +				   FUNC_ADPT_FMT " gkey installed. no_gkey_bc_cnt:%u, no_gkey_mc_cnt:%u\n",
> +				   FUNC_ADPT_ARG(padapter), no_gkey_bc_cnt,
> +				   no_gkey_mc_cnt);
> +		}
> +		start = 0;
> +		no_gkey_bc_cnt = 0;
> +		no_gkey_mc_cnt = 0;
>  
> -		} else {
> +		prwskey = psecuritypriv->dot118021XGrpKey[prxattrib->key_index]
> +				  .skey;
> +		if (psecuritypriv->dot118021XGrpKeyid != prxattrib->key_index) {
>  			res = _FAIL;
> +			goto exit;
>  		}
> +	} else {
> +		prwskey = &stainfo->dot118021x_UncstKey.skey[0];
>  	}
> +
> +	length = ((union recv_frame *)precvframe)->u.hdr.len -
> +		 prxattrib->hdrlen - prxattrib->iv_len;

Checkpatch wants you to break this line up, but it wasn't broken up in
the original code so that's an unrelated change.

regards,
dan carpenter

> +
> +	res = aes_decipher(prwskey, prxattrib->hdrlen, pframe, length);
> +
>  exit:
>  	return res;
>  }
> -- 
> 2.34.1
