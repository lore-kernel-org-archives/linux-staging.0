Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6554618BC21
	for <linux-staging@lists.linux.dev>; Tue, 17 Sep 2024 20:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726603207; cv=none; b=NxPd4q0D2WnwKdxgr0IQtojhUrK1jmOA3qoqApVrot7oD8hMZlXS3ZSgQ3I1+XZun08HcUIbXaajVYm5E4V4xyp3seMX/Xqh3J0kzOOEulUAUc7rKrCnJHyRLF/NHHFZXoCQqPdXCGJ4GI6JZ2NQfUAaH1zOIn1uAYH/IhwlIlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726603207; c=relaxed/simple;
	bh=T6+ksvjJAgEfbOT1MxSkSrCK6wQ8i5k62TxE2B1lUYc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nOAzMajEWDfQARCWI/Nw/g20nO4QjHWLqDDeHs3M20xXo+JuROaL+7oy3M9PVcm11K98dSBTlikZk5V329WPJ66OBJ5KdxvTJcukMhtFf3LU9eaB6reYxx3p7yCeH7PBikVsY1mRzB7KiLfv1gqQA0xEPx4v9AxrDtAeFSqa/LE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TeoElfmJ; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TeoElfmJ"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5c42bcf35fbso5276252a12.1
        for <linux-staging@lists.linux.dev>; Tue, 17 Sep 2024 13:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726603204; x=1727208004; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CWRkmkcHV6T5Y2PauQSOh2UO3ThXb5nvn/hPmxzMqMo=;
        b=TeoElfmJUosj5Pw01+ZXbaWCI4J0V5n6fntr55kCDYKYs5ItGxdc65tzHLUkSC91fA
         WUiM9fPGFzD9nf1VvKqOQwEONiT4DxaEevqbW1XFDG3ZJJ2iUAeP/mJcfmhUiz8lk18h
         VW3HyOQv/PKEUqLS9lx040A4ayKUJ++NZX3aP1SMXaOdHDQwYcujQRflMuEpm+fI8cRR
         CaXfiIhts5Pe1oklzdkWWIPUayQsrTKShRu22rcQZGysy0YsqDAhYWDdbNkvcRJm+cQK
         l3YsHJOhqkJie7CcvpdwmqcxmH0gut5SlPOfCk1/SvrniAmNBTWh5wwmrzUQDHrMTTRk
         t2uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726603204; x=1727208004;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CWRkmkcHV6T5Y2PauQSOh2UO3ThXb5nvn/hPmxzMqMo=;
        b=D7I9TAydKSICOvhNYITLPZ4Gd78K+xFRHZmwqZWNhs8f0WV65rAHt8/xPMnKbrJ2wS
         fvTaTFShca9zIRm4pTz5L/ilhCRO2GIvSlHABXugHoskn6rE3vWD+bn0ybFxcFTLsntx
         IYTZA/ku+K+EAmuF/ZXmn6HucCfBpmN6Z/SqQyk/hA9FUZ/eNivc3z8gIJJH81SKCPJq
         So+n4ZxXSDLeI58tA9wM0VSCrMtPvTxEcjIbSnHc79DSfyuXwkmTvozU23s/mYQxVgaG
         k7CSN2H0Ew+NwHErlrh7UsMhqjudm9S5nl2+7UgcHZzDxQnru+sybyX36+kc38mdF/qP
         5lIg==
X-Forwarded-Encrypted: i=1; AJvYcCWXv2d/wJACAlLet51fmzZu9b1axD9iSynBHeyyY5Qnp6S59g/wjaXP6Rb8TrHZImYFaWseVIH3Scamo1H3@lists.linux.dev
X-Gm-Message-State: AOJu0YzVqIYVJvrHpsxvukNVdIXMrA5b2N0P8LaH0j4tnLhvHPabm6KA
	m/qC79+01M+MMntQPfOuiVOEeISkaTedGmQ5AnDHcobkuCYDRWZ1yzOQOQ==
X-Google-Smtp-Source: AGHT+IFOZOPB7iZrytCgA62IbvBoZ3+/IRT6fleNN+BEzgikPjA4c7Vevoz7sU3Qm2/ApHMVHr7nnw==
X-Received: by 2002:a05:6402:34ca:b0:5c2:439e:d6cb with SMTP id 4fb4d7f45d1cf-5c41e18e466mr13907513a12.12.1726603203398;
        Tue, 17 Sep 2024 13:00:03 -0700 (PDT)
Received: from kernel-710 (p57ba2f9b.dip0.t-ipconnect.de. [87.186.47.155])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c42bb94a0csm4019629a12.79.2024.09.17.13.00.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Sep 2024 13:00:02 -0700 (PDT)
Date: Tue, 17 Sep 2024 22:00:01 +0200
From: philipp hortmann <philipp.g.hortmann@gmail.com>
To: Tree Davies <tdavies@darkphysics.net>
Cc: gregkh@linuxfoundation.org, anjan@momi.ca,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 01/18] Staging: rtl8192e: Rename variable nDataRate
Message-ID: <ZunfwVt2f5DsAqlb@kernel-710>
References: <20240917053152.575553-1-tdavies@darkphysics.net>
 <20240917053152.575553-2-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240917053152.575553-2-tdavies@darkphysics.net>

On Mon, Sep 16, 2024 at 10:31:35PM -0700, Tree Davies wrote:
> Rename variable nDataRate to data_rate
> to fix checkpatch warning Avoid CamelCase.
> 
> Signed-off-by: Tree Davies <tdavies@darkphysics.net>
> ---
>  drivers/staging/rtl8192e/rtllib.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
> index d6615f787d53..21d8ea153368 100644
> --- a/drivers/staging/rtl8192e/rtllib.h
> +++ b/drivers/staging/rtl8192e/rtllib.h
> @@ -1743,7 +1743,7 @@ extern u16 MCS_DATA_RATE[2][2][77];
>  u8 ht_c_check(struct rtllib_device *ieee, u8 *frame);
>  void ht_reset_iot_setting(struct rt_hi_throughput *ht_info);
>  bool is_ht_half_nmode_aps(struct rtllib_device *ieee);
> -u16  tx_count_to_data_rate(struct rtllib_device *ieee, u8 nDataRate);
> +u16  tx_count_to_data_rate(struct rtllib_device *ieee, u8 data_rate);
>  int rtllib_rx_add_ba_req(struct rtllib_device *ieee, struct sk_buff *skb);
>  int rtllib_rx_add_ba_rsp(struct rtllib_device *ieee, struct sk_buff *skb);
>  int rtllib_rx_DELBA(struct rtllib_device *ieee, struct sk_buff *skb);
> -- 
> 2.30.2
>
Hi Tree,

forget the former email.

so in this commit:
commit ad96610acc0eb81f0342fa688e6d42fd530c328b
Author: Gary Rookard <garyrookard@fastmail.org>
Date:   Tue Nov 28 13:17:27 2023 -0500
the variable was changed. But he missed to change the declaration of the function tx_count_to_data_rate().

So you change the variable accordingly in the declaration of the functiont tx_count_to_data_rate()

I assume that Greg would want you to use a fixes tag.

Thanks.

Bye Philipp
