Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85D811AD410
	for <linux-staging@lists.linux.dev>; Wed, 18 Sep 2024 19:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726686768; cv=none; b=LuatoQxOx2ZJuWMBgziBpR3Z/bsEtQF5vRxYEynbBtaDhbiK4CNN9wwAow96VFQhGER9Vqux+3s3W56MUGky7Iwo65RK7sH7sTe1P8Lq/H7NMu+RbIUoW5utojNqLGfc+RYmI5eszW7S5o5kJtRJKDKT2emkBbasRW4l4vcuJB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726686768; c=relaxed/simple;
	bh=UqEGQlrhAKMaTVYXRHkKz4RHnw67nO+dOwEvga7bsRc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NhGUsHKNuRcWsfD7/CsAlXefzn40hi9ue8dmw1tecFwoFa4JN8QBKA/SBfD6mp7MqF7XFAFn5pi8Y/CF7pwecFxDeDv2z6hZiABpbDX0Nc/OKf0/G5r9Ms0V+t6L4wwa/gRRfvQjT+hgaKLfZzY7TUFDN41gqNVirFQlkiYzQk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ehIkaQ1a; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ehIkaQ1a"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a8d4093722bso2962966b.0
        for <linux-staging@lists.linux.dev>; Wed, 18 Sep 2024 12:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726686765; x=1727291565; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u3Xn3OJOyNbtekRi4Pk798R2NjV0eBNwlc4vGJafrlo=;
        b=ehIkaQ1aoPG3c20ShTM48ygeOeaZeFi6s0MtnCvg1tVPT9andyH3DcrWyg+JusZ/DC
         j8RUvDvMMsn1JoJr1LU1C3waM2d5XJ77nADMaP5z9faUq9XbrZf4tlYmYPwXjtcFmfi/
         XMvVzMK3XCfaQ27S7I4PWzvJV9m+RniqiN7P27BYbrAxVg+EXSGJB2Ik/tQDc2p9n7Bd
         Mo/M91w4/0roNU3xKOe4KBXqdguSzb37GSkEyeBJwLIEH/UMy0WKUgc7Y9IRPFNP9wla
         sD5jJzgNdgABTHbDs7pGGdIMuor79S20wn+QhkNZ9aAjQj+K5VIv7bYieea7RxHGd734
         Mb1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726686765; x=1727291565;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u3Xn3OJOyNbtekRi4Pk798R2NjV0eBNwlc4vGJafrlo=;
        b=h2tMl2hbyMnzypnSFeWaGTr007U7ujdD/tYAyuqkTVmaLbxnjSg5vu7mhFZJgO6Od9
         7kL5KgcoNwm9H/1bPIUBsdg65Ve8xAr+4twF/CowuEimTz8CpeyDBW7M7ErbI1OdnMVu
         ArXY2TEHC0MkiCIRPzrVkrA0zzv3+dcTvkk4jmEi8sOL4zyxWEeENj++wxIxjm6R3fM+
         knSiUwTxqaRWHlSebVb+QdWD97FnyO/1L3tWZPkOQodAjzYvbdTacc3nffew6QCkjwTO
         VrlUqZCX5B7SHrE2FdzyiQ76cSmu+hYgjx+ww7LM2l/yuxqICzVRd2IZRUf2ZmSFFDZc
         ZKLw==
X-Gm-Message-State: AOJu0Yxn/2VjfksqqUpldBcsZWK/7CdCi7Cf3n/uKO43Gu9FVdfx8ndj
	ErBb1pXp/dnTahhx+xade2Y5dRI8W9nOTTwT1IVkLJMQg6TZ28ssUWyROw==
X-Google-Smtp-Source: AGHT+IHKUneLxo4fzRCV8XQ/DIJf9ok53JMFlYNox+EnndkhFO5fNxb+Gn9qOvNgzuIxUOELME3ScQ==
X-Received: by 2002:a17:907:e619:b0:a86:96f5:fa81 with SMTP id a640c23a62f3a-a902949a158mr2344756266b.32.1726686764469;
        Wed, 18 Sep 2024 12:12:44 -0700 (PDT)
Received: from [192.168.2.100] (p57ba2f9b.dip0.t-ipconnect.de. [87.186.47.155])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a90612dfdcfsm619165366b.150.2024.09.18.12.12.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Sep 2024 12:12:44 -0700 (PDT)
Message-ID: <8faf5f05-8651-4601-a70f-7d417bbdee22@gmail.com>
Date: Wed, 18 Sep 2024 21:12:43 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: vt6655: rxtx.c: Fix too long lines in
 get_rtscts_time
To: =?UTF-8?Q?Dominik_Karol_Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@protonmail.com>, gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20240918165052.30386-1-dominik.karol.piatkowski@protonmail.com>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20240918165052.30386-1-dominik.karol.piatkowski@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/18/24 18:51, Dominik Karol Piątkowski wrote:
> This patch fixes the lines exceeding 100 columns in get_rtscts_time
> function.
> 
> Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@protonmail.com>
> ---
>   drivers/staging/vt6655/rxtx.c | 27 ++++++++++++++++++---------
>   1 file changed, 18 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/staging/vt6655/rxtx.c b/drivers/staging/vt6655/rxtx.c
> index 3705cb1e87b6..1ea17e86e3ee 100644
> --- a/drivers/staging/vt6655/rxtx.c
> +++ b/drivers/staging/vt6655/rxtx.c
> @@ -202,20 +202,29 @@ static __le16 get_rtscts_time(struct vnt_private *priv,
>   
>   	data_time = bb_get_frame_time(priv->preamble_type, pkt_type, frame_length, current_rate);
>   	if (rts_rsvtype == 0) { /* RTSTxRrvTime_bb */
> -		rts_time = bb_get_frame_time(priv->preamble_type, pkt_type, 20, priv->byTopCCKBasicRate);
> -		ack_time = bb_get_frame_time(priv->preamble_type, pkt_type, 14, priv->byTopCCKBasicRate);
> +		rts_time = bb_get_frame_time(priv->preamble_type, pkt_type, 20,
> +					     priv->byTopCCKBasicRate);
> +		ack_time = bb_get_frame_time(priv->preamble_type, pkt_type, 14,
> +					     priv->byTopCCKBasicRate);
>   		cts_time = ack_time;
>   	} else if (rts_rsvtype == 1) { /* RTSTxRrvTime_ba, only in 2.4GHZ */
> -		rts_time = bb_get_frame_time(priv->preamble_type, pkt_type, 20, priv->byTopCCKBasicRate);
> -		cts_time = bb_get_frame_time(priv->preamble_type, pkt_type, 14, priv->byTopCCKBasicRate);
> -		ack_time = bb_get_frame_time(priv->preamble_type, pkt_type, 14, priv->byTopOFDMBasicRate);
> +		rts_time = bb_get_frame_time(priv->preamble_type, pkt_type, 20,
> +					     priv->byTopCCKBasicRate);
> +		cts_time = bb_get_frame_time(priv->preamble_type, pkt_type, 14,
> +					     priv->byTopCCKBasicRate);
> +		ack_time = bb_get_frame_time(priv->preamble_type, pkt_type, 14,
> +					     priv->byTopOFDMBasicRate);
>   	} else if (rts_rsvtype == 2) { /* RTSTxRrvTime_aa */
> -		rts_time = bb_get_frame_time(priv->preamble_type, pkt_type, 20, priv->byTopOFDMBasicRate);
> -		ack_time = bb_get_frame_time(priv->preamble_type, pkt_type, 14, priv->byTopOFDMBasicRate);
> +		rts_time = bb_get_frame_time(priv->preamble_type, pkt_type, 20,
> +					     priv->byTopOFDMBasicRate);
> +		ack_time = bb_get_frame_time(priv->preamble_type, pkt_type, 14,
> +					     priv->byTopOFDMBasicRate);
>   		cts_time = ack_time;
>   	} else if (rts_rsvtype == 3) { /* CTSTxRrvTime_ba, only in 2.4GHZ */
> -		cts_time = bb_get_frame_time(priv->preamble_type, pkt_type, 14, priv->byTopCCKBasicRate);
> -		ack_time = bb_get_frame_time(priv->preamble_type, pkt_type, 14, priv->byTopOFDMBasicRate);
> +		cts_time = bb_get_frame_time(priv->preamble_type, pkt_type, 14,
> +					     priv->byTopCCKBasicRate);
> +		ack_time = bb_get_frame_time(priv->preamble_type, pkt_type, 14,
> +					     priv->byTopOFDMBasicRate);
>   		rrv_time = cts_time + ack_time + data_time + 2 * priv->uSIFS;
>   		return cpu_to_le16((u16)rrv_time);
>   	}

Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
