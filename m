Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2C13224891
	for <linux-staging@lists.linux.dev>; Wed, 26 Nov 2025 17:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764179387; cv=none; b=LLlNFgT0SJoEvAMmmPqzIus2TzA7qANAkCM+UoZwu8sdzWKnxQqJ5rb33nMNKLnA8GOJCmeJMT18CM4rfna4aHitzDtP5NpCG90TEiKA2aqV0ikHwXat4mw543ciOVNcMJFHsrY20DmGa+4yLo37+l+moYbRsJGKfN4UPpGsVuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764179387; c=relaxed/simple;
	bh=EZRgUZjkuoZ3cQ6aAEafNzlykTDgpLExKuhA6htK22E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lB4tLPir8KjQyQJ+OQqF2++AFIIloedkoVLlCfPLidAg9MdD1AGkD/SzC7r+3LudEhqyLv3bVbFltNuu5IAv0FZJsIIksqDpBAVxQ2oFZeD8bDtvSChd5xH2UPEQMLXTX7kFbfuhmGcq+KOzrd50RsJ5wI5v0Wy9cMjLKen+QL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KaHyg0Kx; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KaHyg0Kx"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4779cb0a33fso68422465e9.0
        for <linux-staging@lists.linux.dev>; Wed, 26 Nov 2025 09:49:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764179384; x=1764784184; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/LOZIxc4c+5C8jrBtkGFP92aBtdLlWqGsR9z3cYxzug=;
        b=KaHyg0KxSaxKYC6M07Jq/Z6+prH+A5euMkqI0I6ab2Eaxe4da+5HR0pfYooy0O2j3Q
         /JNR0IWxf0QwRM7Jxhx8ZaZcQHVvKMwrrbzhGdaTvgZJgVr0PuOs8RVML/yxqGfx/gAj
         WPtv4NaL2c77tCNdl2+TwxibUkjvH5lfSSuHzZjZAnbjNSSMKIrXcjsmVuGswOA7mVhJ
         INTewIC/Ej5KH8brKxnrA1HcR1Hw9gPIzLPJFXwiaCD0FB+QC+N38Bn6LvZVfx7zsJwW
         AsWI2YWd35FbD8NRR6WchvKZtq83uAjalHYMRxRgSnxC1jF/+DIwXZZ+pb8B3ACaMkgC
         R+tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764179384; x=1764784184;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/LOZIxc4c+5C8jrBtkGFP92aBtdLlWqGsR9z3cYxzug=;
        b=i4v3hBLvpPU/jnBqsfSgDzecnFMmYVfP4rkzK0hQBCxuauvUjKC8Q6JbdFzrXdIALo
         6ShwGG9FkjH/bon+SpLWgwTuTQbiO6X5yiISUxgDYZvUG8aZW9hbxfIFKotkNyPzp+zO
         A3gNg0Iz/3Jlh3QiraZiMGX7DVqU/Hi+UiLQ4cKo4jeZYm0Xh3k7GaR4FjJywzJjipZj
         xwnLIPd8r5vvPKqNxVN/xgI9Xp0Q2tnR8F9u+/GG6JPzEG6uKELwiqrx3ZQABlGUVi78
         ZnW4Jkya98YRbK5TYulxft31fqjikw66VhlLdPEYZiY54jlG40cX7lb5G9uWwC9G4sFa
         GV2Q==
X-Forwarded-Encrypted: i=1; AJvYcCWEnoDPFAFsG7TX0xBWPPb9gp6BStwSE58s2U+Z1H5mp+ikusen3qel60JafrE7U4GFOK+FH7e35L5mix3P@lists.linux.dev
X-Gm-Message-State: AOJu0YzCC5/hTIG6meX4LiPCI7fL/aPS+HXt3ujgOwgU0cBj2M3LEb4X
	RsClwHr1oltpGIVAkdD+2zGMa6BOM0VXyeCpjQaKaYUC/MMJqKigs74BdzU6RMBYTOg=
X-Gm-Gg: ASbGncv53b0N6t1ahV6OxAuhztsXD4yJ3AVChFNbmF0vCTcb1VG2ta10F5qEETp+6hI
	jzKXMzydBNcXe99y9mmH1OgvZJ+YkBJsm/3TP/uAou1yITawX8X7Sk/EwOkELMs0LsIuNth0AsJ
	2fnEqQCuVuL48t7uztL6+iIoYkKzv7HY9g6fq8qZTeEBQcdp0W2pYYpxQ0pHvwd64mre5TAbqO1
	ykvcEp6zib4yzmSVX7LJSJKUXjU1X02/P4JHiNA0Ljph3k3jrklEydOGTAEYCraBcfMpyAnzgGI
	0tmuF1Ig35DujZ0H90+zAYxNAu6dJNezn2XMvYRDOWRhN3cMOLcyObnUACRsmL0dPJtm9RmcJv2
	IDmOScHagM4bt37hM3yO8q2Z+PiEl/c5O+guBUvjT7JZsHMPYZen6VfRSiMukD1jVuwdkC+VU7l
	aOn0C65PpE/l32gi0=
X-Google-Smtp-Source: AGHT+IFh53QIi+oxLq7ptVsKtwjm1PxcTE77Pu2H4HuthrAKa3ytxneiA49pMvTvJJmFtJEUGhPXJw==
X-Received: by 2002:a05:600c:1909:b0:477:b642:9dc6 with SMTP id 5b1f17b1804b1-477c020137fmr201952805e9.34.1764179383830;
        Wed, 26 Nov 2025 09:49:43 -0800 (PST)
Received: from localhost ([41.210.155.191])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-479040d3c72sm49384375e9.6.2025.11.26.09.49.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 09:49:43 -0800 (PST)
Date: Wed, 26 Nov 2025 20:48:30 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Pavan Kumar Yalagada <pavankumaryalagada@gmail.com>
Cc: parthiban.veerasooran@microchip.com, christian.gromm@microchip.com,
	gregkh@linuxfoundation.org,
	laurent.pinchart+renesas@ideasonboard.com,
	hverkuil+cisco@kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v2] staging: most: video: prevent probes during component
 exit
Message-ID: <aSc9bvj9is1c-FUB@stanley.mountain>
References: <20251126155910.32694-1-pavankumaryalagada@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126155910.32694-1-pavankumaryalagada@gmail.com>

On Wed, Nov 26, 2025 at 10:59:10AM -0500, Pavan Kumar Yalagada wrote:
> @@ -453,6 +455,9 @@ static int comp_probe_channel(struct most_interface *iface, int channel_idx,
>  			      struct most_channel_config *ccfg, char *name,
>  			      char *args)
>  {
> +	if (comp_exiting)
> +		return -EBUSY;
> +
>  	int ret;
>  	struct most_video_dev *mdev = get_comp_dev(iface, channel_idx);

You've added this check above the declaration block which is ugly.

But what would happen if comp_exiting is false when we check here but
it's true by the time we get to the line which says:

	list_add(&mdev->list, &video_devices);

There would still be a race.

>  
> @@ -553,6 +558,7 @@ static int __init comp_init(void)
>  
>  static void __exit comp_exit(void)
>  {
> +	comp_exiting = true;
>  	struct most_video_dev *mdev, *tmp;

In front of the declaration block.

>  
>  	/*
> @@ -575,7 +581,7 @@ static void __exit comp_exit(void)
>  
>  	most_deregister_configfs_subsys(&comp);
>  	most_deregister_component(&comp);
> -	BUG_ON(!list_empty(&video_devices));
> +	WARN_ON_ONCE(!list_empty(&video_devices));

When the race condition is fixed, then we can just remove this.

regards,
dan carpenter

