Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC0F632AAB5
	for <linux-staging@lists.linux.dev>; Tue, 27 Jan 2026 06:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769495209; cv=none; b=nVPqx6DDGnYYjMDW/OrOG60OvF8we97PUDvov9tqWsbDi14EHU98A5bF9L65ZzZO7p2kK00eMxvJ1GmPInfmryP/l0ZDcwb0FUTjRItgemSb+NAKT6u3+8PQiYwFMDSw/XEUYUuaM/xJ8vkLVHI/Fq4XSYsya2hSYxI8dQ6F/nY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769495209; c=relaxed/simple;
	bh=mvGSzdFrf6ktT23Wvc2fARPlRM9iZ/TGeuMGvdnhMsc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uiiVUmqaBYWYqI19I1nFDvadhONHT3GF1pMYRocjya9KwY2NDER+tIFRP15Wt1LtZtcho04RpxC47JNiIYrqXx9X75fYhmBY8FrqM9GTthdUNnRL1IHY5Xuaph4swFLqq1dBFxXRAbceI6n0VHU3VghK7VvDWptQN6zB9LyoAw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RIx/MpOg; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RIx/MpOg"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-47f3b7ef761so37752825e9.0
        for <linux-staging@lists.linux.dev>; Mon, 26 Jan 2026 22:26:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769495206; x=1770100006; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cHceQO5mKauFppm7gw7JuG5uFaf5j0b4wTe4U6o8e6A=;
        b=RIx/MpOgtj9472e42Pr1X6j/KYCkRxgcI8SoXNfhbUnowKCH/BJwEOyH7LtiC8q4Ap
         CaZnH3Nrx3VPWix3+ps+YCS8jSsvX60v6XqdzcwbragvzGJRV91+hR8AXiR6Sps5ZYFx
         upNFW3/uCVwk+fhLsu8D2hEWP3Mde0nefgGE9Xm5A8Hc00nj85tjHjKqOFhTl68x7i7C
         rMv99dzEnlBtxP0NywIspIu7GFP9LkUsO/Vl09uI91iTDzH0RRPqe+hiJqPBAew7PSeA
         NhD2BVdXgQLaHh+tYwtnGnWJV5AymN0rJp8Jvn/dKO0vcLPQJJ5GE5G7rveQAvFpy1T1
         sNXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769495206; x=1770100006;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cHceQO5mKauFppm7gw7JuG5uFaf5j0b4wTe4U6o8e6A=;
        b=Mn1y5JBrMAlzJP9oUg4mYp0H5nqzu2Trobfavf3FeAkI8gokh2zl+ZswIvJukEg4tW
         1B9PblmojEAKVUGD8WUHy4NQ4iS8qDj66hFp5rLuOp9SgKs3a69av5hKs194isbpb84/
         BxkzQqCDuO14Qv+hiwCDTr3PkHJM0n3oVA1IEZM6lq0hQlqeNlW7ftqdVNtU4HGXeDUf
         yCTpHXvj9wlEGoPBX3h1Ql6qz2ftDx5Tk+3h5FtzuydyNQPunuWBVMx178eCj5F4Vvxk
         fn81s1K2uUhfdbooJ0KGyae0eXYXAX8pGovF0ReSivIegjNITjnGvHM+4FixBgMtzEXr
         DqWQ==
X-Forwarded-Encrypted: i=1; AJvYcCUwPrmzIt8ipoPznRyDk9CWHFnb1TWrosyhJU4RjEHE9NMXdh9Np5bn18+PB84CmSpbiy6oDmw/QFdF+2Om@lists.linux.dev
X-Gm-Message-State: AOJu0YwHUki5VqDMcKZTeEaW4Ie8PZgQZG4eUcIqoACYVUj03Zk5sV98
	c8Yu+p2480cHx4ssjOyyjNlLp8sQ8sbBWoenyg1c62oB0PjGpl2wIlnbHKNKYGdnpLo=
X-Gm-Gg: AZuq6aJlvN31ze0F+ki1XJtBVozV9o+cbZ53ydwRXbQUvb0GSyv0zmnWSyMAiobwecu
	RYg97j0VKn3TuqEPBLSa6U/IleF3LGctEsYAd9hf3ArGeiF+BGDRHcQvQRGtknx42sFBWpclEsJ
	a3h716srVshXZnkfs6kb7+z0dz+ep4owLHLT2lHVEc4KeKhdP0o3uF5lKQYhSt98pwdez2Y3Yf7
	rOL9CvD/uK7DBBZ08KdFjwo6uQw/tkFD0ff67ZwehLkCgUx7gSY0NiacsPrb5Z4XUghtVFADCvO
	9TcCwwr69WOHd/lxZRaTUCBsDOOSlkr4Q2gAV1WS6evDfodPZUrL3NF4gdZWhfehyTbuXOV1UpG
	gZxvh13dZp63rMXJbEMBfMfTfECE65FAlj5Huykj+kruthl0DxnpgAmrb1AVvBg5spe6lgxFRvb
	Q4MMA/fH0tvgCU3wE=
X-Received: by 2002:a05:600c:e40b:b0:479:3a86:dc1c with SMTP id 5b1f17b1804b1-4806a5bef0fmr3624545e9.36.1769495206158;
        Mon, 26 Jan 2026 22:26:46 -0800 (PST)
Received: from localhost ([41.210.143.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066be7730sm38491865e9.3.2026.01.26.22.26.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 22:26:45 -0800 (PST)
Date: Tue, 27 Jan 2026 09:26:41 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ethan Tidmore <ethantidmore06@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Akiyoshi Kurita <weibu@redadmin.org>
Subject: Re: [PATCH v1] staging: rtl8723bs: rename members of struct
 registry_priv
Message-ID: <aXhaoRMIlbRVgZui@stanley.mountain>
References: <20260126141543.2527-1-ethantidmore06@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260126141543.2527-1-ethantidmore06@gmail.com>

On Mon, Jan 26, 2026 at 08:15:43AM -0600, Ethan Tidmore wrote:
> @@ -750,7 +751,8 @@ s8 phy_get_tx_pwr_lmt(struct adapter *adapter, u32 reg_pwr_tbl_sel,
>  
>  void PHY_ConvertTxPowerLimitToPowerIndex(struct adapter *Adapter)
>  {
> -	struct hal_com_data	*pHalData = GET_HAL_DATA(Adapter);
> +	struct hal_com_data *pHalData = GET_HAL_DATA(Adapter);

This is an unrelated white-space change.  Don't make unrelated changes.

> +	struct registry_priv *r = &Adapter->registrypriv;

I feel like you did this to avoid going over the 100 character limit,
but please do that in a separate patch.  I use a script to review these
changes and I want it to be a straight s/old/new/ change.  Plus, "r"
is a bad name.

regards,
dan carpenter

