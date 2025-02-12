Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7B982040A7
	for <linux-staging@lists.linux.dev>; Wed, 12 Feb 2025 07:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739344907; cv=none; b=OScHMu9SYSdaSHyMKMF/9Swiu5/y7WbaQKTEM9q/KryOODuUe8jcQ6nhEVUWT+qSALV/3VErxFCC/60XABSIdfaSGzsymd4hBaM3gi+JhSONpJ8vgp+OYFoX4Cg15JBMERe1a3eQWuyEUVF3aj26oS5LZhNXbHj2UjKzYOgY1BA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739344907; c=relaxed/simple;
	bh=GX2Bo920yza7SAo4ieMuOLncMS2btUetGyMlP7Ii+n0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KOcrV77Ole+OwlDVqZoL2c1AOV4WPAITMyZIFpE2ramiQwPixJdb9P6PxLjaIlwXrJXlw2o6Q/YO8mEaMQi87T/895xcwK3kl+vwiVOC339dDnW+22T7ha/g1JOtVJ8w6Y2cwu4reUeaCtOjsoI/2SLmI7H6G/HSRefIARgJ8YE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=edyMErWP; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="edyMErWP"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5de5bf41652so6770480a12.1
        for <linux-staging@lists.linux.dev>; Tue, 11 Feb 2025 23:21:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739344903; x=1739949703; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=I1XA/sda8QNaELrl3C+Fgi3gSSESl0xT3B7//5s8Fkw=;
        b=edyMErWPj3FsBIUaa+JlX6bSjajBKx8IGJ4PDM+zUn28zdJBl1efxQeD6GHT9uV/tr
         sOKOMvhcGEmPFRbjUpWPMNw1zMBihNUgD15LKrdIxFEMJfpCAdR8T3Sm//HWpr5Xn9zQ
         yYnAZ8xXs28cioTEoKWQu4BXX+2qGBU5zDFeuGobfvyc8Cp6dg1LbJ2iOqAAnpfTrwRR
         JCFpFFKDucQt3X9+E/FlVpkFGqnjseycPydzT4XlubgXGbkJJlifTxKFW5cn3m2LdIps
         gR3u9PqHjJWU7aMAF8xT/ANYOVz9GUmsGPWG0bYUOVT16EBJULdGrCfnxCN4ugQXhn0Z
         qsBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739344903; x=1739949703;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I1XA/sda8QNaELrl3C+Fgi3gSSESl0xT3B7//5s8Fkw=;
        b=l+HyqHY1j6axGkcsDETroT39mMlfNpdLhXcYImDVFPMMHRNKEVPK7pX1vbihSyyxep
         eiojZhKzs7MWVnzzaNvHvLsfy1KCJNsiYS49bB9ANB6FaQSVs920BWOtmWW9Yd5r4oKP
         WLuGjgxpu4XnslW5QhPZ3HkwpzRHfSe41HIEJG5tXudQwDpDZJ4DOXGMq2rxcdhiqG67
         efk0IsR3pyvb2NYhaDzR1fwXhzLZo8V3iOIyTrN1rE6pHUKirlk1C3kDIJW++XxwFETN
         VO1ewuN8k0eNNZhGWKKFFiuI5bMNXdT9Ec4Ey9LWQzAIAr6oW3Nlzl6phn3S46AkscgT
         OeBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXr+pBvkV3Ipw2gKM4F+w7q6hS8ZdCNn72cHm67h42ZFGwYEEpAcPmWL53loWzVPK/ioPLL/8uMO1R5Pire@lists.linux.dev
X-Gm-Message-State: AOJu0Yy7z8adzdYRUfb6MGi49k2ekOyrFtFmz3APAGJ5sVugOvhZ3nbi
	XA6jir8LZCHnYp1Q500qfpGuWCNlVYjqkWklGhpdVrUvRVEN3S382kQU7YVNnLQ=
X-Gm-Gg: ASbGnct0EFiU9GogcwWOyJKsXguqXywd4j4PYoo2GEObZMnYJjAeFeqUIg5vryVDTVt
	nsE0yXETdmBGknn/YdFrtcEqQOvYJx6DiN5Af9u53mvItd64K+MhmgY9TwWknNUkGB23m5jYOph
	P1t7Iwla/d47p3iR74S2IzPwyr/VezEvQBpAa+ywnJz/IJicq5+FawUDujK95fdylRtt8MDw+vx
	E8rLOVk35AZBgCnWz8CYYjY4uxUWhF4Jwm86ZQC2Bj3w2aNX0gqppnTzuY4zL/xYUrShlUo3ji9
	f98vgrH+dYGVBQHf/fC7
X-Google-Smtp-Source: AGHT+IFbJH6iVjLwp8uJnuQIc1OwsoBuQCq0ElnDpSJ9Ye+j/v1LlJ0uv2hVXznwRiz6v7Cbww+2GA==
X-Received: by 2002:a05:6402:4024:b0:5d0:efaf:fb73 with SMTP id 4fb4d7f45d1cf-5deaddc10acmr1962398a12.15.1739344903041;
        Tue, 11 Feb 2025 23:21:43 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-5de4805a0b2sm9653626a12.48.2025.02.11.23.21.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 23:21:42 -0800 (PST)
Date: Wed, 12 Feb 2025 10:21:39 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ian To <onlyian4981@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] staging: rtl8723bs: format comments
Message-ID: <1052fff0-b503-4b47-9897-fe7c26c14126@stanley.mountain>
References: <cover.1739001527.git.onlyian4981@gmail.com>
 <b58a9f5b579e17f70681f8419b54d7d9864d1730.1739001527.git.onlyian4981@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b58a9f5b579e17f70681f8419b54d7d9864d1730.1739001527.git.onlyian4981@gmail.com>

On Sat, Feb 08, 2025 at 12:15:54AM -0800, Ian To wrote:
> Some comments were not formatted correctly. Reported by checkpatch.
> 
> Signed-off-by: Ian To <onlyian4981@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_security.c | 102 +++++++++---------
>  1 file changed, 51 insertions(+), 51 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
> index 1e9eff01b1aa..3281751436fd 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_security.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_security.c
> @@ -30,10 +30,10 @@ const char *security_type_str(u8 value)
>  /* WEP related ===== */
>  
>  /*
> -	Need to consider the fragment  situation
> -*/
> + *	Need to consider the fragment  situation
> + */
>  void rtw_wep_encrypt(struct adapter *padapter, u8 *pxmitframe)
> -{																	/*  exclude ICV */
> +{								/*  exclude ICV */

What does this comment even mean?

> @@ -374,39 +374,38 @@ static void phase1(u16 *p1k, const u8 *tk, const u8 *ta, u32 iv32)
>  	/* size on the 80-bit block P1K[], using the 128-bit key TK[] */
>  	for (i = 0; i < PHASE1_LOOP_CNT; i++) {
>  		/* Each add operation here is mod 2**16 */
> -		p1k[0] += _S_(p1k[4] ^ TK16((i&1)+0));
> -		p1k[1] += _S_(p1k[0] ^ TK16((i&1)+2));
> -		p1k[2] += _S_(p1k[1] ^ TK16((i&1)+4));
> -		p1k[3] += _S_(p1k[2] ^ TK16((i&1)+6));
> -		p1k[4] += _S_(p1k[3] ^ TK16((i&1)+0));
> +		p1k[0] += _S_(p1k[4] ^ TK16((i & 1) + 0));
> +		p1k[1] += _S_(p1k[0] ^ TK16((i & 1) + 2));
> +		p1k[2] += _S_(p1k[1] ^ TK16((i & 1) + 4));
> +		p1k[3] += _S_(p1k[2] ^ TK16((i & 1) + 6));
> +		p1k[4] += _S_(p1k[3] ^ TK16((i & 1) + 0));

These aren't comments.

regards,
dan carpenter
