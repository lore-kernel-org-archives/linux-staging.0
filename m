Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36A8E326946
	for <linux-staging@lists.linux.dev>; Mon, 15 Dec 2025 06:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765778655; cv=none; b=hiBjoWRsRX38khEa8tmykBKlc9VjMDuBP6JfiZxkdpHxDkNlazrvo6u+HBeRVQxHz/oox7WCZ6hghQqQyOuDTi+vXMsvFuWc1t1bcqZStFVXqE9VtpYrT/KlcpybJKWd3pOFwZsApIx6cEQedsO2lQdgvoSSdbD4108bIaSX3K8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765778655; c=relaxed/simple;
	bh=4F7IPDEpmaFrVLMn02smTZ0UYQwCvehgCEWZQX67zu0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UMHNdaYmgGq+YjXQb8+oQ4qy0n6uToDi+CQJFT3WacDNMpw0v0DlR2C35qIHKNgllXKxGDil9LkdlBe2IHC+E0VSePPkoXWmkDxe0N84yZm2Rxr/WpKJWk8YaTRDCLBvJELLHqHqCBMzrP7iANFrlKtP5nd5D/iv10j3NKEVayY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pb5XLyKK; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pb5XLyKK"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-42fb2314f52so1259467f8f.0
        for <linux-staging@lists.linux.dev>; Sun, 14 Dec 2025 22:04:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765778651; x=1766383451; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=arlTyocsJXy/LUdUqXV4o482As9ubD7mGnAFCPK1b04=;
        b=pb5XLyKK1Xm9IHHUQzoXFYqdkTrRyAcPyuW0Zh65jnlgv8wRu10IWUCWvBv3AMYwR4
         j4TyKoGajmjlmrsp1LRoKHwdSfrH+i1wLjolENKMLtcomk6FBQW7zjZVuQRMQ3v2KF/1
         Or03mqRbcIlj1oTqR80Oe4BwL9irfaJISeBdmMiX5eRrOcc+FTH59PIgNYA4yCuRUiIM
         H/60crd9nCqYZSWSaD8zXdldcCvGjp61SR98PWmwIJb9gTHCU8vJKejGDboY3pVO8ht8
         81SO19g5mFBBr4dCDiE0ahYUa3ZMpuALrgXxAMBrQ82AJQuiYt1DdGBEmRdPV2dMyKkn
         GN4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765778651; x=1766383451;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=arlTyocsJXy/LUdUqXV4o482As9ubD7mGnAFCPK1b04=;
        b=CEOvP8sg27RFj4c0uzN5O8WC51p69wWNgeruvoW67nOOY0QoThPp61fZMUBXtXz8vJ
         vi26+hHZSupAn+Ab0eJBj6oDsHLnkSBSUTDFGXYuB1sMOrfPz4OHpolV/UIZd8WNRsWc
         vZqOHdV9NWPwdzy2xrAFXsDVcdQcouvBL/f+YQpPCZ9ZyhjIrvqcLTTqg+1Dj5deOtvF
         PWD7BnvB8On+sEB+sbThmUU4WfCl0yuSUJi0t4UqCvH9Ef9VhTqhjeGk/1E02ZWICmwH
         frEJWoi1PrTdITOz80AmwDGYYWMC6i1CFzEBPvqPW4RZp/qjBSxoazH9SFC5ZWQul6B2
         NXJA==
X-Forwarded-Encrypted: i=1; AJvYcCW7JRlU8wS7QyYwxz0eIOYMv3muxaX3sjm5Rdvuc7rGsZzPH8OLkCgYkLn7SoAjQJ+lpefbzl7xuWDqD7KN@lists.linux.dev
X-Gm-Message-State: AOJu0YyY2h4TJcGbDiIY2n4ggQwTu00SabP5Fl++GFss7xwIseIdQdKd
	nx0TuR4VfuZYQhEOMgC3SAkd26phfIIMlrnmYEa1c8tvQlHBDVEHb9kXL8/C1/u00cQ=
X-Gm-Gg: AY/fxX5n2ctNJYKz1WUe7ViPDeMtol+ENEchb3y+KRh0u0XZWJX44+rewe+UQFgALwv
	SOZmdRDu8KJRnzbW/M0OhomHd7FnNkMNitGLk49Y0RYErcu0AQhb2FhCfxRFY2m0dmXDjoQB9p2
	7TS7BEcm2miKcNVY+78HzPk2wnGn+GveT+CM4eDL9DBaQM+ACdl/v2LXyBCS3i/zeU3AwaHQaar
	QvWik8JLjCRbVjacwFF5xpLSWS1eccMvMISoYdR3OBQYiJS0pLgKY8JT0coZGGghibSM65xXuqZ
	DXKKcGGFMfCcjbLPwTC8rt/jDnSx6KnOaebKmk9vu/hOmTphrKsgVx81GAXWk0+/JLULbZCEn9S
	9Lt+GI6La9eIEl6FWcLAz0AmYtzTq3VUWQhFUGaQ9w99062pyEUZTZeQuulE1ydE+vM57tmuQTq
	XR2GeV5Q/PF3VZjH4p
X-Google-Smtp-Source: AGHT+IEKDFCT8gkJa8RFXLp7YKvDnPkpvyFtcKj+7AC6mdCnUgOnKilIu4LA0YlaXkJcpG+JwzXSQA==
X-Received: by 2002:a05:6000:2f83:b0:42c:b8fd:21bd with SMTP id ffacd0b85a97d-42fb46e3985mr9980145f8f.39.1765778651298;
        Sun, 14 Dec 2025 22:04:11 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-430f7475895sm8512414f8f.33.2025.12.14.22.04.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Dec 2025 22:04:10 -0800 (PST)
Date: Mon, 15 Dec 2025 09:04:07 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Zixuan Dong <dbeidachazi@foxmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, straube.linux@gmail.com
Subject: Re: [PATCH] staging: rtl8723bs: Fix block comment coding style
Message-ID: <aT-k12fYkV_FtoTW@stanley.mountain>
References: <tencent_9CA8125E2399DA1ADBDBB8FF585FC95A3606@qq.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_9CA8125E2399DA1ADBDBB8FF585FC95A3606@qq.com>

On Mon, Dec 15, 2025 at 12:01:28PM +0800, Zixuan Dong wrote:
> Fix the following checkpatch warnings in os_intfs.c:
> 
>   WARNING: Block comments use * on subsequent lines
>   WARNING: Block comments use a trailing */ on a separate line
> 
> Signed-off-by: Zixuan Dong <dbeidachazi@foxmail.com>
> ---
>  drivers/staging/rtl8723bs/os_dep/os_intfs.c | 18 ++++++++++--------
>  1 file changed, 10 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
> index 6ca6dc548805..cd81d9e4a3d2 100644
> --- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
> +++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
> @@ -934,14 +934,16 @@ static int netdev_close(struct net_device *pnetdev)
>  	padapter->net_closed = true;
>  	padapter->netif_up = false;
>  
> -/*if (!padapter->hw_init_completed)
> -	{
> -
> -		padapter->bDriverStopped = true;
> -
> -		rtw_dev_unload(padapter);
> -	}
> -	else*/
> +/*
> + * if (!padapter->hw_init_completed)
> + * {
> + *
> + *	padapter->bDriverStopped = true;
> + *
> + *	rtw_dev_unload(padapter);
> + * }
> + * else
> + */

Just delete this dead code.

regards,
dan carpenter

