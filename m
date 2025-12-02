Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9465421883E
	for <linux-staging@lists.linux.dev>; Tue,  2 Dec 2025 20:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764707601; cv=none; b=q3w3AS4TvOeBMHzaKGCeDN0fLhBVy+XRFlUBPDI56RMuD7nicNVDkouQhNzsdeTb4v7FEbheOE11fZti+pTjkrQtfTxbH1Yrxw1O8QiZng8sPSwmWdvRL+BgVmq35/KtP1NQXwYJy3KbqG6rhpIzOX8s2Bk35P7j5yLt+laqEDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764707601; c=relaxed/simple;
	bh=V826hrDR2ufjtieC3dFLw4FAsc/RJdWvgp7MvDAzt9M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ok/4weLT8EpWRN6sv8/UQRTZggboygJrNZ3QYyeabZxsf3vCtFs1TBogJesNAhIXq4PyNMoIx1wvr7Y0DWNqHN2CCW1zKR0KXwk/MmYxU/t5n66rxThCrqw26YzlYpeCzGmq0ARkAEvwAxglhTQXkOBGayyu6iD9EjfQpF4uCMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nzxb7/ng; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nzxb7/ng"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-47790b080e4so32141005e9.3
        for <linux-staging@lists.linux.dev>; Tue, 02 Dec 2025 12:33:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764707598; x=1765312398; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ojKCQknL7eQOVdozzS8Kczn3psJQw6SJOdnTaFjoa0Q=;
        b=nzxb7/ngGfNfdben1aJROth7YpaidHl+LaNfTJVsl1uOczl+cMPVttGYAtTlVOzzSs
         Gaw1wWp550ADO6yD2qHntWcx+cWk4uNqOBzpTvAGT/ulAwjoJc+giDeYDHodQRGVS3lk
         CAub+DiUaFTapmRD4bGL9AbQsUcYUejBGBb6JAnBGSGAvaNgFkWOfYbIjWxeiaxHrVSK
         GZa9ki1XKzN9oXeIaSjnmoFLtpWPRFsY3n45y6cYkAx29oZKuUF9WBUongRdG84vD5K+
         Owmhlik5KmU+rlnK1Y00Q1LFVaIgUdEKpr49wghDQosP8nmkDfrQ5Pg1d8gFr+k9ZjfE
         ZzFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764707598; x=1765312398;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ojKCQknL7eQOVdozzS8Kczn3psJQw6SJOdnTaFjoa0Q=;
        b=Ib+w0C9JaMJTTZh3qkv5m+ejIt6lZlG176B6FJEXozKZb48IsGEysH3MxO2I+Dp2Cp
         Xr06eeUStlZdHZ1ohSPzsJwUkIVS/DVzFJjnwqmU9WtH2/f3Y4xkPSaW9Lh3p9wDbTkl
         xSvIk5heB1eTW52p+TJUXNQfgTYoEy5OozfhP6wEQrr1WVXIiiOvTKRbOlIG4VhJrE6E
         5EPZn+kzfaaprlpJFq1RAZ63AmwTS7HpWsmKdabuXaQevDXgpNDkqNhzYIQ3JG4SKJ5u
         2frM0VKMXZNlpYgqVN/H0g5Nbxyp3ql79naUiT0HidvTYMUUlOa+IjKjLUknW5dJlJjr
         it2w==
X-Forwarded-Encrypted: i=1; AJvYcCWxGA6kZ9LSYMUUMceoKPffV0EHSnmpP7n9M3qZoxHki9ptIhCf8r34Ww3xaOIl/y8yLsw1rtP1ON4neyf5@lists.linux.dev
X-Gm-Message-State: AOJu0Yxm4RyfRcSYYaBznGH9m1IzynUnER9+VankJo42dWKnDTj2dpg6
	4Uo+L8Ngha3YZwxq6qA/IoaiYk1wz9KVeTOadKFLzxaf1GYDnaOD6ePULJa53PeOaiw=
X-Gm-Gg: ASbGncsBfT/vFX+l/je+UKsneEcET8hHil+wE7BaV+LPMWrH8oI4Ic4gWs1owB66Yc1
	Poq14eiaI60Pd+6WvpWhIRNfASeV+hmBygRBhavqjcX8GRAUNdpahzN0hvZ/IIb3NBLKIEhGNSm
	HFu3oB90CFkEyOD1yOwib+po48mXWR5rJBCzAbgYoJ1JKc/QXI0/KS69oHHrW53N2nKJJEu1WfQ
	6qJesxKt3Aem+1wNcNXlJkxid58YLrJ0/GAFvzzM4qSX05tKdr6kmGOR/cRa7STj8BRnO5uT3hM
	qbw2e+l3EqK1kDk8HyUcBxiQWxtFfAtaaE+iURbKFHeSnE6pF42cc0tX5m7F2lBbqoKOdpXr2SX
	1VJR3jLwunENN2XJN6KNZZgbu2VMcta4rFUKs7mk56V3IKN9lsWBK+0n3Ffd8GRmWb3Qe7Hh3Tz
	aXgYAJPMH7uJKpvb5Y
X-Google-Smtp-Source: AGHT+IGCy/s+ZFqiyJ1JuNXzzXYd7ZJRS9hzCGzFFStlAaJtT6M5KSnm57G93lzS4iAYt0f8+qH0nw==
X-Received: by 2002:a05:600c:3b99:b0:45d:dc85:c009 with SMTP id 5b1f17b1804b1-4792a5e6aabmr8898855e9.10.1764707597823;
        Tue, 02 Dec 2025 12:33:17 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4792a65b230sm4167795e9.9.2025.12.02.12.33.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 12:33:17 -0800 (PST)
Date: Tue, 2 Dec 2025 23:33:13 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Pavan Kumar Yalagada <pavankumaryalagada@gmail.com>
Cc: parthiban.veerasooran@microchip.com, christian.gromm@microchip.com,
	gregkh@linuxfoundation.org,
	laurent.pinchart+renesas@ideasonboard.com,
	hverkuil+cisco@kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v4] staging: most: video: prevent probes during component
 exit
Message-ID: <aS9NCUGBiM7h6d3n@stanley.mountain>
References: <20251202152143.13352-1-pavankumaryalagada@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251202152143.13352-1-pavankumaryalagada@gmail.com>

On Tue, Dec 02, 2025 at 10:21:43AM -0500, Pavan Kumar Yalagada wrote:
> When comp_exit() runs, comp_probe_channel() could still add new devices
> to video_devices, creating a race and potentially leaving the list in
> an inconsistent state.
> 
> This patch prevents new devices from being added while exiting by:
> 
> - comp_probe_channel() checks comp_exiting before modifying video_devices.
> 
> 	if (unlikely(comp_exiting)) {
> 		spin_unlock_irq(&list_lock);
> 		ret = -BUSY;
> 		goto err_unreg;
> 	}
> 
> This ensures that all partially created resources are properly freed
> and no new channels are allowed while the driver is being unloaded.
> 
> Signed-off-by: Pavan Kumar Yalagada <pavankumaryalagada@gmail.com>
> 
> ---
> 
> v4:
>  - Used unlikely() for the comp_exiting check to optimize branch
>    prediction.

This isn't a fast path.  Only use likely/unlikely() if it's going to
show up in benchmarks.  If we can't measure the speed improvement then
it's just making the code messy for no reason.

>  - Removed err_cleanup and use err_unreg for proper cleanup
>    of partially initialized mdev/v4l2 structures.
>  - Removed redundant spinlock usage around 'comp_exiting = true;'
>    in comp_exit().
>  - Removed explicit kfree(mdev) in comp_exit() loop.
> 
> v3:
>  - comp_exiting flag update and memory cleanup for early exits.
>  - Commit message clarified for reviewers.
>  - Removed WARN/BUG as it becomes unnecessary.
> ---
>  drivers/staging/most/video/video.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/most/video/video.c b/drivers/staging/most/video/video.c
> index 32f71d9a9cf7..21cb94250d93 100644
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
> @@ -498,6 +500,11 @@ static int comp_probe_channel(struct most_interface *iface, int channel_idx,
>  		goto err_unreg;
> 
>  	spin_lock_irq(&list_lock);
> +	if (unlikely(comp_exiting)) {
> +		spin_unlock_irq(&list_lock);
> +		ret = -EBUSY;
> +		goto err_unreg;

You will need to call comp_unregister_videodev() on this error
path.  See my blog if you want.

https://staticthinking.wordpress.com/2022/04/28/free-the-last-thing-style/

> +	}
>  	list_add(&mdev->list, &video_devices);
>  	spin_unlock_irq(&list_lock);
>  	return 0;
> @@ -555,6 +562,8 @@ static void __exit comp_exit(void)
>  {
>  	struct most_video_dev *mdev, *tmp;
> 
> +	comp_exiting = true;
> +
>  	/*
>  	 * As the mostcore currently doesn't call disconnect_channel()
>  	 * for linked channels while we call most_deregister_component()
> @@ -569,13 +578,13 @@ static void __exit comp_exit(void)
>  		comp_unregister_videodev(mdev);
>  		v4l2_device_disconnect(&mdev->v4l2_dev);
>  		v4l2_device_put(&mdev->v4l2_dev);
> +

Don't add a blank line here.

Minor stuff.  Otherwise I think this is okay.  Fix that up and resend.

regards,
dan carpenter

>  		spin_lock_irq(&list_lock);
>  	}
>  	spin_unlock_irq(&list_lock);
> 
>  	most_deregister_configfs_subsys(&comp);
>  	most_deregister_component(&comp);
> -	BUG_ON(!list_empty(&video_devices));
>  }
> 
>  module_init(comp_init);
> --
> 2.47.3
> 
