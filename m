Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31C6132E138
	for <linux-staging@lists.linux.dev>; Mon, 12 Jan 2026 08:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768204882; cv=none; b=XlhZzRb92UE1zfBvfVT60YE279gHSGwwXRMpHa65UbUrwaY49dVACs8zvrcAO+dupW+YhpjNPiCgUQadG9sW2/wDih+xaN3fDvFnPy7AjfQ/YlgWvJwCP2ikGEf1N6hwD/jqPwUQwOpQ+rtGc8HYvMyf4XPdGHQdMLjLBYU+v2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768204882; c=relaxed/simple;
	bh=biL6z9E5LaciSUtIhzFqHVWruJUCSz6yRGjuibFFomA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fmbsRTVR5k2wyKitvsLQuDUncD8FaPMqgPuKj4RrJ85bo7iDbNBrP00i5+sk0h2Di5HxOM5aFROYqSBgZp0PZ/rLjXTssjXypnuorBQaGvmLj0oHQYO+n8kN7OUPWLS1bps0R9oWVPot+h2o0pjQh9xNQ9khH6z87ZX8FdPJb0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=egkcaKVr; arc=none smtp.client-ip=209.85.128.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="egkcaKVr"
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-477ba2c1ca2so66727605e9.2
        for <linux-staging@lists.linux.dev>; Mon, 12 Jan 2026 00:01:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768204879; x=1768809679; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6RaUWb9aHxhel68eHV6lVpbCEpRxCUpEYjk0zN/H2Ak=;
        b=egkcaKVrsq0ZHT7p+XXcuJb1d+MgRsd1R83J6YAF/i+LriaVjJ9V+dLMCJZGnlxEu9
         zZ1+So9RqMR6ukIgP1MpSHGwwpqveoSgC4/s3ZDHUhf3M5StCkWZ4gqpx2zGk2LdejYt
         ZZSr/berO8EOCnjDHv4Vi+CxMQP3Ss4bM1CBjzuNK38fyfvVfn/iELVLf4V3tytjNJGb
         Hfg2LCA+D+n2r4uYCU/PeRg8n+6n+XxXO//3gj9QdRozKXDATxLaEMgeACWXY0ObSxRZ
         TcKILcjc2tj1Kf21FDSKaSfoaaAmmkmnVPpXhahOC7viUb16IXA84qkr8Ej6tCDgadBh
         jeZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768204880; x=1768809680;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6RaUWb9aHxhel68eHV6lVpbCEpRxCUpEYjk0zN/H2Ak=;
        b=mCMMP/UoID56W3niQT2EUv9fsuOpHQpujVU7MKG1nQ0D57B1YOTrgdwJiC9BaqEohy
         SAV1SBqZ99FrZJJZ+/sa7ZtJByTcT/8m2zjGTxJBppdS2otskFSH4FgRIZzBp/ziHdgi
         +rT9T7gdPEL9lio2Jsp0jlWGeC8yGccCkrJt5ZhT8Cs9LMc/xFmy8YPdEK5lEPjFAL39
         XDnMEXJTn/g4rBH4s9/pam4LsfC33GID9QoOyGqRLX/cqc7VYkgAHZ6y8/knCJjJTZ3j
         +gis+fsOWN+GUBHDnubcuSYqVjlHJl5+ub+J2/jXn0uosoiJ0KjlePVtkB6urcN+Z4+A
         70wA==
X-Forwarded-Encrypted: i=1; AJvYcCU4nti1nPQjXvtPK14XidUkUpBJcmEwfP3Ama8EfuXGinn8Kw2CuaGKPIHbocWYDdmcHKe9UU4iGxpsI1Zt@lists.linux.dev
X-Gm-Message-State: AOJu0YwQJpDqvc20bpWN18KbY8Q79QehmQZ6i3pzlev+TId8pMDmqAVm
	DOKxRkNUWfjzEoI7eC2NRaCk9ixDAbQgb7IIhOH+NoGSnMzMbSym+Z0no47PcH9qV4Y=
X-Gm-Gg: AY/fxX6UVP0olLGpxwu/ds+NdxtiwGY7kv5tVHg3g6fKDfjeGwDh7EF1/LXveVOK0ap
	eiT5aLdWYqywak9Z33Ded3/DxSaBZ9R1Z4wg7gDjMKthUsicaMxQjnRqg5maDMfgcY1XgrCMtS6
	HuoT0mYLTDrdPYCv2fDK/EbI/8QlGDFE1xBsuWn8B6lSFtsLEKhzmhaPKftA6AxkdoSMwqO6MjJ
	KICP2uQaNefCWex9lnqX714ecBGtF0zfBVgmBXp6FWEiguy8LjTprcEvucaoSrgonOpMeByE1UT
	gsoinCxzZmJgblI9eF+afbopQQ/ot+A1ETH6UamLblhM4x1c4WnRqiTZbz5UctEkGZYA9qSpKNm
	fWsN05b6pmUjWU4Y9Z4s+4A+f4dxUlj2A1pK0ITI5k47g73VQr8yWgaUnl+ynzHNniGPyTehtJ1
	7aCIMATbW6XcJpE4Qa
X-Google-Smtp-Source: AGHT+IGwWu6b2drWz7RYiF77nN5AZWhVOT/cb32OXcOfnDJixMi4E2CLNkGJ0NOhd8B+Zb6Xxs7BzA==
X-Received: by 2002:a05:600c:a102:b0:477:7a53:f493 with SMTP id 5b1f17b1804b1-47d84b32793mr166994765e9.23.1768204879251;
        Mon, 12 Jan 2026 00:01:19 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f653cd6sm358916845e9.9.2026.01.12.00.01.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 00:01:18 -0800 (PST)
Date: Mon, 12 Jan 2026 11:01:15 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Khushal Chitturi <khushalchitturi@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Straube <straube.linux@gmail.com>,
	Hans de Goede <hansg@kernel.org>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/9] staging: rtl8723bs: split chained assignments
Message-ID: <aWSqS9fRMZXX8qsV@stanley.mountain>
References: <20260111183630.12816-1-khushalchitturi@gmail.com>
 <20260111183630.12816-6-khushalchitturi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260111183630.12816-6-khushalchitturi@gmail.com>

On Mon, Jan 12, 2026 at 12:06:26AM +0530, Khushal Chitturi wrote:
> @@ -1155,11 +1158,13 @@ s32 rtw_mgmt_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, s
>  	u8 MME[_MME_IE_LENGTH_];
>  	u32 ori_len;
>  
> -	mem_start = pframe = (u8 *)(pxmitframe->buf_addr) + TXDESC_OFFSET;
> +	mem_start = (u8 *)(pxmitframe->buf_addr) + TXDESC_OFFSET;
> +	pframe = (u8 *)(pxmitframe->buf_addr) + TXDESC_OFFSET;
>  	pwlanhdr = (struct ieee80211_hdr *)pframe;
>  
>  	ori_len = BIP_AAD_SIZE + pattrib->pktlen;
> -	tmp_buf = BIP_AAD = rtw_zmalloc(ori_len);
> +	tmp_buf = rtw_zmalloc(ori_len);
> +	BIP_AAD = rtw_zmalloc(ori_len);

Nope.  We don't want two allocations.

regards,
dan carpenter

