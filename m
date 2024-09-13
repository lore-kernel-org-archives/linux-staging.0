Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA8C74A07
	for <linux-staging@lists.linux.dev>; Fri, 13 Sep 2024 05:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726204132; cv=none; b=JK05pJIORC/N3erx4Fnrd0eFjONu8vzVKeaCDlOtKB3sRwZ82iG+Jci8goX4mR7bdl3gvCgSDmIaH+AYYkPBYTrCRwUWPsR5SfjXZRNwHxrge7nB/sTbCow6Wbc4IxktajtjQHZeghudCz6ie3MufvzF1GLI611ct1Uc0LJ0AgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726204132; c=relaxed/simple;
	bh=Mh8vg4bqrIfCB6r+qKE5u434fiJUJULIMn0nj/AbMC0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=DiSWcMGGk9550uLI1ezQaIoZhxiATFHNYUXgQxXFvJGmh2z/3Q9esI2lrQ1RGzooQWvl8VfpPlzGNT0c6HGg4fGkqk3Cfmv+85T2CMOZmRX7AKmQ/cGeoISl2kpontsbm7v1ehT8BkJHsV7/+F5VTwFWVmrOAEAcX+ErK7tbJlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bmzsYceA; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bmzsYceA"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-378c16a4d3eso526847f8f.1
        for <linux-staging@lists.linux.dev>; Thu, 12 Sep 2024 22:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726204129; x=1726808929; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=czxeoqBiPxH3lAOEA6JUJ0nSjswq1mluKegMDz5OxVY=;
        b=bmzsYceAEVQ01g++V2cSTXweT0jXRlD3+qCBqOLrHY6g/+lBuXS/Qvqjcr/+VqF26j
         R48GmsymofSWlBAc3+2YCsfEYEea6c84jAjBLRhnEoeMWzi6Efo1BGjRBDazaS7NJUx/
         9+Gstz7rgdGKMqQE+jfyhIwnrrax7ETve1fI++0IPVhmLxxtJzLsM7a0X8sgTnCiu6VW
         4iv0R3K2FNU5fhn64h/GP31JOkc0RC6ww3BCc+Y2nANsDT0zup6El/1SnOQP1KiSBuLH
         lbciUbPAjqRm0dGlXYOkPgQ8YVXXvJm9k1ff6Q6lkyYTM2oBXG/Bz/z051y9pOMwmjeS
         eyyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726204129; x=1726808929;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=czxeoqBiPxH3lAOEA6JUJ0nSjswq1mluKegMDz5OxVY=;
        b=lSemZS0bLv2U5mk9Tu91UBBw7WEIP+x5BN6UXVVeQSNoE9O95UDQPONGc6cpQHVjeG
         9xtSYRfqCKkCve0LhzROTFPXXVKk5FWvlW9kX+9eFCydXdCGKqjxjMslo5DYVhQcvqms
         ZylCEnYVOmxE69c3vrvA/4ISJa8py5Aq3gv7bP3l5r0gAXskOEQ8iz7yHMrA6HiciW3Z
         ClurFBG8djBQ20cbEIlH6L5IUjCc+6PUoPpnFYIzJY/GmqrY37mHHz/wD+8qHJk5DMFA
         A2lxgpmUCwUKB9Hwpd3uK1kIN+Ftb2dIczP9twSJMW3RqKUcLn/kAKF3mcfLwdLERSZJ
         r2KQ==
X-Forwarded-Encrypted: i=1; AJvYcCXJ/uu6oWoJUO1DppgOR8/7tOKstmSjwWLJGuCyvKYEiJxeu9eLP+Uo9/egPy7JaXdwmjQ6ug4vhRwaj178@lists.linux.dev
X-Gm-Message-State: AOJu0YyXNcm/weu73qZrTflj0hkVo5iOWoo3E70pW3T43kRrDLklEOlv
	sJwSGbcrXuD68BJgoeUMhGbHRzUfyjIdBgszw4cysa+uGwQQq1MC
X-Google-Smtp-Source: AGHT+IEIkLuiyZRvhh61qiXnVKh0feJoQcTwOA1DLs4nf3Ar0hqvqEJl9IVNQGl7Gakj8VFAjyMsww==
X-Received: by 2002:a5d:5f88:0:b0:374:c8b7:63ec with SMTP id ffacd0b85a97d-378d61e2888mr1468686f8f.21.1726204128760;
        Thu, 12 Sep 2024 22:08:48 -0700 (PDT)
Received: from [192.168.0.100] (p57ba2f9b.dip0.t-ipconnect.de. [87.186.47.155])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25c72748sm823743066b.117.2024.09.12.22.08.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Sep 2024 22:08:48 -0700 (PDT)
Message-ID: <2ccf9206-50de-41d4-ba7b-ce5a97fdd69e@gmail.com>
Date: Fri, 13 Sep 2024 07:08:47 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] staging: vt6655: Rename variable apTD0Rings
To: Xingquan Liu <b1n@b1n.io>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20240913012343.42579-1-b1n@b1n.io>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20240913012343.42579-1-b1n@b1n.io>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/13/24 03:23, Xingquan Liu wrote:
> Rename variable apTD0Rings to ap_td0_rings to fix checkpatch warning
> Avoid CamelCase.
> 
> Signed-off-by: Xingquan Liu <b1n@b1n.io>
> ---
> v3: Add change history
> v2: Rename variable apTD1Rings
> 
>   drivers/staging/vt6655/card.c        |  6 +++---
>   drivers/staging/vt6655/device.h      |  2 +-
>   drivers/staging/vt6655/device_main.c | 14 +++++++-------
>   3 files changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/staging/vt6655/card.c b/drivers/staging/vt6655/card.c
> index 688c870d89bc..36bf8cde2e08 100644
> --- a/drivers/staging/vt6655/card.c
> +++ b/drivers/staging/vt6655/card.c
> @@ -388,8 +388,8 @@ void card_safe_reset_tx(struct vnt_private *priv)
>   	struct vnt_tx_desc *curr_td;
>   
>   	/* initialize TD index */
> -	priv->tail_td[0] = &priv->apTD0Rings[0];
> -	priv->apCurrTD[0] = &priv->apTD0Rings[0];
> +	priv->tail_td[0] = &priv->ap_td0_rings[0];
> +	priv->apCurrTD[0] = &priv->ap_td0_rings[0];
>   
>   	priv->tail_td[1] = &priv->apTD1Rings[0];
>   	priv->apCurrTD[1] = &priv->apTD1Rings[0];
> @@ -398,7 +398,7 @@ void card_safe_reset_tx(struct vnt_private *priv)
>   		priv->iTDUsed[uu] = 0;
>   
>   	for (uu = 0; uu < priv->opts.tx_descs[0]; uu++) {
> -		curr_td = &priv->apTD0Rings[uu];
> +		curr_td = &priv->ap_td0_rings[uu];
>   		curr_td->td0.owner = OWNED_BY_HOST;
>   		/* init all Tx Packet pointer to NULL */
>   	}
> diff --git a/drivers/staging/vt6655/device.h b/drivers/staging/vt6655/device.h
> index 32d9cbd55222..32c51d794264 100644
> --- a/drivers/staging/vt6655/device.h
> +++ b/drivers/staging/vt6655/device.h
> @@ -135,7 +135,7 @@ struct vnt_private {
>   	struct vnt_tx_desc *apCurrTD[TYPE_MAXTD];
>   	struct vnt_tx_desc *tail_td[TYPE_MAXTD];
>   
> -	struct vnt_tx_desc *apTD0Rings;
> +	struct vnt_tx_desc *ap_td0_rings;
>   	struct vnt_tx_desc *apTD1Rings;
>   
>   	struct vnt_rx_desc *aRD0Ring;
> diff --git a/drivers/staging/vt6655/device_main.c b/drivers/staging/vt6655/device_main.c
> index 9ea647aefd60..a8dcd8ad3945 100644
> --- a/drivers/staging/vt6655/device_main.c
> +++ b/drivers/staging/vt6655/device_main.c
> @@ -550,7 +550,7 @@ static bool device_init_rings(struct vnt_private *priv)
>   		priv->opts.tx_descs[0] * sizeof(struct vnt_tx_desc);
>   
>   	/* vir_pool: pvoid type */
> -	priv->apTD0Rings = vir_pool
> +	priv->ap_td0_rings = vir_pool
>   		+ priv->opts.rx_descs0 * sizeof(struct vnt_rx_desc)
>   		+ priv->opts.rx_descs1 * sizeof(struct vnt_rx_desc);
>   
> @@ -720,7 +720,7 @@ static int device_init_td0_ring(struct vnt_private *priv)
>   	curr = priv->td0_pool_dma;
>   	for (i = 0; i < priv->opts.tx_descs[0];
>   	     i++, curr += sizeof(struct vnt_tx_desc)) {
> -		desc = &priv->apTD0Rings[i];
> +		desc = &priv->ap_td0_rings[i];
>   		desc->td_info = kzalloc(sizeof(*desc->td_info), GFP_KERNEL);
>   		if (!desc->td_info) {
>   			ret = -ENOMEM;
> @@ -730,20 +730,20 @@ static int device_init_td0_ring(struct vnt_private *priv)
>   		desc->td_info->buf = priv->tx0_bufs + i * PKT_BUF_SZ;
>   		desc->td_info->buf_dma = priv->tx_bufs_dma0 + i * PKT_BUF_SZ;
>   
> -		desc->next = &(priv->apTD0Rings[(i + 1) % priv->opts.tx_descs[0]]);
> +		desc->next = &(priv->ap_td0_rings[(i + 1) % priv->opts.tx_descs[0]]);
>   		desc->next_desc = cpu_to_le32(curr +
>   					      sizeof(struct vnt_tx_desc));
>   	}
>   
>   	if (i > 0)
> -		priv->apTD0Rings[i - 1].next_desc = cpu_to_le32(priv->td0_pool_dma);
> -	priv->tail_td[0] = priv->apCurrTD[0] = &priv->apTD0Rings[0];
> +		priv->ap_td0_rings[i - 1].next_desc = cpu_to_le32(priv->td0_pool_dma);
> +	priv->tail_td[0] = priv->apCurrTD[0] = &priv->ap_td0_rings[0];
>   
>   	return 0;
>   
>   err_free_desc:
>   	while (i--) {
> -		desc = &priv->apTD0Rings[i];
> +		desc = &priv->ap_td0_rings[i];
>   		kfree(desc->td_info);
>   	}
>   
> @@ -795,7 +795,7 @@ static void device_free_td0_ring(struct vnt_private *priv)
>   	int i;
>   
>   	for (i = 0; i < priv->opts.tx_descs[0]; i++) {
> -		struct vnt_tx_desc *desc = &priv->apTD0Rings[i];
> +		struct vnt_tx_desc *desc = &priv->ap_td0_rings[i];
>   		struct vnt_td_info *td_info = desc->td_info;
>   
>   		dev_kfree_skb(td_info->skb);

Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>

