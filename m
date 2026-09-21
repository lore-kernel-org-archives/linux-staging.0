Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A64FD48489A
	for <linux-staging@lists.linux.dev>; Mon, 21 Sep 2026 12:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789995445; cv=none; b=dhx18VIKnp5PnEti5qhNHRy9aAEBHQ0rtkLgU9R0O3qJfq4AI8iIXAvLsOnA4oBkuXfuYY+/BDia6Y2xJTTT5eL1jyDGwFFXJo4T71vznsWF+K/qgypg1cx6vjknoGmfDtobz3VEGiKv+KX0mZcquHBEzlurSqhDu6MZBtQzWcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789995445; c=relaxed/simple;
	bh=7xGrUIKKeB7i/I9oYtXav15gwJEJegZRjB2/iyYGa4I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BF8ovYsUkH6RoVQYrlfoDnZB/+CrNntC05p/byLTlqrdnLlVEkaVp6O+CJf73ib3MPvIp4ZnYKVqeQ4QMwqZWAi+dCleS6oiM5C/gvrjSSCwnplqJjQOxgGmRSr637yxjXvgrXse68Ijn/lwoJM03giwWs8Nwfb0vhocguXVLtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rHifyM1d; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rHifyM1d"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254fa65080so333485666b.3
        for <linux-staging@lists.linux.dev>; Mon, 21 Sep 2026 05:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789995442; x=1790600242; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hIu2hD0Dz/nFwlwDmIyFlBMEkmeocGiPhCNqALMWPtg=;
        b=rHifyM1dcanx1d48LA62KWEnAvATsxXcCeDz4QBjarSbSCf9qDPHgSt4tcxlwTdZBY
         he4bPcCvHC/AQ8/uADcS1OqFRhgS6P3lmhI6Dx8+a0STm/Gg+/+VAIse3CShTDs9xsPi
         M5mw/1u8iR7IGfBZntRi+lJaQKJaHD/d56tsJt5yamtA4rDCcg1j8eQZkeISa20HVcBD
         FX2EUTFzzAXqaG5uyOCvW6M0yfLlNx+Fp5Q1QktvwLj/rnjp7x/G1rM5xxYix8a2qZ5g
         5+GnHzPxfsEVAu+P6QC6szQPJW9FdaGYWBrWL6wKN+VhpXcjF6wz7dKEIshr1IVUDu1I
         Kmjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789995442; x=1790600242;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hIu2hD0Dz/nFwlwDmIyFlBMEkmeocGiPhCNqALMWPtg=;
        b=Q+9+S2VG55O+5RkLtbovXAo6HnsFT9frWniWlSNnvjv8vErKckkS/w3GigkZI+Cdk7
         W2NutMVe6d/gD9sQuU9FuaKr/FdhWuA6hMKGORL9PgLyB/F1n3vsFCXKH2qU/qIFCEeG
         XPN4WP5FgE1XxnvIt1BoQu6vxKrsSyLG/Gk77RuaUgHUYWZY22FN2t2nnhBoQSrEF1D3
         6fmXez/7BVCSN9NTTR2kiEguAeU3TTeUp0J+4JX5m0F7QdmoMK/wknLrtEuwoW7dWlTl
         TtXmts371ejIG6JfaWok9CfM/V8Vkm4SKndhT/getWc5t0BKDWteZNreg5mrfhbCKVQa
         4vFA==
X-Gm-Message-State: AFuF++kq/vPS+0VNUbvjKpTVnGX8RjRA4aYODQalrL1oG385UkxKyARn
	19nsUSGuVC+MU1gEDC2ZtHuaRy7G2O5qMpg6muoBOY8frSaLovcMRwNk
X-Gm-Gg: AYBFou3G85eL2uPWstrdGD/1ci1/PTvo56hvWl0MSDlTtNAEAAff74BdwJXocAaWv+8
	6ciNnoPpL3AF7pMrDNw/QAyk2mjsJC7F8PrsWIcBwhp9T6YRllSqYEBnH3d+DTYbL47/PuK8Etg
	X9isplRB4/BfV+3F+JhKXzhyLKsmIqwOOiE3IP1wrsuNew+M1uzb5gYk89wFcJNrL5ZxM6iQqvO
	htcGaO2Sr5wwyeg7cevLFBW3mnmuFJ3buUDHIxhOaa3LLa4LFrnAMiSBGn55ckcgZb08oxTxSLh
	OfX4cy2Vt/1ZBcE99LYVrLrBZu1rEiZdZtY1rRx3QKVxMA9H+vd++gj5IKxRKA2zNNZUNRtwO0/
	mYkmLDSc8MWg+CkKihFQP99WPH0SkTzpkWa2YPkNdvMT7UdxvDr48wTvN6J9IkF3LkOCf7MF3IX
	TEZH6icFPNSzAfeDOdLNqc6T8/AwQphmDoF92qF5+4mBm/dM5ErJNSWTtpUEGygpQGkdo=
X-Received: by 2002:a17:906:9c84:b0:c25:8fdf:5d with SMTP id a640c23a62f3a-c2a15685169mr864066966b.13.1789995441596;
        Mon, 21 Sep 2026 05:57:21 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a3574a0c7sm304530266b.37.2026.09.21.05.57.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 05:57:20 -0700 (PDT)
Date: Mon, 21 Sep 2026 15:57:17 +0300
From: Dan Carpenter <error27@gmail.com>
To: Callan McClish <mcclishcallan@gmail.com>
Cc: linux-staging@lists.linux.dev, gregkh@linuxfoundation.org
Subject: Re: [PATCH] staging: rtl8723bs: remove unnecessary NULL check before
 kfree
Message-ID: <arEprRBNPaPeYEa-@stanley.mountain>
References: <20260920233053.2311209-1-mcclishcallan@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260920233053.2311209-1-mcclishcallan@gmail.com>

On Sun, Sep 20, 2026 at 04:30:40PM -0700, Callan McClish wrote:
> kfree(NULL) is a safe operation and an explicit NULL check is redundant,
> therefore it should be omitted.
> Detected by checkpatch.
> 
> Signed-off-by: Callan McClish <mcclishcallan@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_xmit.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
> index 81d9e713fc12..6aaa07813d46 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
> @@ -1748,10 +1748,9 @@ s32 rtw_free_xmitframe(struct xmit_priv *pxmitpriv, struct xmit_frame *pxmitfram
>  		pxmitframe->pkt = NULL;
>  	}
>  
> -	if (pxmitframe->alloc_addr) {
> -		kfree(pxmitframe->alloc_addr);
> +	kfree(pxmitframe->alloc_addr);
> +	if (pxmitframe->alloc_addr)
>  		goto check_pkt_complete;
> -	}

Do a search on lore before sending patches...  We need to add some
new drivers to staging because people seem to be doing the same
things over and over...

https://lore.kernel.org/all/ajT23QSZDVNdD8M_@stanley.mountain/

I guess this still works as a lesson in ignoring checkpatch and
being skeptical of advice from tools...

regards,
dan carpenter


