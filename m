Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7743115530C
	for <linux-staging@lists.linux.dev>; Sat, 13 Dec 2025 14:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765636797; cv=none; b=eH0KrdhDxqcrgCOFbRNpE5+90uh8s4yqqzgtzcGcU2jkkPcgPFD+4EH3v6q4ZEWguip7acv9Y6iQyi9tg4PpOgmiYuMIBJWVnbNDsmPxoirgaKYhcIGkYC10p5WxxjjdyhLnpds7hnaGcHbFje17TACycvxiee/h/uP8Hp0w0WY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765636797; c=relaxed/simple;
	bh=TO0Vc04SBOWQX2FHQXYSAfgCIPgdhpi+DqfEsyORZJk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oJu+UileMGpSFdWVLRaH83/Ob+962vbG6yJePd62mMnEbktbo1U3KWY0L92KOU5xcnl37ekUepq3fXpC6s7+AvtNKTznmYO89QRYSbQMp79uSJgzXmUs3GJWUGrImJVz8mnF8H0wSpWpOWYQQTyusdygXuaL4wC8NbHvUJg49v0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K73I5YGq; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K73I5YGq"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-42e33956e76so1007738f8f.3
        for <linux-staging@lists.linux.dev>; Sat, 13 Dec 2025 06:39:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765636794; x=1766241594; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VvAGfKFGF3RuaayUTSdoZFybLUCkoSlhrVT1qkFOtyA=;
        b=K73I5YGq88jzZ/8JCfx5x15MNMQ9LUrJFkjeYF7Xj9OoXfde4h5LNDHResn+Z9HEpD
         ELNovZfYkRvN1IOukfRfVnrGoMBtOFuOVyA5d0bilQWH4uKY2m0tLP0IJKb9zJgFWD3N
         gkT3dKnW1ZS29SKLqAmj2wJUOlliEZnCGTa2R4uH77FLQlZr/JklxoApNoJZwjgZg0tl
         F3wYypmL/aIk3NNUZDkX/wQc+b/pytTtgw0P+eQOv6aeNdFmusEM9v6P8KAHkY6RWCUl
         qVSQhanxa+uXey6JXQPrwFQbNI0OSdr9wRBdYJk++GdGYkn02K8/pFULsgO/uAchmi2B
         Ol7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765636794; x=1766241594;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VvAGfKFGF3RuaayUTSdoZFybLUCkoSlhrVT1qkFOtyA=;
        b=ZTjYZHYZFdnGNu26gUpk3Sda335+skJ9Yo02y0N4/9b+K8iBe9MCm92UC1xJbGSDpT
         YaY7FSMcgeDuz06htsdD+crSm8+/UuxQJJBAT1mdGsF30w4V2H+v6fqyxlwmwiWt9QPq
         6IVIzfi30zSHA7NhUKiVmbVSgIR0jI700Rv9uwe1K3GP25y094SaiOfE+++4i5YQ5Bhq
         55Z9NXKVUdMJOgu//S9YXOgb7WAD4ogsx8/mGJvlHue+2aWKyMl4CqqSSYUNul3ELt+T
         umDanbIZgTa5eG4sTwLH+NVK2ZfE6mBz/mQ7XONlCCvK/oHIBgKZntfzJyklWIQcXQvo
         Prxg==
X-Forwarded-Encrypted: i=1; AJvYcCWNeCHQ+sbFpYEq4/cH8/f27pQH0dfx6JqIcd7XkhlsWAJgSx4M/21fTV0+Rv9grOhlvGpvJe0bbgT9Wqr5@lists.linux.dev
X-Gm-Message-State: AOJu0YxJD+AmsqUtf+VpwYyzy4N8hM9h3Ob3Ylaqnb5vU+oqYT7NDTRs
	eOTVf0fFhOAVDfzOYFjKjsQT1sbs/6GBYUcDJVMFFrKV/0b9A5vkzPkI
X-Gm-Gg: AY/fxX6isRoqRxUm/v/mUAW4gX4Z2yTQd2ZwHLH2iqLCvxNISdL5Cc1m8f9xSJV8w6f
	eDFeCRO4brCEPxVM6UuHcrU9WezBnsbDaoN7KIm0C+QprDG0R2Lou25A/XIk2LH9eglrvy4BOIl
	CVEAJwEwOofCEsiPNptyKd9jlnLKTj33Qk2qZpd/HZxu0D+qwhWEZ28Zhg0RW0raKI1U/QnmIXS
	HX5DuUCXiiv+rbZIOXe5LAA8VxfW1lpJJ1si/ixizlgvUUEyhsm9CBXWXpP2ZkhRpGDD4IHZny5
	UWE1IX6/PkMCRLQqYdOzmyRq0lkt9DtxZehfHBMq1599p0MUIy0gFekN1ugz2CmDEmcKPZdQFXW
	G5W8BjUx8s4mzr/HCbLjWzeBCVq0mg1gzNXvAnQSwNagZPsVDWOJxMUWTh3LJ0lFVQr5ioX/9go
	VqRAk=
X-Google-Smtp-Source: AGHT+IEC9Iq4EaKhYx8qmUbYnuJvccsA4JfuYihpWx87kTUBAYRcJpYOGlPBXGZQc1wJV/sFNjFt2g==
X-Received: by 2002:a05:6000:430d:b0:42b:4219:269 with SMTP id ffacd0b85a97d-42fb44ed6e6mr5912605f8f.41.1765636793620;
        Sat, 13 Dec 2025 06:39:53 -0800 (PST)
Received: from egonzo ([2a01:e0a:9ad:d3b0:ec4c:9f30:1dfe:440a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42fa8b8601csm19547827f8f.22.2025.12.13.06.39.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Dec 2025 06:39:53 -0800 (PST)
Date: Sat, 13 Dec 2025 15:39:51 +0100
From: Dave Penkler <dpenkler@gmail.com>
To: Tomasz Sadowski <tsdwski@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: fluke_gpib: use kzalloc instead of kmalloc +
 memset
Message-ID: <aT16t-dFDMg7cR2M@egonzo>
References: <20251127101055.8771-1-tsdwski@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251127101055.8771-1-tsdwski@gmail.com>

On Thu, Nov 27, 2025 at 10:58:49AM +0100, Tomasz Sadowski wrote:
> Use kzalloc() instead of kmalloc() + memset() to simplify memory allocation.
> 
> Also use sizeof(*board->private_data) instead of repeating the struct name.
> This avoids duplication and keeps the code correct if the struct name
> changes in the future.
> 
> Signed-off-by: Tomasz Sadowski <tsdwski@gmail.com>
> ---
> v3:
>  - Move version history below "---"
> 
> v2:
>  - Add proper commit description
>  - No changes in patch
> 
>  drivers/staging/gpib/eastwood/fluke_gpib.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/gpib/eastwood/fluke_gpib.c b/drivers/staging/gpib/eastwood/fluke_gpib.c
> index 3ae848e3f738..2b6ba7882dba 100644
> --- a/drivers/staging/gpib/eastwood/fluke_gpib.c
> +++ b/drivers/staging/gpib/eastwood/fluke_gpib.c
> @@ -853,11 +853,10 @@ static int fluke_allocate_private(struct gpib_board *board)
>  {
>  	struct fluke_priv *priv;
>  
> -	board->private_data = kmalloc(sizeof(struct fluke_priv), GFP_KERNEL);
> +	board->private_data = kzalloc(sizeof(*board->private_data), GFP_KERNEL);

Good thing to use kzalloc here but using sizeof(*board->private_data) will
not work. sizeof(void) is 1 not the size of the structure.

>  	if (!board->private_data)
>  		return -ENOMEM;
>  	priv = board->private_data;
> -	memset(priv, 0, sizeof(struct fluke_priv));
>  	init_nec7210_private(&priv->nec7210_priv);
>  	priv->dma_buffer_size = 0x7ff;
>  	priv->dma_buffer = kmalloc(priv->dma_buffer_size, GFP_KERNEL);
> -- 
> 2.52.0
> 
