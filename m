Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BC56150980
	for <linux-staging@lists.linux.dev>; Mon,  6 Jan 2025 08:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736152143; cv=none; b=HsJ8OAGY/5+ru0QKEhVpxwto8lzoCRktGeLO0XIzOJfi7PsdoNwJyDaAqsSH/pbKZNXKR9hPtbyhHMCAOrlvNODFjdSZROiShERkJG7GllDiIXkyZCYpJ1+7itgJ8cP/Yitnjy2N37+CzSOgq1hbsbUBzGZQ6uPbp+JlysihITg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736152143; c=relaxed/simple;
	bh=M5hUhat/bAuUMc8q55/KJv/JnbBudv+hp3ctOvU0WHw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KS3rryY8JyT4BBqTwfS0LepC7iIzHGQIUpOJ8f2S6f33GpT6qdD4g77NXalsgp+heE0i7ebehbMfvNBXsFjUu80rVdf3Z4TYwW9KD4d91a/DE/mitNbDZTTpGC/zh4oySrRyeamym5sRKpgjCf+INaHkq7dZvUjY2wU/5Ul/RtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=W4/SdS1W; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W4/SdS1W"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3862d6d5765so8258277f8f.3
        for <linux-staging@lists.linux.dev>; Mon, 06 Jan 2025 00:29:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736152139; x=1736756939; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UDxsIOaiaJxaktdlNg4I9YAwK+RVYjasmpkTXj+LKDM=;
        b=W4/SdS1WVa7fgcnuoiiD/ffBBArbW/GaYkRF+hYRCFuYeAiB5bFItDz3+PJaKMBM8N
         MDbSbrufbEJzfmqJPfnlgDOpqDOal7z69GuuQ0NniOxOh4EKz5cEzaBBK2998+1I5BLr
         TQXkz8/MDapociC8J/4gSh6ODt2byXzQX7w743aSZCipUFP5csivSeCLvR91LbKlW2lU
         yak7QQ1Wr0NeDB+LnxrKthSrgMgHyzIr9+MdTdZDMcxOW9WR48yn0qOptvrKB+KUiQND
         aPl5/T207MpC0ipXYnp613UOJKxYpOVzxrG9ngwwheJjdkV8O3Nf7paLZcL/0ZPhHFCW
         NYJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736152139; x=1736756939;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UDxsIOaiaJxaktdlNg4I9YAwK+RVYjasmpkTXj+LKDM=;
        b=oHiyummdvMeffoonb6f9gDrU0Sb46pfv7rF1iRduAeDLzM0FsMhmpyLmQm6FslQdgc
         OR0qNzopaox9DqeeQTAydU/zUNR4Au3nnF3YHAGFCibs6g7TbGayPdvP3ICixKgRJL+g
         eIo2LljLp1fixpysUVN7ySNCrGJ/pvzP9zWLbFykAhbGwKpg2uGebBIap4U2LlS+lFuO
         yVn1e/hHMXUDtWKTMs7cKmP1OZlAGhzqzas3mTEctUJv1pISUb7psyn0nZvvAhs8t9VE
         FTY9r8aYw4FlLFQXqBMXRtiCczRWYrW+JdSR/KPxK3RIMavkrd8W/EYDPrHdv+3VG4B/
         LUTw==
X-Forwarded-Encrypted: i=1; AJvYcCXR+TyrV41A8osC8mm5tGyQjeJMuONWf4W1BoHNqwOvwbg/NK3fCRVTTzCDaCGY/RmUDmXMDdpVywOT6Sbm@lists.linux.dev
X-Gm-Message-State: AOJu0YxsFlxQC0gOuqfNMWpcYx+Umg0wNcl41Fw9lkoBaDByV/rTMm/o
	Yq5yzH0pAE9NQFct10r+RqhCZnj0ag4kk4n7oY4/Qu/xRWDp2f+fepAQ79FtYWc=
X-Gm-Gg: ASbGncsIM4Lr2wHW1l8WMv9SgA8Dg0yvyt4sh686EfctYclmrzZhxvfwAF3Zh3pjBGY
	phXkfbRAoJ1+BkFHipvT996XOHcqND8fNGYClwONTmQUqcBpuQLSmFFHExgjojlFLJY7u/Y5iQ5
	82exqthyXmsYfVejV/6dtWd+81jzCvS/GvSQv6ALdpOli4LxY8uFoHLUFOC4pS7Ub5I4CmOe3UN
	YpYaj0fYWoWZcNAAJ/rCoTsmghtUf/h25ZII+0Yu6SpwFXrSm9oSrZ5v7sThw==
X-Google-Smtp-Source: AGHT+IHJZErPKbdmzIpBYh1QikYHGJ3nST5M+FNfn5aNkfTTsqIMFPTb13dTvpPJsfRjBNoKswvCsA==
X-Received: by 2002:a5d:6486:0:b0:386:5b2:a9d9 with SMTP id ffacd0b85a97d-38a22408e42mr55544487f8f.53.1736152139171;
        Mon, 06 Jan 2025 00:28:59 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c848a47sm46737989f8f.62.2025.01.06.00.28.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 00:28:58 -0800 (PST)
Date: Mon, 6 Jan 2025 11:28:55 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Cc: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH 1/3] staging: media: max96712: fix typo
Message-ID: <2e9a2faa-29c2-413f-aaa9-c8f2dfced28f@stanley.mountain>
References: <20241219150644.64507-1-laurentiu.palcu@oss.nxp.com>
 <20241219150644.64507-2-laurentiu.palcu@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241219150644.64507-2-laurentiu.palcu@oss.nxp.com>

On Thu, Dec 19, 2024 at 05:06:41PM +0200, Laurentiu Palcu wrote:
> Fix a typo in VS_LOW expression.
> 
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> ---
>  drivers/staging/media/max96712/max96712.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/max96712/max96712.c b/drivers/staging/media/max96712/max96712.c
> index 0751b2e048958..5228f9ec60859 100644
> --- a/drivers/staging/media/max96712/max96712.c
> +++ b/drivers/staging/media/max96712/max96712.c
> @@ -182,7 +182,7 @@ static void max96712_pattern_enable(struct max96712_priv *priv, bool enable)
>  	max96712_write_bulk_value(priv, 0x1052, 0, 3);
>  	max96712_write_bulk_value(priv, 0x1055, v_sw * h_tot, 3);
>  	max96712_write_bulk_value(priv, 0x1058,
> -				  (v_active + v_fp + + v_bp) * h_tot, 3);
> +				  (v_active + v_fp + v_bp) * h_tot, 3);

Huh.  I had expected this would be a bug in some way, but it actually
works fine.  #MysteriesOfC

regards,
dan carpenter

