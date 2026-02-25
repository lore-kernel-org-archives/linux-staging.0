Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACEE04C81
	for <linux-staging@lists.linux.dev>; Wed, 25 Feb 2026 07:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772002828; cv=none; b=gFc7bJvLshFsO/5YZomJEJ41jTf64wVN6GIxRnxBeXvwLankGfujLaH8iOhpnxSpEwINZ/+2nvFX1gWTL0ROrfsq3PoZuHvH0QJXnAisji39xFsuFcFqgyWGWR32y0HEcX4ZJIDqRDyjEbv1Gc9uFNJTgzXnwKZdwkQCn2dWTSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772002828; c=relaxed/simple;
	bh=vcJmK+0n+pAu+LoutcgCCXx5e/jsMREN6YUr9PObVnY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W/69azxfVGk7ZbHSfovfr8CeWMB3RZ6xBy4GVfzC6ajcbLzMRuBLABq6K19PGyZncDX/k2i7HlrliQn0XsizY3fRts5ATZ9dql/Wx/E4Yy3Wq3sb4NXyZOjJFy5GI0WNC1GcrNlHJyUJIURjUHldEtf/eK2FvSFvx46xOxU17KU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Q9lNq7uB; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Q9lNq7uB"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4362197d174so4025934f8f.3
        for <linux-staging@lists.linux.dev>; Tue, 24 Feb 2026 23:00:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772002825; x=1772607625; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XrgllbZC0hX2Y8N4kX0e2uvpdghjGsY3RfCGNWJzKhs=;
        b=Q9lNq7uBPhLvNSFwS32zlg5gNomd8fZ9GJmG8ozQ7UAbJElEJAVkohw3e3V2ZducHc
         dQ8Rc5P5DabuN3a1xKH1YsyLF8hQWz1mGD1TGBptPGkIuX77AlhdfCRmovmCuMQQr0VV
         5I/zaDZ2c4EELODf91GtMvOGGFvI2rCsmWsWy+gfnTN8zs0bIol0JvINuRnD94Lxo2M8
         oa8GYYSYQFGTPPMbgsEsa9IMTt0sSRCoo1ippqTn3GBOL9H5Bf1isklR34/UokxoVt9n
         IugvTdBgghUhspvzoOAggi0QDlFqAIP0XdUyN3kSLawdsZZWetdhbcvUIKV2tHqlSQ5d
         0RTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772002825; x=1772607625;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XrgllbZC0hX2Y8N4kX0e2uvpdghjGsY3RfCGNWJzKhs=;
        b=hrofzl9gQnQKMMZvhBpv7/0ctWGAuOKwAymzM0nMJ1DsCh8YWVOHvhdJ89fEzZo16n
         k+Z7GKZujHm60YTT0bXOZYhbhl8lSUDH6sJqnzNHso6fHvQKCIKSHkZq8UomxRkHh8vR
         QGSzzOzArb1jaljeO4mXVZG/odMu15Em+LmDGhdhXYgs0ehIHPsbPsO3XZXkFgIhzTf7
         3ojDO42RGVkZSnMxsMu2N0C0GDIevyP1Jh7nNOpgexsQRA+X/Igspv+yT2SV+Y27YmLI
         XywbEk7L4PiQdDGbY1I6N4m5RomSYGhImSO7KGZvSAaRgubWGWQ+eWQN9R8Dol3KNET5
         q/Qw==
X-Forwarded-Encrypted: i=1; AJvYcCXH4ktN1dqho8vuH5h/UazwcvxHogfIoc68m9aFzzAJ4pLl8lJjUFgjg5xXvhPw3RjOAy0c1zc1+RPkMBUw@lists.linux.dev
X-Gm-Message-State: AOJu0YziK0/5WR8HUCyph2JmnToyYSdZwWhLOgkuUdB3M/v4l0WbOKXw
	55CNubwsh8Wz7KdNyg3hHKxNXtD+5ImJcecIJYUb0LCCI2sNSkApSVh1DhYGn9HykozpQHq1o1p
	g+nko
X-Gm-Gg: ATEYQzwCXuyPcK+rSLhUWmLkuxVvbZY8s7hZzOJlGd+R7jXTpng1qv9Fk9OX2Dy1IHb
	FSq6syuCAgWBgKAZB1HrtdLofTG3nK10xnamxEaxvrpydHhTQoxcODmrvHbLdAK/Q89sq/l0qAp
	jwIZ3/fZl4p0CCR0GkYKebjd7lGw81kZYYcuY8TA23WU9sNGWJDhjTIq60JIby6aIPa3OiF/VfO
	3l+/g5rxlg2KsCiZmXmjFmGwEill8YivpffUF6XO9YNwVdSa/UCs72h5DW1gWDaH9LXHbRLDqde
	b1poUjVVub9EV/6wKrPqQfR0PcgMpniQ7Fyu6Rx/3Hn435dtguN3Ab4PHqqeukbd350yUJxyFL+
	84KjJllQb7MrXrher47Dcu3xU/dXycjymK7cEOoJdAinzTM77fd2NTtZyQFLyLYHwlZbeFvIeXI
	hbW0G/ZX7ilMY3dJHluVUyade+4K+A
X-Received: by 2002:a05:6000:26d2:b0:439:8aaf:33fb with SMTP id ffacd0b85a97d-4398aaf3477mr7451916f8f.22.1772002824818;
        Tue, 24 Feb 2026 23:00:24 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970bf9fb2sm32491902f8f.1.2026.02.24.23.00.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 23:00:24 -0800 (PST)
Date: Wed, 25 Feb 2026 10:00:21 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: luka.gejak@linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 12/21] staging: rtl8723bs: hal: fix line lengths in
 rtl8723b_hal_init.c
Message-ID: <aZ6eBdaItadBCoug@stanley.mountain>
References: <20260224132748.12336-1-luka.gejak@linux.dev>
 <20260224132748.12336-13-luka.gejak@linux.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260224132748.12336-13-luka.gejak@linux.dev>

On Tue, Feb 24, 2026 at 02:27:39PM +0100, luka.gejak@linux.dev wrote:
> @@ -998,9 +1008,13 @@ void rtl8723b_SetBeaconRelatedRegisters(struct adapter *padapter)
>  	rtw_write32(padapter, REG_TCR, value32);
>  
>  	/*  NOTE: Fix test chip's bug (about contention windows's randomness) */
> -	if (check_fwstate(&padapter->mlmepriv, WIFI_ADHOC_STATE|WIFI_ADHOC_MASTER_STATE|WIFI_AP_STATE) == true) {
> -		rtw_write8(padapter, REG_RXTSF_OFFSET_CCK, 0x50);
> -		rtw_write8(padapter, REG_RXTSF_OFFSET_OFDM, 0x50);
> +	{
> +		u16 state_mask = WIFI_ADHOC_STATE | WIFI_ADHOC_MASTER_STATE | WIFI_AP_STATE;
> +
> +		if (check_fwstate(&padapter->mlmepriv, state_mask)) {
> +			rtw_write8(padapter, REG_RXTSF_OFFSET_CCK, 0x50);
> +			rtw_write8(padapter, REG_RXTSF_OFFSET_OFDM, 0x50);
> +		}
>  	}

I'm done reviewing the patchset for now.

regards,
dan carpenter

