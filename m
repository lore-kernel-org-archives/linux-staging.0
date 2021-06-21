Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED14D71
	for <linux-staging@lists.linux.dev>; Mon, 21 Jun 2021 14:28:40 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id w31so14314989pga.6
        for <linux-staging@lists.linux.dev>; Mon, 21 Jun 2021 07:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=HRj6jgpuI+cB6PDpqLiq6EiwF1c8kXiEkJQw6hQEm+I=;
        b=mTZ7WQlwbzQk4gLECW7X3QARCyfrBR8joUnqTeTEIY7DXMFL1wvwZeLRm/dXLg3dAq
         elpj5NsV88/ynmX9WeRqZZVIBlJbhMbehCVsrE2uxm7vyaBQdzK+qo2MSYM+DKUOZKNB
         2sW9Ucnr21Nk76Tc6UFhLVds9CasDcCUoJzHoPusKuRFQYYtHqlym6SJ5CblH9oMjnDC
         cuAHoIes0Ixjj3l6F7E4bqu4vpoGYvX2Fwk77s4IdHuiHUDp11Uyr9eF4wwAoEWRtxcA
         y45vECWxVDe9uIfyCWnK0gL7+HMNrFt7tfO2k/u5hMAyYSa9vP6kugG4fhSA2J7aK67+
         sGXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=HRj6jgpuI+cB6PDpqLiq6EiwF1c8kXiEkJQw6hQEm+I=;
        b=kbYo2mYGznrRAla5V+nKzp7pPlLMQXz7eKV2WlhRTtdIKHIbyfU/2Lu+CTPyRSvKOW
         g9gjoyAlFxEEFDuXAGyiQ3pKXvX8xaKIMaNcb4WpgiopvbkRgxDdON+g8VeJC5EYOvBE
         7b0QTyEnLBPB/af4SrtGRM1U5E4CAlXzrUGCpCjaLVGEIZA0Um5DieFvzd+8/JljXcmj
         nLneqQv6GGMD/SkYSFy4/+2lK+1WqgwfKOHqtl0QPBuPvLoYIK67Am8ctPrzejjtiOF+
         DTkRpA0wvRnBi+tmqR6xfB+E4knhTJswQVaR5Y3rrpMQR1YHl6UZJMuwClxN5YkHZLgs
         Iomg==
X-Gm-Message-State: AOAM531/VPBQJyJ8FBtme+g117/OQsVGLZ/kfXteOECLMQLqzMSlyUYP
	ZjmDGwn91UaSebq9O0ykaHY=
X-Google-Smtp-Source: ABdhPJwrYStRiFqhX6UmCBwPaRoE54hZpFRYBM7yG2YneCzaqUMuTlan+FvxcavMJjLliSPU+NtGPQ==
X-Received: by 2002:a63:c1e:: with SMTP id b30mr24435102pgl.118.1624285720505;
        Mon, 21 Jun 2021 07:28:40 -0700 (PDT)
Received: from ojas ([122.177.154.120])
        by smtp.gmail.com with ESMTPSA id 10sm13203713pfh.174.2021.06.21.07.28.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jun 2021 07:28:40 -0700 (PDT)
Date: Mon, 21 Jun 2021 19:58:33 +0530
From: Ojaswin Mujoo <ojaswin98@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: nsaenz@kernel.org, gregkh@linuxfoundation.org, stefan.wahren@i2se.com,
	arnd@arndb.de, phil@raspberrypi.com,
	bcm-kernel-feedback-list@broadcom.com,
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/5] staging: vchiq: Move vchiq char driver to its own
 file
Message-ID: <20210621142833.GB186979@ojas>
References: <cover.1624185152.git.ojaswin98@gmail.com>
 <8cd9b5899f82eaf2efdc9caa8d07f719a592a94d.1624185152.git.ojaswin98@gmail.com>
 <20210621095631.GF1901@kadam>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210621095631.GF1901@kadam>

On Mon, Jun 21, 2021 at 12:56:31PM +0300, Dan Carpenter wrote:
> On Sun, Jun 20, 2021 at 06:26:34PM +0530, Ojaswin Mujoo wrote:
> > +/* read a user pointer value from an array pointers in user space */
> > +static inline int vchiq_get_user_ptr(void __user **buf, void __user *ubuf, int index)
> > +{
> > +	int ret;
> > +
> > +	if (in_compat_syscall()) {
> > +		compat_uptr_t ptr32;
> > +
>    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> When I'm reviewing these sorts of patches then what I'm trying to verify
> is that you are not a UMN "researcher" trying to change the code without
> anyone noticing.  In the orignal code, there was no blank line here
> 
> > +		compat_uptr_t __user *uptr = ubuf;
> 
> but there was a blank line here.
> 
> > +		ret = get_user(ptr32, uptr + index);
> > +		*buf = compat_ptr(ptr32);
> > +	} else {
> 
> These sorts of minor white space changes make it hard to verify the code
> in an automated way.
> 
Ohh I see, I get the point. I'm not sure how this creeped in here.
Especially with this patch, the git diff looks very ugly and confusing
to me. I'm not sure if that is because I unknownigly introduced some
whitespace changes or if thats normal when shifting a lof of code
around. Anyways, I'll fix this in the next revision.

PS: I was unable to get mainline kernel working on my Pi and instead
submitted this patch which is built against the raspberry downstream
kernel. I now know this definitely not the right thing to do and am
trying to recreate this patchset with mainline. Hopefully I'll be able
to iron out all such anomalies in the next revision
> > +		uintptr_t ptr, __user *uptr = ubuf;
> > +
> > +		ret = get_user(ptr, uptr + index);
> > +		*buf = (void __user *)ptr;
> > +	}
> > +
> > +	return ret;
> > +}
> > +
> 
> regards,
> dan carpenter
> 

Thank you for the help!
Ojaswin
