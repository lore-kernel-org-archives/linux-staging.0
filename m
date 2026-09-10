Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48DF64BFE90
	for <linux-staging@lists.linux.dev>; Thu, 10 Sep 2026 13:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789047566; cv=none; b=YSr/RCx+7jTo5Dqdj0Sbdp9S/yxTbx4X61ux2JCwAKWuV3CajiTiAXLMACm2XscevMuNJnhAT533f0nG7/OSGZ3VICBMpUASmD0O+QdTnR1LgYZH/G69tKrIhuxVPs04b2N6YL2DeMJ/9YjB9OIoYbCaeu8oRqvr2GME7nwT5Cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789047566; c=relaxed/simple;
	bh=TDBy2qbTXNR0qPysOgT50JSGgqr/6R1MMiTiR1Y1yEo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oxgjo5z/3pwAbQKRNMVBrOz/Ll5xqP41iQ+ypr6SqxuSqGAdZpWluFqrM0P7SwnWhUonE+A2Y+SwzNAXR51PNB6fWGZZJkRouMLabfpaNsgNBqjsf9iqLS5G6p7/DOT8KHcWygoyofmZZ6kAxYUEU/zeSuoCEcjv7R59u3nLCs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=do3tHqNr; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="do3tHqNr"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c29432715d2so220798366b.2
        for <linux-staging@lists.linux.dev>; Thu, 10 Sep 2026 06:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789047562; x=1789652362; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JMmMNbrgJ0PThlrgbADYUy5LHKnoS0oQw5HvEhMlYHY=;
        b=do3tHqNrFQWRmTNmXMGSWn1Jyt/vbySQOSdwbJdbYiW4Md88EcN91CFImhrQpJw0KT
         qNbpX6QWCuooBTQZLa+wwRrOi6Ud5TKUwYZd6iYvfo49h+skdkC2wGgR+s2M88BxDoM9
         Z+/HF/Bo19p7KBiiyJIug/J4vR4VwFZYuP6kKMjfzxXNkUFP/ZsBvwGWT0pzDkuMih4O
         SS3A0/oMGOQBzSQHBv63hncMW/LwXp7YvfWWlmE+LXvnHWoe17zCM9/VFTW+9DEHwHzG
         sIwSR5St3qYywtKWmHu6eyOsDMfVdRhSrIndYNW0lyAx+A3DEBqVUC4xhJFA3zQeomP9
         mYIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789047562; x=1789652362;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JMmMNbrgJ0PThlrgbADYUy5LHKnoS0oQw5HvEhMlYHY=;
        b=b5vMo+HnhtQn/jREESz0fZjME2cuKjWTuYGI/JSobMJj6+uWowSKFBF5iioA9bdGvI
         QNN/om2K+s3FwHwQDTie5bqo9S3jcvftwyjWTTf9/p2EZqBw+qOpKwte1a+wryTkCxya
         52HaPPeqgSqwtEKyF9lE5uEWkW90o+UGpHmRCCkWfipIOtQw9UBEtD5w8Szoj6yPneQ2
         Jfq+b4G94Q4zPkQ0Wf90reANhsVMd5gJ9xvF6HBpdiaoqI6zyqT519nGR3Mo5b+So53+
         OB0jXICgC9/9H6SYylpaNP6HCDMOQyo0ggIxWBwBcaESBN0KiEhbm4v2xdhAnMlRAQ3V
         v+rw==
X-Forwarded-Encrypted: i=1; AKwUvBxXJiKL74N/2XVE5nwoVItuZIW/UmDzD0O5l4cobUmP6Sc96ohU0gRW39dun3qpulLEEU2vGqe75A8r2gWZ@lists.linux.dev
X-Gm-Message-State: AFuF++mCEsMAiG68C0ljUkwLumyUlBKx3/B8F4X/oyD+z07hGntEJUT3
	LhHPbfPZSOhkfDtJa3PTE6OLyTHBdGqoRAnbJ35GpzIGjcHrMCdwDpzM
X-Gm-Gg: AYBFou0ARPKPE5qLzN4+xjTEPt9591Lmeyev+/b26f8ZyqARQT1xnFAkKIwsitnTn+z
	sOGvgXUgN/eiW3iw2thAGMUtf2+NNG3DFzIkNIrch6PGtaRYSqyj3tqoip+j1ZwQqGE2C10gptc
	v3VoS/B3fLvU3nhHPwzr61hbzOAFY3loomOT3Xo+OOpWj5c3PPdupfNjl2VICZKpP/65fHIJc0P
	QK79lfps4YFkqN2nxGzuzksrjCUs+SaUFLq55hM0OrOVwNEZK2szeCb2b+k4SmHW5s+hls7nVPK
	FBNOi/5bRMZ/Z25ZNlJm/lztVCMxiLN3ho/dsLOhxsihrDy0F0vLVpS3GqjeEHzpv7Z+M8IMQEY
	t7+u9GoRUtPhRMie7X/l9NHqZiL2QYI5T+fpr86TP1Ky45tfQPbv0CUcR1k24Xz0v7fOg3fwuIZ
	W2WHdaVMYR1t2FjEq9kL/+cNi+ok24HJNULKicWzaXy1ZDCGmFpWtv14glX2zS7zgThUUz
X-Received: by 2002:a17:907:72d5:b0:c26:1691:b361 with SMTP id a640c23a62f3a-c261691b94dmr1535678866b.26.1789047561903;
        Thu, 10 Sep 2026 06:39:21 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d036902sm910218566b.3.2026.09.10.06.39.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 06:39:21 -0700 (PDT)
Date: Thu, 10 Sep 2026 16:39:17 +0300
From: Dan Carpenter <error27@gmail.com>
To: Muhammad Israr <7israr.work@gmail.com>
Cc: parthiban.veerasooran@microchip.com, christian.gromm@microchip.com,
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: most: video: add comments to mutex and spinlock
 definitions
Message-ID: <aqKzBTM-CdBqQzXi@stanley.mountain>
References: <20260910124403.95741-1-7israr.work@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260910124403.95741-1-7israr.work@gmail.com>

On Thu, Sep 10, 2026 at 05:44:03PM +0500, Muhammad Israr wrote:
> Add comments describing what the list_lock spinlock and lock mutex
> in struct most_video_dev protect, per checkpatch.pl's
> "definition without comment" check.
> 
> list_lock protects the pending_mbos list. The mutex is registered
> as vdev->lock and is used by the V4L2 core to serialize
> video_device ioctl calls; it is not locked directly in this file.
> 
> Signed-off-by: Muhammad Israr <7israr.work@gmail.com>
> ---
>  drivers/staging/most/video/video.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/staging/most/video/video.c b/drivers/staging/most/video/video.c
> index 3a0445ff62f4..41b617b553aa 100644
> --- a/drivers/staging/most/video/video.c
> +++ b/drivers/staging/most/video/video.c
> @@ -33,6 +33,7 @@ struct most_video_dev {
>  	bool mute;
>  
>  	struct list_head pending_mbos;
> +	/* protects pending_mbos */
>  	spinlock_t list_lock;

It's supposed to but it is buggy...  What prevents multiple
threads from reading comp_vdev_read() at the same time?
I prefer to keep the warning around until someone fixes the
code.

I didn't read the other change.

regards,
dan carpenter


