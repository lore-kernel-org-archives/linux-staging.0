Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7D3E309EEE
	for <linux-staging@lists.linux.dev>; Sat, 29 Nov 2025 12:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764417991; cv=none; b=W3q6CsYzrk3iOvPUx7yF1CM/NXT//GfT3BL8OJslAf8ob1cF1J+KesHJ4wQ+R1uOPG3SItj9UddwS+73G0i6OCFjv5A4cBLXSDKXo4Pz5n9rsgwIRkIsJnyAaDOdKrRczQPArlptI0+0gCtfNanSKu+iPSTrXVnfQ/idogmsclg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764417991; c=relaxed/simple;
	bh=OtdDpl4Q79uxy/txE0dp5UAv3CKH52SyoOzS5bBQcDY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oMxoLoXSjah9rSzLMKIgbh0ugbdoxSaNgR7DxwEGW4E6qQSMIh2HmeCkpANYdbLbWklQTdHyKhST8M2eAAvBr6OPc+4p8x51wFrEMf2FegOs0WvN1bomev5zSzKNO++aL5rilF/ScChKMXPqWe8ajQvLbRAYU9Ky73dssO1dMzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PBT+BCsa; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PBT+BCsa"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-477b91680f8so21693845e9.0
        for <linux-staging@lists.linux.dev>; Sat, 29 Nov 2025 04:06:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764417988; x=1765022788; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nxsNPC5DUOJdpEIyAUiIrRx7gc0XcEcK6k1s8tu3gE8=;
        b=PBT+BCsaqdOSjldaEM6RM2NktB1d8xjxjFR78NgIe4Qse0176lmQb5LatF2WMd7awJ
         8CTnN/0KCUIAmuAQ4Dso0Us9Sqh+y0lkkoDGE7a9BpsOK5jiywWgBRRCwvYUwywZnYWQ
         Om1s3tDcgTnr8cNImOeipZ8cf0VbbysoS6Vp67edYIcEzmn4UVGe9aZaF+mJYasYH6QT
         KCJ2L2tODAV54pvz0ZiR3gvs7jVwonNFlhjOsnS0rC0lOvcTTsR378o8NH0o7YhpeIKE
         sYUW3lef4QLf0M7FN6tCrnict7qrgMl3DM7bB5Nh7YplWGzda4y+kh46DjCJfMkutHeH
         u5bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764417988; x=1765022788;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nxsNPC5DUOJdpEIyAUiIrRx7gc0XcEcK6k1s8tu3gE8=;
        b=t+sI9vNtTe1fj5NXssd757IAD3v97l6orCIzH1Zi8561QBH7TLLjTLaXJuXPrSp2b6
         jQKfL3DKGUdtbneYSbDMMlZM7WpQLvGn0aX1VwihmdbWRx+6nJ5rdXbmG4PW/mpLFWhz
         1Fmwd+5xP+XqdMqzhOJsZsboNWpwAoISczMs9o7G9VxmevQnFqmJeUB7C9N3LIxcci6q
         iOaqj/bMhP3w/PEqtB5poSGosDpu4r6wepSEwxwb221dkzEKRUS/5szkDT53U7gX+n04
         JYFePIIlvgscLDTplkuU+bdUx2Mq4W1WLfvtZX5qRS3AesV25VGbLcWLqzqQgvWVUag5
         6gvA==
X-Forwarded-Encrypted: i=1; AJvYcCVMxpfxja/tm6O+dNetDNfnmSCgZUeRDLSH5+7ljrnMkh/J+Dctg0gCNwdGkh5Ubc3DNnUnLOq+Y3IqRp1L@lists.linux.dev
X-Gm-Message-State: AOJu0YyVSdRhRw8t5WpPdShFCktiRFy9yKpCBhlblu5+cfJGZQPTVbR8
	HPtsKED0IRZeyouOddmpZfl10Uye+sSQpgUgHKB/ltgH//oepDI3TgAG5na++Hj6YlE=
X-Gm-Gg: ASbGncuoSmHIYTA+LJ5MSTT77m9trCO4a3qT1GLKfxQD39dLoc8RaR3zIS2KJQgkBXJ
	GlvjA1vyM0eXtW80QKdjEhyBnqLbjulIS7gg1I5pVhDnifLz3/XEqCOKy8aG57tqlQgvJpKMpr5
	A620Mu3x6c6L4pq8D2PK7dVA3J9HslebKfjAqiZCuM/N/5A0VswX3pmsH1P27rXf53gEsC8U/3A
	yXjpDYjDDf71RE2YNVJWz5auH2DJwvjivZoWYa7C5FrMOnOzTsAGcTXoLtPx4j8UEdC+jlGwDOD
	MD/xtBZP4owQzjdsXdOXaCxjLTdG0YdzzeVN39qZ4ibGpVVnZ5gtJ6+vUojV3DGSReELH9mXa4b
	N1mTdEGvX7TKefjvCVB/GMvVFDPi7QKRscijYtRLKIUkf98r96yR8OXV8F9XzB5RU6GqBR1CCjB
	dzWc0osqeb1/AmQhVJF97uwY41TfY=
X-Google-Smtp-Source: AGHT+IEuwNmjwKX4nKswTwb3SXTfDuIX6lLeyzja2ucZyH+jzwm3vW1KQtsqWNtG6OMobXMT7/h1mw==
X-Received: by 2002:a05:600c:3b01:b0:477:7c45:87b2 with SMTP id 5b1f17b1804b1-477c111607fmr352973135e9.16.1764417987920;
        Sat, 29 Nov 2025 04:06:27 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-47913870b38sm49133025e9.15.2025.11.29.04.06.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Nov 2025 04:06:27 -0800 (PST)
Date: Sat, 29 Nov 2025 15:06:23 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Pavan Kumar Yalagada <pavankumaryalagada@gmail.com>
Cc: parthiban.veerasooran@microchip.com, christian.gromm@microchip.com,
	gregkh@linuxfoundation.org,
	laurent.pinchart+renesas@ideasonboard.com,
	hverkuil+cisco@kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v3] staging: most: video: prevent probes during component
 exit
Message-ID: <aSrhv46__garLySK@stanley.mountain>
References: <20251128165033.25060-1-pavankumaryalagada@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251128165033.25060-1-pavankumaryalagada@gmail.com>

On Fri, Nov 28, 2025 at 11:50:33AM -0500, Pavan Kumar Yalagada wrote:
> When comp_exit() runs, comp_probe_channel() could still add new devices
> to video_devices, creating a race and potentially leaving the list in
> an inconsistent state.
> 
> This patch prevents new devices from being added while exiting by:
> 
>  - comp_exiting is set under lock to prevent new devices being added.
>  - Early exit paths free allocated memory (kfree) to avoid leaks.
>  - comp_probe_channel() checks comp_exiting before modifying video_devices.
>  - Removing WARN/BUG as it becomes unnecessary.
> 
> Signed-off-by: Pavan Kumar Yalagada <pavankumaryalagada@gmail.com>
> 
> ---
> 
> v3:
>  - comp_exiting flag update and memory cleanup for early exits.
>  - Commit message clarified for reviewers.
> ---
>  drivers/staging/most/video/video.c | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/most/video/video.c b/drivers/staging/most/video/video.c
> index 32f71d9a9cf7..f257fb179813 100644
> --- a/drivers/staging/most/video/video.c
> +++ b/drivers/staging/most/video/video.c
> @@ -60,6 +60,8 @@ static inline struct comp_fh *to_comp_fh(struct file *filp)
>  static LIST_HEAD(video_devices);
>  static DEFINE_SPINLOCK(list_lock);
> 
> +static bool comp_exiting;
> +
>  static inline bool data_ready(struct most_video_dev *mdev)
>  {
>  	return !list_empty(&mdev->pending_mbos);
> @@ -498,13 +500,22 @@ static int comp_probe_channel(struct most_interface *iface, int channel_idx,
>  		goto err_unreg;
> 
>  	spin_lock_irq(&list_lock);
> +	if (comp_exiting) {
> +		spin_unlock_irq(&list_lock);
> +		goto err_cleanup;

Why do you not need to unregister?  I don't think this error handling
is correct.

> +	}
>  	list_add(&mdev->list, &video_devices);
>  	spin_unlock_irq(&list_lock);
>  	return 0;
> 
> +err_cleanup:
> +	kfree(mdev);
> +	return -EBUSY;
> +
>  err_unreg:
>  	v4l2_device_disconnect(&mdev->v4l2_dev);
>  	v4l2_device_put(&mdev->v4l2_dev);
> +	kfree(mdev);
>  	return ret;
>  }
> 
> @@ -553,8 +564,13 @@ static int __init comp_init(void)
> 
>  static void __exit comp_exit(void)
>  {
> +	unsigned long flags;
>  	struct most_video_dev *mdev, *tmp;
> 
> +	spin_lock_irqsave(&list_lock, flags);
> +	comp_exiting = true;
> +	spin_unlock_irqrestore(&list_lock, flags);
> +

It doesn't make sense to call spin_unlock_irqrestore()
and the spin_lock_irq() on the next line.

So the issue is, we want a write barrier so that the write in comp_exit()
happens before the read in comp_probe_channel(), which the spinlocks
do accomplish, I suppose.

>  	/*
>  	 * As the mostcore currently doesn't call disconnect_channel()
>  	 * for linked channels while we call most_deregister_component()
> @@ -569,13 +585,14 @@ static void __exit comp_exit(void)
>  		comp_unregister_videodev(mdev);
>  		v4l2_device_disconnect(&mdev->v4l2_dev);
>  		v4l2_device_put(&mdev->v4l2_dev);
> +		kfree(mdev);

No no.  This isn't related to race conditions and it's probably
wrong as well.

regards,
dan carpenter

