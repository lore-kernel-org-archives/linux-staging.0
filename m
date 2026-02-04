Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11E122DF716
	for <linux-staging@lists.linux.dev>; Wed,  4 Feb 2026 09:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770197764; cv=none; b=S1r6EjCWWNnx+ApLwolrIppx2gdaIdLhqqmJUPzXYDJv5UWLbozsC6pA0N+TkMr+0NNw8mjLIJrwPJ9VbBu9/UhWtZqFE7DHo5kp1ju5kyeKzkknR89WsmhTTji3zJ+y5wu1ViYXewZo7i4ULZx28ZlbU9IBtmVoo+w5T1B7ROQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770197764; c=relaxed/simple;
	bh=vOMGGu93PglgXkTO0WCCDVo+GGCEa1SqzloTFk1irsE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yl1l9v/uDMsgTIKpxPhhV3QdhajEm66Io3SdZ8FrTERwF3y5DVZEuumGxsAok6RZ3R6XdkxM/CqINHbZKSDa3UFZXxMWPMrXnQeG4g/06F3RW35Md6sjezsemEHmuwt80elScdguSuZy+Z6dHzkWBrBJbPQqmawbjsyPZkuh+DM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pmpeu8fv; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pmpeu8fv"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-42fbc305882so4043305f8f.0
        for <linux-staging@lists.linux.dev>; Wed, 04 Feb 2026 01:36:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770197762; x=1770802562; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uJ0/1Y469omco+KfEh9cubrhsWGsz73BeQRvDS8QnaA=;
        b=pmpeu8fvSOGocN/YoTsJ+H7M2V89eJThUtpJ5FU5uvZIgsoEOfb1SexZ4W6yj2cQia
         mIE0GfvKTJf+eD5nglirbRtVQVvYJGeepPwXKb/DKV2UsuCPtnL7gqgQ+E/MRkRtaYTQ
         aEW3d0pmQNvefRb/uJKpkDOAcrWTHahYnWQMwO51s9Kw98krn7DkovWPIZaB+R7nrHGV
         fyR1kKP6D/G8VS18yA26snGmmJ6bZPjikGZFO55HpyONm1nnlsOVNXAI39ecJxBehKXl
         7m1JNtHEp8eA+ba3PEzWGwDtlvFr2gdkjkTolG14u7uvCDriZohEtZ3uIbk8bPDKQS2i
         PlDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770197762; x=1770802562;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uJ0/1Y469omco+KfEh9cubrhsWGsz73BeQRvDS8QnaA=;
        b=hcITil/wkIhGLUwv2oKpeCoqXhPZgVmnwhSUUbao56C892di/kAEXF3FR/hDd3gFB5
         5RQzrev+Z1m9aykBxFhS/hZS8USjr5vKZ/mTXEFQLziTb4CAfK0Mq7W8sTpa80VXZMqh
         WL7o3+XWzyNL+mKPtB3towO+/mfnUm13AhcxaqZ5nlfmJvdXiTj/LWEg69P2voFnT8VU
         7mlSkFGgn5Ue6iWjslteBoIAgUw0wdr68J1kU6y3QP7//cCBOw6lTZe8/T11dOYgziXI
         lyDfKgUfPhAkjiTrVVW8ZJSaN+9ZiCS/uUqVnLYkm5SIwvjm4E65KxrPYKLvM+fK/w2b
         VMrA==
X-Forwarded-Encrypted: i=1; AJvYcCXC/l8tXmilAOWDcukRpVKjvFDLbg5BZlu5UJMQUXdcTiRvQT5qplCcC98oWrV8EwxTZ+fROTcWlpJvZC27@lists.linux.dev
X-Gm-Message-State: AOJu0YxH+LI5Feqnk+5im8PW7cxeOWtrCusKfIUcLfoH575qm6loTlKx
	tj+aUqT+A8iLeAfR1Naul5g6FdB/3JNrjMFgfErD7qAfHRNPfqi7O0+CK8ooCB+XFxeqQf4DIaD
	yqO25w0Q=
X-Gm-Gg: AZuq6aLiAADOfxlii+i+gHZR+6EkL9aAdcPeKPERYX1f1GcBiAlnBIFf12lZ15+7VlU
	BlU6UJx5xWAVbZsuaX31+PQrz0ByP/ddepkeXTezmTwrcczeQC6RVoO9UVlcbWEHpuexQTK15XI
	+TvNXJVIsY5txwMvn6SF6DSSrY68zLxBezzCPLDM0HURgyOvGkK98MO5bGwBqclz3JONvuUcz+m
	I90t++TRDbpVO0/oRQQnFa6nyQ5YVdUjWiTQTiXnb29SUnTnvLdIAh50h9rJsgBCl/PVgTOOW3t
	5dZBYermArWV7CpCD/KPL7kgzzY0ov/2CT41uCVxdQPpJ7/nKgdY4fqALv1neB4xBFA4zD10zpI
	Cf3QTTMf57ccbBFHwSfJ6OHGdE0OnUAZSjEQqTefrPMA6p05yrcJF8XVxTPHtK5vaIz9wFdc8kY
	0qJvPvf3lHZKxH4PZgVJs/QlXr4UM=
X-Received: by 2002:a05:6000:4211:b0:432:c05b:d8c7 with SMTP id ffacd0b85a97d-4361805955amr2906170f8f.49.1770197762404;
        Wed, 04 Feb 2026 01:36:02 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43618064844sm4902192f8f.42.2026.02.04.01.36.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 01:36:02 -0800 (PST)
Date: Wed, 4 Feb 2026 12:35:59 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Minu Jin <s9430939@naver.com>
Cc: parthiban.veerasooran@microchip.com, christian.gromm@microchip.com,
	gregkh@linuxfoundation.org, hverkuil+cisco@kernel.org,
	laurent.pinchart+renesas@ideasonboard.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: most: video: fix potential race in list
 iteration
Message-ID: <aYMS_9xQ4LGgMS-j@stanley.mountain>
References: <20260203112800.3351763-1-s9430939@naver.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260203112800.3351763-1-s9430939@naver.com>

On Tue, Feb 03, 2026 at 08:28:00PM +0900, Minu Jin wrote:
> There is a pattern in the loops where the lock is dropped
> to call a specific function and then re-acquired.
> 
> The list can be exposed during this short gap, creating a potential
> race condition. This patch fixes the problem by moving nodes to a
> local list while holding the lock, instead of using the
> unlock/lock pattern in the loop.
> 
> Signed-off-by: Minu Jin <s9430939@naver.com>
> ---
>  drivers/staging/most/video/video.c | 22 ++++++++++++++--------
>  1 file changed, 14 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/staging/most/video/video.c b/drivers/staging/most/video/video.c
> index 32f71d9a9cf7..e7db58e5746a 100644
> --- a/drivers/staging/most/video/video.c
> +++ b/drivers/staging/most/video/video.c
> @@ -121,6 +121,7 @@ static int comp_vdev_close(struct file *filp)
>  	struct comp_fh *fh = to_comp_fh(filp);
>  	struct most_video_dev *mdev = fh->mdev;
>  	struct mbo *mbo, *tmp;
> +	LIST_HEAD(free_list);
>  
>  	/*
>  	 * We need to put MBOs back before we call most_stop_channel()
> @@ -134,12 +135,15 @@ static int comp_vdev_close(struct file *filp)
>  	spin_lock_irq(&mdev->list_lock);
>  	mdev->mute = true;
>  	list_for_each_entry_safe(mbo, tmp, &mdev->pending_mbos, list) {
> -		list_del(&mbo->list);
> -		spin_unlock_irq(&mdev->list_lock);
> -		most_put_mbo(mbo);
> -		spin_lock_irq(&mdev->list_lock);
> +		list_move(&mbo->list, &free_list);
>  	}

This loop moves ever single item in the list one by one.  You could
do it in one step instead by copying the list_head and setting
pending_mbos to point to itself.

Same in other loop.

regards,
dan carpenter

