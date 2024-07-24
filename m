Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABBE82837F
	for <linux-staging@lists.linux.dev>; Wed, 24 Jul 2024 16:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721837798; cv=none; b=uxKgnW018wimsvCPUXQdXIc6jCT4LceVYm+mZCD7AeYYkKJwFy1DmJtMksv1zaBkzwoC2SUJDJ8EYcJViVguiz68S/tXnWbwqfsyhKw4/fDlw5gI8SUaJQXE00KZiGW5WsvsOUpRN2n8Pj1sJAEs0FUPaqD/JiR5MEDD+UVXzr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721837798; c=relaxed/simple;
	bh=y7Zu/VsvUJKkKsJYtAY7jVUswzsmYdNVgKKzorX/Y3E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cDaEjNco+5UxW72OYxvC2jfijdhzUMy1WQkhFa1C5Iz7EI47r26GUb12dRD7gWNDuN9k2BWw+Gzf22bZqgepaE9iAPaqCiub/3VIXEepx/XCM3Tt2BeAc4h2NvOHIvuADHW9qlCeEw1trxr1WozJviOM2YFK9jHKmmhhBY2JUl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ySzfPRIl; arc=none smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ySzfPRIl"
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-3daf0e73a62so2511786b6e.0
        for <linux-staging@lists.linux.dev>; Wed, 24 Jul 2024 09:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721837795; x=1722442595; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kKtTi6J8HEB5OCpZPgPDE9GsqwJqSTtYQpQ+3Zz5BCQ=;
        b=ySzfPRIlbr9UAUO73rbzoy+cd8MwkGO3lFGZmjLbWuOLNI+0I+Q0lCttuQqjhwYObj
         OmUAjPP8MlkkopjFo+KtYjq6MDd+92kkQMCxu5IBYnuPASgEmBtMMAIrx0KGQSsb5FE/
         A33vU8f5UcUNjUfueUK5P5wq8FGgmHqbovjElZoFxJ/oVGSaE+C/ejuBbRweEc6xGCsf
         /Plx5DgVdXkHeiSfKu1sgvB7C1SIJ7G52UiQYsIRSmxF0EdYVZf7jiUPhjYmFdoSLZLk
         i0koQGgtl0WUTMf2ivLG3XvcEtQaxMjNMJtdo0zaZe1niFuEC6J7hzPlN21cDKCEkbaB
         hZRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721837795; x=1722442595;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kKtTi6J8HEB5OCpZPgPDE9GsqwJqSTtYQpQ+3Zz5BCQ=;
        b=ar5ry2j4bE4hPpEaC1KU6E8maokQjOC9ldMuBvlUzgsqYBl6z4lMRe8GLh0eo0wLOF
         KQBZpFSv1V9CCTlE96KPnKPDzYOTVT1c4ogLSIqIsUfgUV87PbBEukOrALD7pT6Zywnr
         /u3thTC77xcG85UdAkpMfKac5uoWGZbi0FoGJJXKwDeqmo1KfUyYoTtN0eo7pbgXw1V6
         N7z9nbgCCwdZskCWsBMDvsA4QpILpDvjXzZDxnfDcNUsobVOy4bNOLeE9aaknEVtDc9z
         zMIs7ksK1+3thrVtmzcBglva0siDZco/Nv/UugB95quJhg2LfZjnJJRBVepVFXXcGELi
         Beiw==
X-Forwarded-Encrypted: i=1; AJvYcCWV97qUetuz4iWuRIpuSJ9Yjh460vOiLHYK9qbOQl4ur9RSCCNMFLAa2r9ETtcMxhj3/YtqfCD45h6G5alJE5U0q4CJ8u+DbJowt42hyA==
X-Gm-Message-State: AOJu0YxFnrf54Zyuvkcv4HDsIs4lIO+G35Zdl6Zl4I7H+slup5DnXisW
	EatDsICX8cMXmU0qM7orv7bc1ATlcKWa2CriMcdVMjBdkOcO7c/UfOZZ48uRpD4=
X-Google-Smtp-Source: AGHT+IGL4mtwKdB32MSZ63+5s36lNy2nWouLYk/6/hosNV4rfjK0ChpvX+4v525bHV4bv4C5KpXHyg==
X-Received: by 2002:a05:6808:2002:b0:3d6:71d4:e90d with SMTP id 5614622812f47-3db110cb758mr36565b6e.50.1721837794749;
        Wed, 24 Jul 2024 09:16:34 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:c022:78f5:6e53:c844])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3dae0990123sm2442748b6e.30.2024.07.24.09.16.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jul 2024 09:16:34 -0700 (PDT)
Date: Wed, 24 Jul 2024 11:16:32 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Marek Vasut <marex@denx.de>
Cc: linux-media@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
	David Airlie <airlied@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Helge Deller <deller@gmx.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v2 2/2] media: imx: vdic: Introduce mem2mem VDI
 deinterlacer driver
Message-ID: <5aab2235-76cd-4fa6-8957-aed35e83a95e@suswa.mountain>
References: <20240724002044.112544-1-marex@denx.de>
 <20240724002044.112544-2-marex@denx.de>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240724002044.112544-2-marex@denx.de>

On Wed, Jul 24, 2024 at 02:19:38AM +0200, Marek Vasut wrote:
> diff --git a/drivers/staging/media/imx/imx-media-dev.c b/drivers/staging/media/imx/imx-media-dev.c
> index be54dca11465d..a841fdb4c2394 100644
> --- a/drivers/staging/media/imx/imx-media-dev.c
> +++ b/drivers/staging/media/imx/imx-media-dev.c
> @@ -57,7 +57,52 @@ static int imx6_media_probe_complete(struct v4l2_async_notifier *notifier)
>  		goto unlock;
>  	}
>  
> +	imxmd->m2m_vdic[0] = imx_media_mem2mem_vdic_init(imxmd, 0);
> +	if (IS_ERR(imxmd->m2m_vdic[0])) {
> +		ret = PTR_ERR(imxmd->m2m_vdic[0]);
> +		imxmd->m2m_vdic[0] = NULL;
> +		goto unlock;
> +	}
> +
> +	/* MX6S/DL has one IPUv3, init second VDI only on MX6Q/QP */
> +	if (imxmd->ipu[1]) {
> +		imxmd->m2m_vdic[1] = imx_media_mem2mem_vdic_init(imxmd, 1);
> +		if (IS_ERR(imxmd->m2m_vdic[1])) {
> +			ret = PTR_ERR(imxmd->m2m_vdic[1]);
> +			imxmd->m2m_vdic[1] = NULL;
> +			goto uninit_vdi0;
> +		}
> +	}
> +
>  	ret = imx_media_csc_scaler_device_register(imxmd->m2m_vdev);
> +	if (ret)
> +		goto uninit_vdi1;
> +
> +	ret = imx_media_mem2mem_vdic_register(imxmd->m2m_vdic[0]);
> +	if (ret)
> +		goto unreg_csc;
> +
> +	/* MX6S/DL has one IPUv3, init second VDI only on MX6Q/QP */
> +	if (imxmd->ipu[1]) {
> +		ret = imx_media_mem2mem_vdic_register(imxmd->m2m_vdic[1]);
> +		if (ret)
> +			goto unreg_vdic;
> +	}
> +
> +	mutex_unlock(&imxmd->mutex);
> +	return ret;

Since it looks like you're going to do another version of this, could
you change this to return 0;

> +
> +unreg_vdic:
> +	imx_media_mem2mem_vdic_unregister(imxmd->m2m_vdic[0]);
> +	imxmd->m2m_vdic[0] = NULL;
> +unreg_csc:
> +	imx_media_csc_scaler_device_unregister(imxmd->m2m_vdev);
> +	imxmd->m2m_vdev = NULL;
> +uninit_vdi1:
> +	if (imxmd->ipu[1])
> +		imx_media_mem2mem_vdic_uninit(imxmd->m2m_vdic[1]);
> +uninit_vdi0:
> +	imx_media_mem2mem_vdic_uninit(imxmd->m2m_vdic[0]);
>  unlock:
>  	mutex_unlock(&imxmd->mutex);
>  	return ret;

[ snip ]

> +static int ipu_mem2mem_vdic_querycap(struct file *file, void *priv,
> +				     struct v4l2_capability *cap)
> +{
> +	strscpy(cap->driver, "imx-m2m-vdic", sizeof(cap->driver));
> +	strscpy(cap->card, "imx-m2m-vdic", sizeof(cap->card));
> +	strscpy(cap->bus_info, "platform:imx-m2m-vdic", sizeof(cap->bus_info));

These days strscpy() is a magic function where the third parameter is
optional.

	strscpy(cap->driver, "imx-m2m-vdic");
	strscpy(cap->card, "imx-m2m-vdic");
	strscpy(cap->bus_info, "platform:imx-m2m-vdic");

Shazaaam!  Magic!

> +	cap->device_caps = V4L2_CAP_VIDEO_M2M | V4L2_CAP_STREAMING;
> +	cap->capabilities = cap->device_caps | V4L2_CAP_DEVICE_CAPS;
> +
> +	return 0;
> +}

regards,
dan carpenter

