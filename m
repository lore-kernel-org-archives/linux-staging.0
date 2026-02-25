Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BC421885A5
	for <linux-staging@lists.linux.dev>; Wed, 25 Feb 2026 06:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772002394; cv=none; b=Fp37rgMHXngE6y+HT8Scmx5F3mmHMkoF+lp8G/GqK76gFMMFhGsNIj68g9X1Xe7b9Ak/Tz2fuik4HiGJww2N6tZhdh/ME6mtF92kHpzv6tDCaiSlOQ++sAqgcvEJKJivV+XTNKWUkN5RkeHPzyOrXVdn0BJ3No6KvmgAGz1QnBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772002394; c=relaxed/simple;
	bh=azvkRvoKVIujDs9VYbjx0Lm6jj7ex1Oep2d6TkuiZ/w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e9Jp+Tk4S/VQpf/f+jVCS82IY+z0AnaoOHwm5YUqXYBB6xZ2ZpXvvgEaOieJNs0Q7XE4NwxBwc5NkMzAiEJxVaYZ5pHOUz/BCJVYI0S25gp0Jpm/FPEjid+JT+fv/OVW4dL4dLYZxP54kFFnh8GHTYKcNicHSY4BvOyuJLvXqMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pU4D10Wh; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pU4D10Wh"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4837f27cf2dso53619935e9.2
        for <linux-staging@lists.linux.dev>; Tue, 24 Feb 2026 22:53:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772002391; x=1772607191; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5wc3KJWYApISVQvsGQIs+vU4jAtmVvWzMB+DkB4wxgI=;
        b=pU4D10WhwZgKe8T5PLT9pSHxT5m6RyMQRNWN/uhnVnQ0TPnCM3RU2cexix5bNgQ34z
         YnlQS5kt5g07Cyv2cDPc98LsDUSZdpoD4ns4xUjYwhVTWYz6BT6K4g7WbHAMhcXk20vG
         SA4SUQDu+Vb5UIFBSSa7oH+9JvDCL7QiWX1cEI82z/LF5Sy3b0uQxYcdMLcT0q7b813y
         qXoM5r1fB16CUCXbUkE8xdrU7aRmuBlR0GcO9WiC3/LJMgEW8rqs15bUU4wrtSLnMkjh
         0RNKCTSlBQR6kPYWzfa1aBVgH0DQb7jvAFetVqYSB3RE8Nv1hGH2JFnWOf3HWDMb2Ayc
         2wsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772002391; x=1772607191;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5wc3KJWYApISVQvsGQIs+vU4jAtmVvWzMB+DkB4wxgI=;
        b=pKyBFQ09z32tVbXXy0co/dtaxA+mzG2onzmOczxmLJ+Gl0KJfVv/1eC52T3FfP4OsS
         iWjYQ9HCnVQIuUZ41BOqUhLcfhxGjSxSM4Ex+TMx+gn/vpDwKZPs5uzjquXmdkIkrliF
         Pitk2pmP1xpruc8vGhz/giMnCJquPRprGtF9LC6jNFeFFRWTnsYndAh26+NkcXAA7Y8Y
         truzkVP/M5tcyb76MJms3z0Hl0oBnnQnETw6Yd2xV5GyMMK13NRgSPWfmNWJNcIGnkJl
         8CYR/WeWuvzwkiJ4qLugtr4rVW3RARwMrMcaUsfKyjuTk05X2YZz0QjZ2cuB4LeIr91H
         XZrw==
X-Forwarded-Encrypted: i=1; AJvYcCVFu+okn/91RDeM24/IK6ahjFuRJz4UIQy9EwZZta9BaLegivxD+sjh8Lu41we7sUvtTKltwiSwNfFbSFWD@lists.linux.dev
X-Gm-Message-State: AOJu0Yw6DuUuQcW2iuePvBGZEQ1DX9Tiw0STERcHaJpwDxxntTpYlRNs
	fmICDMC5mrDLot0jZS1n3Twi/plSK7uohzBdAZkZgDVyCywJjYUVueS+qZ7fyUJm0L3GXadYpw2
	EA/Jc
X-Gm-Gg: ATEYQzx+2MdvMpXzbfqF2zXpgbBjX90an2N9lA2aVNTxpCq4NknZJAagQ3R5jz2VLUK
	mgEjF4/M+kxsg4M6kEZ3GSjVWLbWyfGZQNewFkGwn6GBQx2T2l3QR1l/Vsq+JemHzw6UP8mFwf6
	Vgum8ntFCYdTdYH/TfTw+2UvjQ0MjCNMz3UJao2oQcKX/LGqdHObDZ8onZWFwC/WY92nfXW6Daj
	649uhulir+AozeAQcRH6sZ/wVHXlEzpxmVGsUuvHSm4QlaE/tZEyMc7lS9DBRmoihyqANFCOICW
	ZgPiSBJJsX0yhUxX6uwhKyRCFnGVIat7+zGKCSIW8py7o2mtnP+wJZTYk6In0ylzRdIVOJj1ppT
	Uh9OdAfXvlKXPVe1I7Pe6mpRoWIgTpftcYipMKiOhzv6SxSV6NbYO9YVv2+/BoXOJrKiZzhRcMP
	k3HLDsLusYshVIiiKc5TdrR74xPKKG
X-Received: by 2002:a05:600c:8b88:b0:479:35e7:a0e3 with SMTP id 5b1f17b1804b1-483a963d64bmr217228425e9.30.1772002391289;
        Tue, 24 Feb 2026 22:53:11 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43986aa2f84sm9319188f8f.7.2026.02.24.22.53.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 22:53:10 -0800 (PST)
Date: Wed, 25 Feb 2026 09:53:07 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: luka.gejak@linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 07/21] staging: rtl8723bs: core: fix line lengths in
 rtw_wlan_util.c
Message-ID: <aZ6cUwEuDraVc0i2@stanley.mountain>
References: <20260224132748.12336-1-luka.gejak@linux.dev>
 <20260224132748.12336-8-luka.gejak@linux.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260224132748.12336-8-luka.gejak@linux.dev>

On Tue, Feb 24, 2026 at 02:27:34PM +0100, luka.gejak@linux.dev wrote:
> @@ -380,10 +383,14 @@ int is_client_associated_to_ap(struct adapter *padapter)
>  	pmlmeext = &padapter->mlmeextpriv;
>  	pmlmeinfo = &(pmlmeext->mlmext_info);
>  
> -	if ((pmlmeinfo->state & WIFI_FW_ASSOC_SUCCESS) && ((pmlmeinfo->state & 0x03) == WIFI_FW_STATION_STATE))
> -		return true;
> -	else
> -		return _FAIL;
> +	{
> +		bool assoc_ok = pmlmeinfo->state & WIFI_FW_ASSOC_SUCCESS;
> +		bool is_station = (pmlmeinfo->state & 0x03) == WIFI_FW_STATION_STATE;
> +
> +		if (assoc_ok && is_station)
> +			return true;
> +	}
> +	return _FAIL;
>  }

Wait, what?  Please, don't introduce random new curly brace blocks.
This patch does it several times.
> @@ -466,7 +477,7 @@ void _write_cam(struct adapter *padapter, u8 entry, u16 ctrl, u8 *mac, u8 *key)
>  void _clear_cam_entry(struct adapter *padapter, u8 entry)
>  {
>  	unsigned char null_sta[] = {0x00, 0x00, 0x00, 0x00, 0x00, 0x00};
> -	unsigned char null_key[] = {0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00};
> +	unsigned char null_key[16] = {0};
>  

Better to do this kind of thing as a separate patch so you can change
null_sta as well.  Otherwise it looks weird.

	u8 null_sta[6] = {};
	u8 null_key[16] = {};

Except I bet there are defines you could use instead of 6 and 16.

regards,
dan carpenter

