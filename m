Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 344A5288C96
	for <linux-staging@lists.linux.dev>; Sun,  7 Dec 2025 17:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765129823; cv=none; b=DeJ4KBlPF180P2DRSw0PWgmccv1wNvNEB/tWjgY0ObRZ9jzNJqT8/l7Ieu6PLC6+Wrgt1QuycFT4v05jOs6K4/S9afw/hvIMGQCgVBCtaIeg3fb05774YC1/flWv5QuX9VqCqjg+T1gBXE/OIpBKLyygn5pmR7lh5cvB1T1IogQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765129823; c=relaxed/simple;
	bh=IBFPLCjhGGvMFJegtcX4oznfDUee+DbLiWgBzqYQMy4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=h8mIyThc7vWgDeNAVhzHmK+xXRN7ypUEGZ0j+9FtWl6TyDw/Wk49flee7baRG/tCsmG6yoyCiBjFgxOZb3qlJu6oN+dBsusdIbzaIjttbjPlXoNFoMfRmaFKjWVzMcUc2CH1iVB7KwkQ21XE4lHJVyuJjv8d99GWNWEugiE0HOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kHNVqN8r; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kHNVqN8r"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-47796a837c7so32391655e9.0
        for <linux-staging@lists.linux.dev>; Sun, 07 Dec 2025 09:50:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765129820; x=1765734620; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sGhqMLrl7jq1mQkEGm9nNElvVPJo9GCqoqYpic3Bhy8=;
        b=kHNVqN8rmaPcHDDx4stP2FGVsA11VSsov5/oy9woUpGQ6rnlnIzLC6p8mwEm0gAonJ
         tgsLroj5NYvyJ0DrrJ36gwU6AeYLEKo1XVkRvwVEAiCU+W2NLh8W+HM7NfgogPKwokQV
         YAyLtMdFfycQhOVSS4jrt4HftdCdctF0zfMeILqocewTijFsdHwu8FUOWGSAaSJqgzF+
         rqguNtPo1nnPxBeesG+LM7ajJ3M5sOc5N3NgTgdXuPWQJ1BrfzxRYgp1sm9+63jCL2X8
         7sMi7iX0nYJAJqI4Pa4Psacabk6oaBDPuQ+bEJ6tCX2vX41RAFDs/xdgBGe0DS7foj4+
         Y6bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765129820; x=1765734620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sGhqMLrl7jq1mQkEGm9nNElvVPJo9GCqoqYpic3Bhy8=;
        b=DOWuEkqJga8zl9fNfXEsiBfNEgi03ZenfrGb3qYwWmHWLHOml+aZHZA5fEgwXtTY4n
         u+dHDZZmanIFBPKezmsvT+txgiplqfmI5IqHEn6oeBBB5AXFhWy0gzBvBk5ncoVW0bbo
         3nMZBcHTEzXFGt2dHLco/+04+FZ6jwesjY0t2riKCZaz2XdkWkwJrsWF9o812iX8boA0
         0OyY3d4KP3ylydh0gkue0SaBG2ANHw9XfbYz/nXeWBTFUBQSSETdqUH6eDX6xrisnsn4
         UAGbMGQCPRd02or/Au1itPpEz3QPDVxY4XYsS4qHMErkVQ/gQ1N7S0gwqmNrtxfox02E
         1oqw==
X-Forwarded-Encrypted: i=1; AJvYcCWE4q5xzzQPqwDxFqvfLmSsI7Oftxt/+BrG5uTWPDfPDyTrwNMtfI2X747kh5Ba74DS8vvo5K1nM564bbQ7@lists.linux.dev
X-Gm-Message-State: AOJu0Yxhv/u6HACO+s9DwG3+YjO+kipxwOy0zsiXDph+tCAFoykuK64t
	ycXg92idkC4PxxXusvdFIFs49KlCVGC6qOgPLt3ob4yWJ+KfmsU5OGk5zCZ6vg==
X-Gm-Gg: ASbGncslXEjqb1Xiu+pvuK58+i8GjUPzZyOb4SzopYUAw6CqqNO7ZeQ67pcUimN9f4T
	oEZIFCMXRrGQFny/s3IVadkjakw4cUZl1K/Scz4W5OmXXIKqfOE1Pk80a3VDk8QobmA0hI8WAm/
	9NyW7/xHWM0gR2Jyw1nPpzaoyfqUkZpvtqizzRwFpAmm1q1npQIMUaaeOyz2LXjgpffGggJgpZa
	zA8HL4pxi9fjWKLescWbvRUyWBLRRvmedzjo42FYAUwQp3M8qdYlx9Yk8b297Ogwtx3VTDFKp/Z
	toxaKtniM2FT1b5K2LqgrVYjjqBMBdc2kFAXmbyAIzFT4DhN5v+Xnk2xni6ZDrG3Abw9hu5eQaF
	pLVYgMz7Zw85E9ySRPrnfwrHrVF2QIHaynEoNMz/OXigrNFI1NO76Jtds+lJ17M/OiARIBeZ2Nn
	cfoFdCULSfsIWpGAvOuCMmLXXezIFEjCwlYU7IlXfNSy98o4Snkrw1
X-Google-Smtp-Source: AGHT+IHP+TcqzHfxZeLRdMcC4KJI6IxL6qiw45Rxo6f2yB8f0/P/pCOBJuLNp0SaEBBjvz1hp/Mlew==
X-Received: by 2002:a05:600c:3b9d:b0:477:7b16:5fa6 with SMTP id 5b1f17b1804b1-47939dec75bmr61463915e9.3.1765129820061;
        Sun, 07 Dec 2025 09:50:20 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4792b02e7fbsm104976165e9.2.2025.12.07.09.50.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Dec 2025 09:50:19 -0800 (PST)
Date: Sun, 7 Dec 2025 17:50:18 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Dharanitharan R <dharanitharan725@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: vme_user: simplify bus number allocation
 using ffz()
Message-ID: <20251207175018.43b29806@pumpkin>
In-Reply-To: <20251207164317.4835-1-dharanitharan725@gmail.com>
References: <20251207164317.4835-1-dharanitharan725@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun,  7 Dec 2025 16:43:17 +0000
Dharanitharan R <dharanitharan725@gmail.com> wrote:

> David Laight pointed out that the loop in vme_register_bridge()
> is effectively searching for the first zero bit in vme_bus_numbers.
> 
> Replace the manual loop with ffz() and use BIT(n) for consistency.
> 
> Suggested-by: David Laight <david.laight.linux@gmail.com>
> Signed-off-by: Dharanitharan R <dharanitharan725@gmail.com>
> ---
>  drivers/staging/vme_user/vme.c | 15 +++++++++++++----------
>  1 file changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/staging/vme_user/vme.c b/drivers/staging/vme_user/vme.c
> index 2095de72596a..45381e677475 100644
> --- a/drivers/staging/vme_user/vme.c
> +++ b/drivers/staging/vme_user/vme.c
> @@ -1765,16 +1765,19 @@ int vme_register_bridge(struct vme_bridge *bridge)
>  	int ret = -1;
>  
>  	mutex_lock(&vme_buses_lock);
> -	for (i = 0; i < sizeof(vme_bus_numbers) * 8; i++){
> -		if ((vme_bus_numbers & (1 << i)) == 0) {
> -			vme_bus_numbers |= (1 << i);
> -			bridge->num = i;
> -			INIT_LIST_HEAD(&bridge->devices);
> -			list_add_tail(&bridge->bus_list, &vme_bus_list);
> -			ret = 0;
> -			break;
> -		}
> +	
> +	/* Find the first clear bit */
> +	i = ffz(vme_bus_numbers);

You need to check for ~0u first:

 * ffz - find first zero in word.
 * @word: The word to search
 *
 * Undefined if no zero exists, so code should check against ~0UL first.

	David

> +
> +	/* Ensure we have a free slot */
> +	if (i < BITS_PER_LONG) {
> +		vme_bus_numbers |= BIT(i);
> +        bridge->num = i;
> +        INIT_LIST_HEAD(&bridge->devices);
> +        list_add_tail(&bridge->bus_list, &vme_bus_list);
> +        ret = 0;
> +	}
>  	mutex_unlock(&vme_buses_lock);
>  
>  	return ret;
> @@ -1787,7 +1790,7 @@ void vme_unregister_bridge(struct vme_bridge *bridge)
>  	struct vme_dev *tmp;
>  
>  	mutex_lock(&vme_buses_lock);
> -	vme_bus_numbers &= ~(1 << bridge->num);
> +	vme_bus_numbers &= ~BIT(bridge->num);
>  	list_for_each_entry_safe(vdev, tmp, &bridge->devices, bridge_list) {
>  		list_del(&vdev->drv_list);
>  		list_del(&vdev->bridge_list);

