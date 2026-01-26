Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B51E32D7F3
	for <linux-staging@lists.linux.dev>; Mon, 26 Jan 2026 09:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769421352; cv=none; b=Lljm7QRVJlDV/GEh3bN9ixQ8IaeAx8ghxPGKGuN0q/ujBzyWxFPQQ0Mo8m0cxy4b/hkRqDt2pUlc3YsUGCxbkBxHk/Itz6NMaQV61BTHHcIXmJfNOGwsiCBERDx5m3QZJ4ckFWM2wln94wlH+EM3RuxQ5OANOcmm80NfjzDiWEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769421352; c=relaxed/simple;
	bh=jwk9yBux6+536fldnVhhGFBsCSDNKxtCSJzdLGo7hTs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=laxqhEsY4h086eFrHX0s/9gKZ8K2zduZzSktFu843W+VVMEjckUCrhwOj9UlAfjzMSWQwDzAWQTvKM+J4w3k0NZizq8h1IlFqLnQQL9h5IQ0wLi5pE6+4fpAw80bdz7A+iZlSGjyGejEMS87szG+aeudbhmMhFL2aj1IXgCSt5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=afXNVmu3; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="afXNVmu3"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4801d24d91bso45518425e9.2
        for <linux-staging@lists.linux.dev>; Mon, 26 Jan 2026 01:55:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769421350; x=1770026150; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ITM22V9fOoshZUR1SBOjl67RUW7bLWAYL6S+oxqzFrE=;
        b=afXNVmu3StCUPRF7dqUDUVO54dts/JAQQwYN1UNJKdtZQmXO/b+d4EZTpnKPbzzv8R
         kJU18xPJTAv6CMgf/40/utqMzUWWJ0bkMKtB1yPQVTS598/JIje/9U/VV6IYf7K3QB1n
         F8NIMKzgyYn0L0gE7U/TFfE7+8jt2pRd9pVt/soYPlF4rL/gF43hmK9GD0cHPI0P2t+T
         MpiqFAKUI176uDlksSQLEheWxJ2iIFz04MGg++plZ9ksVtb8bobWCVQRj461V7mu/dUY
         c3BtttTDuhlO/FomFgb/EmEnIjgp6R9M7mqzTX/8NBG6ThPWExmnggdtqKjkmgHHGOr2
         KIUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769421350; x=1770026150;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ITM22V9fOoshZUR1SBOjl67RUW7bLWAYL6S+oxqzFrE=;
        b=fFQu/dQ8IAlYp4xCIv30b8tebjfikDLXL39kcYMLjLIPF1JIX/jVwE/cBNy+4wkB1Z
         +MQGmuJpp9WPl8bbSAZAj3en9IuRpeDcTM8m7iGxV7pfCA6MTurAzqcLj0VeuLutpk78
         fApHeynGKpEJd0xWEJ9bXjn7rgZH8QnkcfBEf9lDT3U9Akkma7Hx1ZHug0s9IgINLMHG
         HWt9gOfdmmbwQOq2wdfxFo2Y3+LR82q3AC2BzhQZnVUEf3TEdybY069EXYWqdi5dibyw
         L9FI6TPtm28BkR4sMhxX11fuR0lNqL6kh7iPngjD2KQYfNQJgDeH988SOsj3pJnuRIQ/
         qIWg==
X-Forwarded-Encrypted: i=1; AJvYcCXkYVdeo1qYGYy+znSMPjlTPlm0bgH6+4Yg4xmLPsJ676zwq/j0iSVd1K0PA4Zm+L5p0rfywuY4+SDB/cQB@lists.linux.dev
X-Gm-Message-State: AOJu0Yx1eL39uKa5Hw8TJrHvGmOuNiwUlLL5dW8da9kbGzZzXMPXGs6w
	8zfYW5ewXCAcdkwcil1pa3coMUS04DZTUcYBw6yB1CGss0JME5OER8wO
X-Gm-Gg: AZuq6aKNDnQfq2G9ggmA3LjsFOK0mbA9oo3ZcjmrwsMnpLruIS+ZkdQXxMtbKYEv3h9
	6DVTXGO2aVxeRYhiGNqJGn7buarNEHM/Vdhtcvz8WShz3+cr2vlZYtRLHmBukrPQMvDkG2r4orF
	x6GaqJqlJhIzEB9QemiKqAUAdqfrro9E3hIr3Da9lN6D9kJllDs2j6IHnZG3oi8z5vY0WN1S2Ec
	/vzKFasMhWUfKy3xZ4qL8vSJkVhWSFU6pLU34mDHNu26ww7Jk79Bdd3ptu0fdC08hcSWe6Dri0V
	ELoTUi6nzoBuWoAL3JWwNi6shooUWuvgPH86tYEoZWa4iV/yFuBmchcsVVM14VfkRfFBkTYiDm/
	SKbX0R3llXgWftaE2SBz3aLaem1i/zGDOyMH2oSs5OWjZR0P3K+1FeWisS41MtbznbH0ogX2f5F
	NjSlmciVl5gE+0sIlBrDkTAdWSi/9ENqBo7YRZKhEvuPrxAyR3
X-Received: by 2002:a05:600c:314f:b0:480:3b4e:41ba with SMTP id 5b1f17b1804b1-4805cf669b2mr55811755e9.18.1769421349631;
        Mon, 26 Jan 2026 01:55:49 -0800 (PST)
Received: from [172.25.98.130] ([5.2.194.157])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1f74942sm27922186f8f.36.2026.01.26.01.55.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jan 2026 01:55:49 -0800 (PST)
Message-ID: <47ce1e14-5443-4d3e-a2c9-7d5be47012c9@gmail.com>
Date: Mon, 26 Jan 2026 11:55:47 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v8 17/21] media: i2c: maxim-serdes: add MAX9296A
 driver
Content-Language: en-US
To: Sakari Ailus <sakari.ailus@linux.intel.com>, dumitru.ceclan@analog.com
Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Julien Massot <julien.massot@collabora.com>, Rob Herring <robh@kernel.org>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-staging@lists.linux.dev, Cosmin Tanislav <demonsingur@gmail.com>
References: <20251208-gmsl2-3_serdes-v8-0-7b8d457e2e04@analog.com>
 <20251208-gmsl2-3_serdes-v8-17-7b8d457e2e04@analog.com>
 <aW-EXiiKFLrXQeJG@kekkonen.localdomain>
From: Ceclan Dumitru <mitrutzceclan@gmail.com>
In-Reply-To: <aW-EXiiKFLrXQeJG@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 1/20/26 3:34 PM, Sakari Ailus wrote:
> Hi Dumitru,
> 
> On Mon, Dec 08, 2025 at 04:13:09PM +0200, Dumitru Ceclan via B4 Relay wrote:
>> +	*ops = max9296a_common_ops;
>> +
>> +	ops->versions = priv->info->ops->versions;
>> +	ops->modes = priv->info->ops->modes;
>> +	ops->needs_single_link_version = priv->info->ops->needs_single_link_version;
>> +	ops->needs_unique_stream_id = priv->info->ops->needs_unique_stream_id;
>> +	ops->fix_tx_ids = priv->info->ops->fix_tx_ids;
>> +	ops->num_phys = priv->info->ops->num_phys;
>> +	ops->num_pipes = priv->info->ops->num_pipes;
>> +	ops->num_links = priv->info->ops->num_links;
>> +	ops->phys_configs = priv->info->ops->phys_configs;
>> +	ops->set_pipe_enable = priv->info->ops->set_pipe_enable;
>> +	ops->set_pipe_stream_id = priv->info->ops->set_pipe_stream_id;
>> +	ops->set_pipe_tunnel_phy = priv->info->ops->set_pipe_tunnel_phy;
>> +	ops->set_pipe_tunnel_enable = priv->info->ops->set_pipe_tunnel_enable;
>> +	ops->use_atr = priv->info->ops->use_atr;
>> +	ops->tpg_mode = priv->info->ops->tpg_mode;
> 
> What's the reason for doing these assignments and a copy of the memory? Why
> not to just keep a pointer to the struct memory instead? I think there's
> another case of the same.
> 
Would this be alright:
#define MAX9296A_COMMON_OPS					\

	.num_remaps_per_pipe = 16,				\

	.tpg_entries = { ... },					\

	.init = max9296a_init,					\

	.set_enable = max9296a_set_enable,			\


static const struct max_des_ops max9296a_ops = {

	MAX9296A_COMMON_OPS,

	.versions = BIT(MAX_SERDES_GMSL_2_3GBPS) |

		    BIT(MAX_SERDES_GMSL_2_6GBPS),
	.modes = BIT(MAX_SERDES_GMSL_PIXEL_MODE),
	/* ... */

	};



static int max9296a_probe(struct i2c_client *client)

{

	/* ... */

	priv->des.ops = priv->info->ops;

	/* ... */

}
