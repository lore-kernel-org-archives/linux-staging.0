Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 115082153D8
	for <linux-staging@lists.linux.dev>; Wed, 18 Jun 2025 20:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750278759; cv=none; b=ILqB95EeqmEcjrGuDeAFn92YkvfurbcfiT465exwpfRAboLEkVPp9vre9DnxU/ubt3IO86TlV03I7jRZRt9QpySfOAuLW8y8mRJbnvxm+8wcqfkB4Q7csYYWpkBPXP+xork8RwhGnKHbdDfNXkiNV7yKx008wS0xqTOGdOVlnTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750278759; c=relaxed/simple;
	bh=EGl6OGy4N78D26855h34xmMUVG4WDxjfWIM8e5e5wxA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f7bbg/dwFN6n0apuYM1MBzE3DFnkDss7b59FeHieux9bce6fmMCQhkrVnncrllOchB4GRzYtT55n/3ZIFWaG6fTfupHA5+TpvR7kc8D59u8KzuRIo35bg5dDoacfFYx14702OgShr/OfUNmcJx+W2H4BUkCFXUIZKc72abqgyqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KFv0Mx4P; arc=none smtp.client-ip=209.85.161.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KFv0Mx4P"
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-605f7d3215cso49516eaf.0
        for <linux-staging@lists.linux.dev>; Wed, 18 Jun 2025 13:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750278757; x=1750883557; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ntRmOHLH3xEiTEq/EoUk0fd3KFAgQFaOvUegSbTQK3U=;
        b=KFv0Mx4PXd7skvPcvzWVmikGOWOJtLPzK52RPR4d12PN1HboWhCSm/qyY7LNRN32lB
         YeUyX2KUPO3nt1XjPVHo7uAGwSVynktDiMw7o/0raN3uOfzq8O88SaOiPE1Hrhk8tEem
         Np+Ggh+yQwEZnSz12ybAPLBd1R5LH+s83/o64m+SONdJNpSpuQlqC9X68yNNcfUFfHZh
         OFQSkJ+NYbwMfilD0XUHuviMDOltfy1IrEm25pz9HCsJsXzTas4WnK6RpEoyfy89S32s
         /rKPep6Qs6X2jHUiXMc0TJd5nODYJ5NY/tehD0iOjsFmRZkl/Te3qNxxJj7X1wIT/9Tx
         sIzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750278757; x=1750883557;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ntRmOHLH3xEiTEq/EoUk0fd3KFAgQFaOvUegSbTQK3U=;
        b=JrbbvpGFk1M6Rf6CCCm6Dnst/+pMF5zQ/22lsvPR3cmn32f9oNRCfbn7tKGyHdTL3q
         cBalEfvRQCxaGeX/KacvU3RSQn0ngTlOmb934Cz0tkkuuRAu/kWxE94KVlczn9G2UnQ6
         D+ToIDnKGXrtYlCewaOjfRoFWdpPe3mlxDeaVPHgFInNHSGJd6UjSfZwhkqvftmfgn1j
         5K8RWTSWRmbJXXIdBLL8XI0MYJm+uN0iqlT1mngbchfqoZeGGmTUydTCjVkxpCOdDJLJ
         XNheF7mlQBfflN7o3QuETVr3AKXTZbinvxTsAlI5AqjCbJuIRBv+Ai9uxojSyaMUMany
         XAhA==
X-Forwarded-Encrypted: i=1; AJvYcCVZ7xZBE80QRmwLyqkxVetwU7z+cXcRcNdsEURk3vDrOeOhG/mNEsrpdo3ZeB6E6dVLP7ER1Bh/64P5xPSX@lists.linux.dev
X-Gm-Message-State: AOJu0Yx5Gl5A/BjLH13izSyGkK80KbZVKt+4ryMefBpx2Ef03PB0lQQM
	g7bEZDoGvuNi/fac/tXJ4rEBrxCAdwGLvuEyw/hf4IbBTcorZnkh6aPu6BBT8XDUUB2XffB/x77
	aUgtB
X-Gm-Gg: ASbGncv8byTv83cycEGJDh/Eakku2MC9ebKLsGUI7XmIzwnMY8Wg3s0Z0gEgZcFAcuy
	wXY+fAEGf312iOz9UDWC92jUbllxo0OLX2MRXux+QxwMJyOkuzmjYC5uInzPlYiMArv2oTzEsL7
	ePvw1dyh7uikMhUYqyNERaNS+Pjr2Z0iZLaNxt+BZNmB/pDukDWbkMzKi3c3mOF9RtiOyyk0/DB
	02x2qsQIBYDKu/qfYzJcCdd06KFxy6NCfWRV8AlaTNciszIpmCwCi3j6IlrIWYAjiZ5BjnPEv3O
	G6EY/3u2XTXA4gOzdB1b1A+S0F3v/dkXv7E3bfacFdcVZwhQGUUYL6Ry9vvM99wkCa7j6Q==
X-Google-Smtp-Source: AGHT+IHMgROsrVFIEvJPOP9WQYpCWl2X79did0vflyJuKo93NX6XGwmaPK2BjdghvhNLmAeACUSIyw==
X-Received: by 2002:a05:6820:2f03:b0:611:11a3:7cd7 with SMTP id 006d021491bc7-61111a37e53mr7437630eaf.4.1750278757032;
        Wed, 18 Jun 2025 13:32:37 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:1b3b:c162:aefa:da1b])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-61108da85f6sm1450668eaf.12.2025.06.18.13.32.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 13:32:36 -0700 (PDT)
Date: Wed, 18 Jun 2025 23:32:34 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Thomas Andreatta <thomasandreatta2000@gmail.com>
Cc: hansg@kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH 2/5] Staging: media: atomisp: i2c: hardcoded function name
Message-ID: <1e524a62-a180-4966-bc46-ced517fbe524@suswa.mountain>
References: <20250615231143.1558392-1-thomas.andreatta2000@gmail.com>
 <20250615231143.1558392-2-thomas.andreatta2000@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250615231143.1558392-2-thomas.andreatta2000@gmail.com>

On Mon, Jun 16, 2025 at 01:11:40AM +0200, Thomas Andreatta wrote:
> Checkpatch fix: use func instead of hardcoded function name
> 
> Signed-off-by: Thomas Andreatta <thomas.andreatta2000@gmail.com>
> ---
>  drivers/staging/media/atomisp/i2c/atomisp-gc2235.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
> index 857d7175942c..f35d1a16f627 100644
> --- a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
> +++ b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
> @@ -779,7 +779,7 @@ static void gc2235_remove(struct i2c_client *client)
>  	struct v4l2_subdev *sd = i2c_get_clientdata(client);
>  	struct gc2235_device *dev = to_gc2235_sensor(sd);
>  
> -	dev_dbg(&client->dev, "gc2235_remove...\n");
> +	dev_dbg(&client->dev, "%s...\n", __func__);

Delete.

regards,
dan carpenter

