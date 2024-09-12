Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAFCF1B1509
	for <linux-staging@lists.linux.dev>; Thu, 12 Sep 2024 19:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726168209; cv=none; b=EOIx+kinDR8E7f7RtDA82UCNWH7mbdD9Jr1SRfd3IunAWNtYJKc/6AvBalznpMznV47kdYM0Itko9M+Fy4dC/1VjNfONOCRTsSPBUDmz/j2H7mL12XGbdcLzNheih8jnPJAs5tes9VXaPP51OUYFlpwRdgneqfFe76rStEZ8oyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726168209; c=relaxed/simple;
	bh=x9uNlpxRo73z9Xhjr33LP1oj8Xh45vefu7gcFjJ0GzQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=OwN8EVeMwqJm/8EBksHwnNUOm//W/axbGJjC88KkBs1O/XRqLUV/zSZPUcfl2jihI6xX7xZeGc8arvfamQCjCqcwIHGERZ2kXhUIkjcgHIm1qNCSd/2n+WZcC/RX4qgRCpdHBFlT9CrQEH7ruUeQTD6aESI2Qx1D/9sv8FmcH5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YeWeFRue; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YeWeFRue"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5bef295a429so1711590a12.2
        for <linux-staging@lists.linux.dev>; Thu, 12 Sep 2024 12:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726168206; x=1726773006; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=23FaQBR71h/KTW7H4hsDnv7jxijt8OBhi3uPrIO3vI8=;
        b=YeWeFRuewj019xbOoU4t6gNWoqPLd8Wdji0omf52MYU7niiTTWmudQrF85aqXotetJ
         tYgsC5PpEhwpNNA48Jo7BY3idCoIpdyvPnU3DeMvp7W74tpr/X4vFoPIGmoU1DvxxDba
         oV4jMsCXozQsSyXyH47xTKhtT2kfTow2ZJLkNwXRp5tn11aHfK/lMJTynFNOBolWdP3F
         tX5Qtqytp7Uo+WYk59PB12yZHd0iqYE3uqAt443tu2UQd6m/Xw8KZyENN93GdxX1jWQZ
         Q0vdthgr96AOUiMhfaR6JFBh6goMy94rfhnYDLWqj2PJfqW1Bqn29xZUE98K2eQl06fK
         YwmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726168206; x=1726773006;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=23FaQBR71h/KTW7H4hsDnv7jxijt8OBhi3uPrIO3vI8=;
        b=c1xFmzhFmIL/NqHh43LKpnZXE0y4ho1iNzmMfXgjDX0//lE6Zjz+97JAy2SotSYrYJ
         idQp40aoqd06S3ZK+I8hqnIbd1f1UMfkrOm/TOaS6FUCRYk/EJau6O2Tkx1ZciLsh7lY
         OJjJIlL/c8dKHt511EMKxOCJ6eCNkjm/qENZyY+v6buKYFwSfYyk77OgboyLsSrY8e54
         1FCz8VF8NrAjfU2nIAWTpCH4Q231kbG/PdP0ujwK9hEyqOkhOcP4ACcwJrevfTMxkj5V
         svwr9N6VFCvJtVruqZbkrT8Ttylh0aJRkAY6QcAko/KoTgK5lqXXraGOXe8BZpLxKLaZ
         e4mA==
X-Forwarded-Encrypted: i=1; AJvYcCUMdch6gXHA3F+zaX7JATe5hKvZiUkjQ7AqeHe+0E6QfmCfCdhrzboUJiDVmLI1jTjO6JQ0CqXlq59jPze+@lists.linux.dev
X-Gm-Message-State: AOJu0YwtYKGEFQ6Tpf+ws3PKH7fBZD+Qwu8NFVGw3ZRfdToScoIVCBxZ
	e2uQ7b5A0VVEeYbSAX3jFCYQVIrAZa01NHpzEpO9dkuyiPEehMb7
X-Google-Smtp-Source: AGHT+IFkaKYWe/8yreatEPu1pdpRLXlmd+Fx+SITMzAR5DjATDxd7xhEPGLHi+XowXyh7LR8X9gKBA==
X-Received: by 2002:a17:906:c153:b0:a8a:8a31:c481 with SMTP id a640c23a62f3a-a9029615808mr437414366b.42.1726168205634;
        Thu, 12 Sep 2024 12:10:05 -0700 (PDT)
Received: from ?IPV6:2003:c7:8f2a:8557:476b:8cfa:99ee:514e? (p200300c78f2a8557476b8cfa99ee514e.dip0.t-ipconnect.de. [2003:c7:8f2a:8557:476b:8cfa:99ee:514e])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25c62511sm786002566b.130.2024.09.12.12.10.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Sep 2024 12:10:05 -0700 (PDT)
Message-ID: <76aa503d-9cab-40a2-a97b-073e91985de0@gmail.com>
Date: Thu, 12 Sep 2024 21:10:04 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] staging: vt6655: Rename variable apTD1Rings
To: Xingquan Liu <b1n@b1n.io>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20240912162609.21517-1-b1n@b1n.io>
 <20240912162609.21517-2-b1n@b1n.io>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20240912162609.21517-2-b1n@b1n.io>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/12/24 18:26, Xingquan Liu wrote:
> Rename variable apTD1Rings to ap_td1_rings
> to fix checkpatch warning Avoid CamelCase.
> 
> Signed-off-by: Xingquan Liu <b1n@b1n.io>
> ---
>   drivers/staging/vt6655/card.c        |  6 +++---
>   drivers/staging/vt6655/device.h      |  2 +-
>   drivers/staging/vt6655/device_main.c | 14 +++++++-------
>   3 files changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/staging/vt6655/card.c b/drivers/staging/vt6655/card.c
> index 36bf8cde2e08..6a2e390e9493 100644
> --- a/drivers/staging/vt6655/card.c
> +++ b/drivers/staging/vt6655/card.c
> @@ -391,8 +391,8 @@ void card_safe_reset_tx(struct vnt_private *priv)
>   	priv->tail_td[0] = &priv->ap_td0_rings[0];
>   	priv->apCurrTD[0] = &priv->ap_td0_rings[0];
>   
> -	priv->tail_td[1] = &priv->apTD1Rings[0];
> -	priv->apCurrTD[1] = &priv->apTD1Rings[0];
> +	priv->tail_td[1] = &priv->ap_td1_rings[0];
> +	priv->apCurrTD[1] = &priv->ap_td1_rings[0];
>   
>   	for (uu = 0; uu < TYPE_MAXTD; uu++)
>   		priv->iTDUsed[uu] = 0;
> @@ -403,7 +403,7 @@ void card_safe_reset_tx(struct vnt_private *priv)
>   		/* init all Tx Packet pointer to NULL */
>   	}
>   	for (uu = 0; uu < priv->opts.tx_descs[1]; uu++) {
> -		curr_td = &priv->apTD1Rings[uu];
> +		curr_td = &priv->ap_td1_rings[uu];
>   		curr_td->td0.owner = OWNED_BY_HOST;
>   		/* init all Tx Packet pointer to NULL */
>   	}
> diff --git a/drivers/staging/vt6655/device.h b/drivers/staging/vt6655/device.h
> index 32c51d794264..5eaab6b172d3 100644
> --- a/drivers/staging/vt6655/device.h
> +++ b/drivers/staging/vt6655/device.h
> @@ -136,7 +136,7 @@ struct vnt_private {
>   	struct vnt_tx_desc *tail_td[TYPE_MAXTD];
>   
>   	struct vnt_tx_desc *ap_td0_rings;
> -	struct vnt_tx_desc *apTD1Rings;
> +	struct vnt_tx_desc *ap_td1_rings;
>   
>   	struct vnt_rx_desc *aRD0Ring;
>   	struct vnt_rx_desc *aRD1Ring;
> diff --git a/drivers/staging/vt6655/device_main.c b/drivers/staging/vt6655/device_main.c
> index a8dcd8ad3945..bf3ecf720206 100644
> --- a/drivers/staging/vt6655/device_main.c
> +++ b/drivers/staging/vt6655/device_main.c
> @@ -554,7 +554,7 @@ static bool device_init_rings(struct vnt_private *priv)
>   		+ priv->opts.rx_descs0 * sizeof(struct vnt_rx_desc)
>   		+ priv->opts.rx_descs1 * sizeof(struct vnt_rx_desc);
>   
> -	priv->apTD1Rings = vir_pool
> +	priv->ap_td1_rings = vir_pool
>   		+ priv->opts.rx_descs0 * sizeof(struct vnt_rx_desc)
>   		+ priv->opts.rx_descs1 * sizeof(struct vnt_rx_desc)
>   		+ priv->opts.tx_descs[0] * sizeof(struct vnt_tx_desc);
> @@ -761,7 +761,7 @@ static int device_init_td1_ring(struct vnt_private *priv)
>   	curr = priv->td1_pool_dma;
>   	for (i = 0; i < priv->opts.tx_descs[1];
>   	     i++, curr += sizeof(struct vnt_tx_desc)) {
> -		desc = &priv->apTD1Rings[i];
> +		desc = &priv->ap_td1_rings[i];
>   		desc->td_info = kzalloc(sizeof(*desc->td_info), GFP_KERNEL);
>   		if (!desc->td_info) {
>   			ret = -ENOMEM;
> @@ -771,19 +771,19 @@ static int device_init_td1_ring(struct vnt_private *priv)
>   		desc->td_info->buf = priv->tx1_bufs + i * PKT_BUF_SZ;
>   		desc->td_info->buf_dma = priv->tx_bufs_dma1 + i * PKT_BUF_SZ;
>   
> -		desc->next = &(priv->apTD1Rings[(i + 1) % priv->opts.tx_descs[1]]);
> +		desc->next = &(priv->ap_td1_rings[(i + 1) % priv->opts.tx_descs[1]]);
>   		desc->next_desc = cpu_to_le32(curr + sizeof(struct vnt_tx_desc));
>   	}
>   
>   	if (i > 0)
> -		priv->apTD1Rings[i - 1].next_desc = cpu_to_le32(priv->td1_pool_dma);
> -	priv->tail_td[1] = priv->apCurrTD[1] = &priv->apTD1Rings[0];
> +		priv->ap_td1_rings[i - 1].next_desc = cpu_to_le32(priv->td1_pool_dma);
> +	priv->tail_td[1] = priv->apCurrTD[1] = &priv->ap_td1_rings[0];
>   
>   	return 0;
>   
>   err_free_desc:
>   	while (i--) {
> -		desc = &priv->apTD1Rings[i];
> +		desc = &priv->ap_td1_rings[i];
>   		kfree(desc->td_info);
>   	}
>   
> @@ -808,7 +808,7 @@ static void device_free_td1_ring(struct vnt_private *priv)
>   	int i;
>   
>   	for (i = 0; i < priv->opts.tx_descs[1]; i++) {
> -		struct vnt_tx_desc *desc = &priv->apTD1Rings[i];
> +		struct vnt_tx_desc *desc = &priv->ap_td1_rings[i];
>   		struct vnt_td_info *td_info = desc->td_info;
>   
>   		dev_kfree_skb(td_info->skb);

Hi Xingquan,

Please use a change history. Description from Dan under:
https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/
So your next patch is v3.

Please do not break lines of the description to early. Up to 75 
characters can be used.

Thanks for your support.

Bye Philipp
