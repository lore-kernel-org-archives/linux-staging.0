Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B98043876CC
	for <linux-staging@lists.linux.dev>; Wed, 24 Jun 2026 06:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782282479; cv=none; b=Dc8XYsylnlwQgCmsu0+bd/xVmQYDFe66wfYBFxtap+fiETsqkZOvgWPD4NiQya/Tx5F5AhLUKzMXa7iKHvHW+Mo2i4pDbg0wKgjSmVkdonelv4OBY4ew7VruS/ybg7+3SACXculG5njViCawKJ3kj4kuaRV9c1FaVyjOTF6kROE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782282479; c=relaxed/simple;
	bh=0gpqxp5C6vAUbbM4GloT8ABlUjYyQs/QpypwSJxnHNM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s9LJxtWUiqQAyYZ23DHG9qMZWXZy1x3Q/1lUSHff60NZjJI3qlDN6LaNQDR/sPi/3Cs7gfX8gHRlAP2pLUtw6S1GgIvErGSvCqBYifeK+yf01KqHsFcm9YmluuNy9g29ajKRrCqDzjOS00CpZo5sF64zpI9DBvnZLWSi3eBQ16U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pi/C0/4J; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pi/C0/4J"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-697f3af8749so590251a12.2
        for <linux-staging@lists.linux.dev>; Tue, 23 Jun 2026 23:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782282476; x=1782887276; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+KFnQ6m1BXNtV5S++x12ycDzT21xW8CUK7qPR+O7rI4=;
        b=Pi/C0/4J8DmRB4/NuTVVR5KfeIUIq23fzZxJEET+LeBFKBdaCEhuT61ZmRm96Jwh+s
         +Lk9/O8OVzRoQV+s+Pmfaa/58gRGJJguciMp9pcDgm7SDg+hAPT9aATBDhVz4nQoWFnu
         aMIyJ78o6/NGl+fM63HhZ3QNn61fxua6kfL2mRbMNu1ZffTauZATkNSv+8iS/MF6bXWZ
         5K9VYfnrC9tmtAaPm0UNuhQhza3Y8R/1f+hUbgX3QVErufZPrrp7RskxhAn9uiUCkQLt
         knFcZiWTBeJKX6zgWQD682Ayw8ag5xW+ylE9uZoJSv7nKMmB1WgrXV88zqf53vBT2RCP
         Ur9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782282476; x=1782887276;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+KFnQ6m1BXNtV5S++x12ycDzT21xW8CUK7qPR+O7rI4=;
        b=F/cFtCpXLay4//NiOMlAqkq7liBbjMR9Q0b/MeHzkiLu+HLWtTGikq07ofE3qZNTik
         /innPqJwI8NYWHD3Kk/0WJP9/E9UX/8UkZZUooNU8DkFWlHj4ZgT2U0tl/V2khdzMo5E
         yQoy34dBIm2a4zdtmSifilq/2K+Kq/DoENnqyMoRNAUKpk/+5kF1CNfROAVPCC/dj+BY
         RWB0illinsNqyuJwQLEMQfrCsNNh6ZsdVk9yVsrQ3uyoiEf/8WBacIejl1rXBnehMEsc
         tuv+Rhp9FkNfisIsJbUROFuqAAwJBaYxLHAnoknK76gPK94pyCy+fFyzNShz8up1O8Fn
         GXYw==
X-Forwarded-Encrypted: i=1; AFNElJ9jjiTexKXHMWEVazwIjQqnUccDIcmpU9pZeIdfCQ40/HJ3e3pQBhBIgtKf8gQfRYHHqmGQkdto4Xg+FZh7@lists.linux.dev
X-Gm-Message-State: AOJu0YwUM0GUpRHKBD3VIrx3wtYosEjn9G0TzUSkdix5E9pTj/nu3DcT
	SE00mi1Gn6zPRVgRKDAxtuSiXTNnuhNsiOv9Wtq0/LQ6y4MEKtjd0X4e
X-Gm-Gg: AfdE7cmXw69JWO4/EWtIKKLS2WSHA9oLL/WKT+1CBhPb+ctqDMQmG14F71i1G/06GGR
	WVucutrrW7DKsLbrjin/qI/m9P+rmh2elwEx5Qc3RUeFzsLJrA7CLWimL20vZaQwNr3dT/eqxzc
	Kbl7T16dngiqc9Sz3TeaqTbMCV8Zp2xOubvHa3XqGIiKgqn1hPNKBYeJ4AdV7gX3aVHYHkDyZgm
	PfBbPQ3VrDgOkAY3JQPQz0B5fXfw+CzO0kDrCXZEcDk7ZeWC15PzEsD421rXxD7+0Mq1df/8um1
	SAGwh654sCamAqbQA7aW/gwU32UfhI6+sU0MPAR3VPm1mB7eDP83TN3iwfnwc1YSYlYVh19w4NG
	J2fN5Tgc+MHD247Cs24KwGhpt6fGppfIWv7EsuXZ/WeGGbFc+40Ul59jkssMv53Fk25nKhfVPTm
	SSy7fW42gN
X-Received: by 2002:a05:6402:4502:b0:697:ef08:e18b with SMTP id 4fb4d7f45d1cf-697f377880dmr742293a12.1.1782282476021;
        Tue, 23 Jun 2026 23:27:56 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-697f49d73fdsm529866a12.22.2026.06.23.23.27.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 23:27:55 -0700 (PDT)
Date: Wed, 24 Jun 2026 09:27:51 +0300
From: Dan Carpenter <error27@gmail.com>
To: Batu Ada Tutkun <batuadatutkun@gmail.com>
Cc: parthiban.veerasooran@microchip.com, christian.gromm@microchip.com,
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: most: dim2: use dev_err_probe() for clock
 errors in rcar enable functions
Message-ID: <ajt4563Z0OcyenaU@stanley.mountain>
References: <20260623124243.1245-1-batuadatutkun@gmail.com>
 <6a3ae2f8.cf2df9a4.132dbf.1a50@mx.google.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6a3ae2f8.cf2df9a4.132dbf.1a50@mx.google.com>

On Tue, Jun 23, 2026 at 10:46:07PM +0300, Batu Ada Tutkun wrote:
> rcar_gen2_enable() and rcar_gen3_enable() use the old pattern of
> dev_err() followed by return PTR_ERR() when devm_clk_get() fails.
> fsl_mx6_enable() in the same file was already converted to use
> dev_err_probe() by a previous cleanup series.
> 
> Convert the remaining two functions for consistency. devm_clk_get()
> calls clk_get() which can return -EPROBE_DEFER if the clock provider
> has not yet registered. Using dev_err_probe() suppresses the log at
> error level in that case, avoiding misleading "cannot get clock" output
> during a normal deferred probe.
> 
> clk_prepare_enable() cannot return -EPROBE_DEFER since the clock handle
> is already acquired at that point, so those error paths are left as
> dev_err().
> 
> Signed-off-by: Batu Ada Tutkun <batuadatutkun@gmail.com>
> ---
> Compile tested only. No R-Car hardware available. This is a correctness
> fix for the deferred probe path, not a response to a reported
> user visible issue.
> 
> Changes in v2:
> - Mention clk_get() explicitly in commit message
> - Add testing note under --- cut off line
> 

Wrong patch for the commit message.

>  drivers/staging/most/video/video.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/most/video/video.c b/drivers/staging/most/video/video.c
> index 04351f8cc..1e1ff3c52 100644
> --- a/drivers/staging/most/video/video.c
> +++ b/drivers/staging/most/video/video.c
> @@ -33,14 +33,14 @@ struct most_video_dev {
>  	bool mute;
>  
>  	struct list_head pending_mbos;
> -	spinlock_t list_lock;
> +	spinlock_t list_lock;	/* protects pending_mbos and mute */

It doesn't protect mute, really.  Only half heartedly.  And
protecting mute is unnecessary.

>  
>  	struct v4l2_device v4l2_dev;
>  	atomic_t access_ref;
>  	struct video_device *vdev;
>  	unsigned int ctrl_input;
>  
> -	struct mutex lock;
> +	struct mutex lock;		/* serializes V4L2 ioctls */

I kind of hate this checkpatch warning...  It's really hard to judge
if this comment is accurate or useful.

regards,
dan carpenter

>  
>  	wait_queue_head_t wait_data;
>  };
> -- 
> 2.53.0
