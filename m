Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69FF5179956
	for <linux-staging@lists.linux.dev>; Mon,  4 Nov 2024 08:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730709820; cv=none; b=G4e5bCyIL1GjWNslgnhnBiuZXywP9g72wQbrnhFjpEKX8kE2tsyCGZpYGnQFtQX2+iOZhoBjlHx98Qw3J5fYjN8WrD8RbfcD9BTu7TEOhjmmhGS9ZT+KfIdp98fCoF+nfgtxqbPcGtPQQ8RbUeAWW671QjCPlrdowg8DH4/12+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730709820; c=relaxed/simple;
	bh=H6+7n6GItmZK1OTaix+oW7p6zjCT1F+cbCg+29+lQaM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f5TvUM7Paz3zQbYvJk0iQ96dPfFxnx+R2eZSO29lqOWUWMUfEsf+T40OWYICaKpFVtEtJ3VoCG7HsM+1ahbCZ3mEvqE3tM4u5nkAO8SSXbfvzZdonGirQh2QNpbGGNHLs7Ny+AecagpczMM8PCvKKywS6yGuT9T8okkwrDnU0+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nF8w4Fy/; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nF8w4Fy/"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3807dd08cfcso3397935f8f.1
        for <linux-staging@lists.linux.dev>; Mon, 04 Nov 2024 00:43:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730709817; x=1731314617; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6mzcZ40JgGm44C7M2p4ensyZcq29vuN3HSXmBxErva0=;
        b=nF8w4Fy/swxrHuupSWMYHk0VR8eQaS226igNsMyLbYBiiv+YhWwTn1ZVLGvVlvYTRt
         TFdNSlX/IT89wxgZIh0SCm4gXVHfaRlQeUMPclecpXbRnni1HnT5/ulQ3Xp1bv/f1zW7
         dYvn5g2jSvosPihAV0r/4I8nl0HoeV+FImu3uLJfgvsDsgU6uz6lsmO8yH+dVcMLXlrE
         +GCpw7dNI5JiIn/Z0QsZc8laNAc9maAEwOVJxJn0A5kvIktgZNfMHW6jKSDni5PUX+5M
         s5UfhFjO/4c9HAL6Wb7/ZMT36gCl2EZ36fYiAHnbkHkp12d2nkAzdb6oojVwof+a7Wpy
         2NYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730709817; x=1731314617;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6mzcZ40JgGm44C7M2p4ensyZcq29vuN3HSXmBxErva0=;
        b=fNq0DM2ES4xFcTjHd5oYQA4NBL/sNnFLUbBS/aW4cNzMgV+vofKPfwJwDEs5GynQxG
         HyuhFyrsdv4d7B71xOTsRBQvVLfbbnMnRxL57+iI40eAbxPt9jlLKJIuBu6jOzl0qS9S
         Jdi/C7QoZtstg5D1TcxCuUSyjxWh46ETymTuObjYNiJBEoOKHfAgOGWrJjrKYYEISUIn
         sUK2lk6Hsbf0qkMAUtYoWJY7rqgQ3Hsj6Wldy9GO8OEo6rQ40TEmUUn0LVXTUHT6PDAE
         BrH1X2qmJx/hVeVxOqgyXZYTvCxVGV1VbjsaJZHo61AwyNZafWxCxhAHRL1XwjA1nXMb
         Ui6w==
X-Forwarded-Encrypted: i=1; AJvYcCVYcFAx5ao52vyZ7EXjkb5X2FF0G26/euS49VsNjJiWxwroqih9cR5vGe1R6t8z51eOTvIpQaSKW5qLBHWN@lists.linux.dev
X-Gm-Message-State: AOJu0YyeUhyb1fRI+iCAOUulrZaP9PWkyuFEFkEqhHoBewfosN7GjGEF
	B8g/KUyvAYNTABjDYCno6l3Q5MtFtR3ejNMwqTx/fwB2EJhZVKS+XHWjpLwwl0M=
X-Google-Smtp-Source: AGHT+IH4gn7Kr6XDNOtojQ9jzVG+iu2feJjnJyfKdYBnr/oKuNjDRwhQLv/fQ/43mkl4gpiiDrmIoA==
X-Received: by 2002:a5d:5a13:0:b0:37c:fbf8:fc4 with SMTP id ffacd0b85a97d-381c7af3be3mr13124947f8f.59.1730709816810;
        Mon, 04 Nov 2024 00:43:36 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c113de0esm12595552f8f.85.2024.11.04.00.43.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 00:43:36 -0800 (PST)
Date: Mon, 4 Nov 2024 11:43:32 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Dave Penkler <dpenkler@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
	arnd@arndb.de
Subject: Re: [PATCH 05/11] staging: gpib: Remove GPIB_DEBUG reference and
 update messaging
Message-ID: <4c4aba7e-c873-4a93-9311-bd2e2bbcd8e8@stanley.mountain>
References: <20241103212617.13076-1-dpenkler@gmail.com>
 <20241103212617.13076-6-dpenkler@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241103212617.13076-6-dpenkler@gmail.com>

On Sun, Nov 03, 2024 at 10:26:11PM +0100, Dave Penkler wrote:
> Change pr_alert to dev_alert
> 
> Signed-off-by: Dave Penkler <dpenkler@gmail.com>
> ---
>  .../gpib/lpvo_usb_gpib/lpvo_usb_gpib.c        | 69 +++++++++----------
>  1 file changed, 34 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c b/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
> index 4c580137043f..796c3a5be545 100644
> --- a/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
> +++ b/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
> @@ -68,11 +68,8 @@ MODULE_DEVICE_TABLE(usb, skel_table);
>   *	      At module loading:  modprobe lpvo_usb_gpib debug={0,1,2}
>   *	      On the fly: echo {0,1,2} > /sys/modules/lpvo_usb_gpib/parameters/debug
>   */
> -#ifdef GPIB_DEBUG
> -static int debug = 1;
> -#else
> +
>  static int debug;
> -#endif
>  module_param(debug, int, 0644);
>  

Put this in patch #2 instead.

regards,
dan carpenter


