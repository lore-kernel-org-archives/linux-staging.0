Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E37ED126BE2
	for <linux-staging@lists.linux.dev>; Fri, 13 Sep 2024 05:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726204199; cv=none; b=rRHtMB7yVvfJ6Uy5WLcn4F1eWkSaMjEM7HiSaHHP8GTwfaz7qmpmJZ0bGC41CP9dELh35MU6eCYo3eJ1p6CDkk1See7dnj745TDfqonNnnZeKr2vu5jqpaBpEFvETwH5i7MG+5nStwgi25wxp9p5x1Th/4C2Lc68TWHO+89j31w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726204199; c=relaxed/simple;
	bh=xZO+JJ+6t7vTv6ehk+F1DwlchIxfpCJIlPjAlY718yo=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=XXEEfOM4nXoaifYSk4SJiqDEGt6i9gKKpL5RepKNy1s7EfDd7oi2Os6E5LjKMeyUVvnxAzn6SmgyARYuzbb09dedstZS8CJ0PdOavp2wOM3wZKFRFvLX+eESBa4PL+z6ppajvkyCcxIeE7E15clTmHo4/xxV27U5DdvsTtj5g+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FN5gzzYa; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FN5gzzYa"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-374ca65cafdso315117f8f.2
        for <linux-staging@lists.linux.dev>; Thu, 12 Sep 2024 22:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726204196; x=1726808996; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=exTotxHenSQwkElfAEe2OsEV62fUb4tfT8KB0X5uUlY=;
        b=FN5gzzYaGSKF+FcJOqyQBFkr5GW1vk/4Yq5iEDZB3d4SqaE+RhEc8WxSaf9X8waDwh
         DfbU5bxmhnKI13Goe6+8KM33JV19S6dAvedCGorw5biVDpXxuvgyCQ7w68BZrhE1Ysue
         n6kCnN/5z+Rdzwt/nnX0eyWgTrkPEn39l3ejwsaE7gCOXDVZWrOkSAJhEGKu2dBuSITv
         1+q7PrNgGw/GUpeStNJwML7nVJCucfp5KpzG9DTWL93mOvwtDptDaxFCZsxwK9qQM87C
         A9tO7lcx9QtJnmFXb/mDH+0Orit2kMMAUwP5thQb1plBf01b8mL2m/xmwpC2iDWxEI3C
         rO3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726204196; x=1726808996;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=exTotxHenSQwkElfAEe2OsEV62fUb4tfT8KB0X5uUlY=;
        b=ndXKhr2fP7IyFWXT3+xXLUWqEZGbc53UE3F2BCvXscoh2yW3C1BLKncdWnpiNx99v7
         J8d/KtoKt0cJO9mJ7JJooKoDeTw+4X103tfeApnTFG6qJFK5gC/bzRY3zxbvZvQtp9eb
         qknOWXrAdlIi9IzldcExPQeD4T5W4PcP3HO4CBmEzxlPFKgsBJzFy8+zu82pxMJkNsZ9
         JjQ6K2tAROylYct5MvJ7yqlrDY3p4EHAa60JAhqs0DcgtH3chMSZlhhAaT4EItPy60MJ
         XKJHEtC9/QWjeEnu73mSUNIg7JSI6sQPvzyh+0D4mmIpgAsTS30b7q6GV3r9sywmMt6w
         py0A==
X-Forwarded-Encrypted: i=1; AJvYcCW5+T5yhS0sxaaovPoYxZPFGfyqd8YZgcaxA8OTCdVUrpSGgKJgEJRDK37Rgt+J+BgB3AT0UAofwBCYxWv8@lists.linux.dev
X-Gm-Message-State: AOJu0YxQAxwWsclyCVRt6kUc+0JaPbWlzw9PmxRlF7RtBWW1/nlt1ZC6
	azHJMZ4XRvf/e1mb/GhTevDnT2OHAyFHgfTrif0U/ZcJd+8JSAY6
X-Google-Smtp-Source: AGHT+IHAxUO+iLRdZX+tUP6Kyz2Jv0MMr+KT5V/wKZA0XAp3t86HNdhPZbyHqnoTgTe/ndTJF26MZA==
X-Received: by 2002:a5d:5103:0:b0:374:cb3e:3472 with SMTP id ffacd0b85a97d-378d625363fmr583383f8f.49.1726204196089;
        Thu, 12 Sep 2024 22:09:56 -0700 (PDT)
Received: from [192.168.0.100] (p57ba2f9b.dip0.t-ipconnect.de. [87.186.47.155])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25c72ef7sm828872266b.106.2024.09.12.22.09.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Sep 2024 22:09:55 -0700 (PDT)
Message-ID: <20abd18c-8afc-4ea3-afc1-3c48ed87307e@gmail.com>
Date: Fri, 13 Sep 2024 07:09:55 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] staging: vt6655: Rename variable apTD1Rings
To: Xingquan Liu <b1n@b1n.io>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20240913012343.42579-1-b1n@b1n.io>
 <20240913012343.42579-2-b1n@b1n.io>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20240913012343.42579-2-b1n@b1n.io>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/13/24 03:23, Xingquan Liu wrote:
> Rename variable apTD1Rings to ap_td1_rings to fix checkpatch warning
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
Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
