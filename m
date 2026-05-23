Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E07BA356754
	for <linux-staging@lists.linux.dev>; Sat, 23 May 2026 10:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779532431; cv=none; b=hX7bpcFg6LUrfN6Xvbj6c2AXb/G+weLirzrk8cyavluyriJE2bNz25RXYTy3RNXvMgiglesfgOk3xfSG/ASoPx2/x63/aFRi8f8k7YZVMwEe6hggfeQEXB3oBIwUj3Hu87GGFggDeLqWQJdFFeriMlBTMIIDNom5k9EbBm2JvpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779532431; c=relaxed/simple;
	bh=VfqTrXbAjfjJW8HSZ+Rpm1GxcODjwd/5op7veBkP0Zk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XItBaN6L6NUGZpzsxVS4ZsKEJB3ssA8RTVs5dcpcd8dUAPSirxY17vE1m/I63rsBTHYdqkvOVZZ0moG18MHhgy3N7hS8eG5i77dTgEwIKNJ9IeM6unikjeks9cizgwNH2cY11MU3ky5ieV3JVfpSM7XP56Qscfz3aewwOnXbqPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n0pFmA5x; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n0pFmA5x"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4903f7a90d1so17364965e9.2
        for <linux-staging@lists.linux.dev>; Sat, 23 May 2026 03:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779532428; x=1780137228; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1xMDMv9bGUAtuBW4Pv+wf/h1qTPz3I22UMoRQ9O+Vjg=;
        b=n0pFmA5xqGbUnqn+mVLeRLTx+4FG1zUIv2RMTYs+Z9EDStWtUA7lT2kdFb+KbZ8WNR
         1VAsP3Mchabb3a9WsUPTWyiCBHxpeQx21OzniJj15OoEZkD+Qm4mch1zKgdY+cISQQms
         8RqfD0xAwPyKxttzSZ5ZQFx5vwatqLYoCDNddXlqGp1+NnidHzf/o/cMpXGM3bq3qkG8
         Npyb2ZWr5f2qqDfP30QqN0cYb0ZXzxy8C3tqIKWfxbdLYQgD3WTHSWFkikCnHByR1fgW
         Gx6ctSDNMh38qTe/tRuvvg7dWK912unxykURryFIqFQ9jHoEvl0NQCHJPYP8UuxHs3fn
         imIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779532428; x=1780137228;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1xMDMv9bGUAtuBW4Pv+wf/h1qTPz3I22UMoRQ9O+Vjg=;
        b=b9L6l/2Lj9DGMbqjIRaGwdmNyRGitJi0hlylzS710nMyUSTUuy13ulsEMoi8/a8faN
         +cE0y1RQY++eQvLnJZYVdUR0DRbFZNCAU/czrKCGUjPiW6dzt3JXynH6xT25oy675BMk
         BgfO7XutSvSP9/e9Sx2eB3HL1aTtxWH2JsUnwrh+07NFO06Uz+5avUUOxa4ccFizcbg+
         xoQizYYdY5qKTdGaLH0+q5JqPMmfA9fzkAeLVaV6Vo2EqabYjZYUOwKKqnhHPcQuQV7m
         ztVsCcC4LJteqspKOaHpzemz0NKZQy2N5HNYrfRm+dtjw3+vn/blY4ESPN2h906ZzeiM
         KKOg==
X-Forwarded-Encrypted: i=1; AFNElJ+EUYiaumbeQxCZYLpnPYykBWv5hCjVfxsJl+JVDCHcCTLpEskzlsrU4RuvI7p6HlzcsqTUl1Iwbm64HYAp@lists.linux.dev
X-Gm-Message-State: AOJu0Yz1ErRr+92L4ASL0uTqTsPsDcCmGAdH9CgCT7VvFdv0fUR53JWd
	qS6vGWEViuGpu7LpR/fjvgFoxNkfUpPYbamf3Kvfw2439yy5VMqexFe6
X-Gm-Gg: Acq92OGbg4yXU5y/LUi8Dal+u7jKdEa5Y93J5FE9qHLQ65JxhVoqeNeAp3nVDtzxGaD
	K1WvskvhMw9XKDvo9zhdpbO4Duq3ffZXPknnBf60XFeE52Kb53o2m4/XFjd9Vo/aYw8HsCEUt7j
	an3U7l103fuddDLOzmSRuUYGuYHHGSEpOrXYXNU4tuDJE6EGZEgq2EtNkbyAbn63oOq/VMmwRgS
	Ntsnqd4Z45bJ84+e5gE9NPyYYJMAkGTwN2BDvrJiEirodbGYqbBTgk6VpBUG82BJqJkvVX1q7xu
	K3K+NrGSQ2ah1Q2L3w3mwvS3AaWzUiHe3nSQ5B1c0VD3AQn/sNCvHqMXm7+Yj8W8TEhBbitHlw8
	Ly7mZLFZmou0YnbYfhPHxsoS9sY1iiY59SZ+hnJ0KjlNL0QDKdWjXQz3dzftP9f7gEf09b1MDwi
	H+8Eit5ic3WPUSXcfonMJ+KH4=
X-Received: by 2002:a05:600c:5298:b0:48f:e230:1d12 with SMTP id 5b1f17b1804b1-490428dd63emr112065035e9.31.1779532428123;
        Sat, 23 May 2026 03:33:48 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49045282201sm118985305e9.8.2026.05.23.03.33.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 May 2026 03:33:47 -0700 (PDT)
Date: Sat, 23 May 2026 13:33:44 +0300
From: Dan Carpenter <error27@gmail.com>
To: "Alexander A. Klimov" <grandmaster@al2klimov.de>
Cc: Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Mark Greer <mgreer@animalcreek.com>,
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Elise Lennion <elise.lennion@gmail.com>,
	"moderated list:GREYBUS SUBSYSTEM" <greybus-dev@lists.linaro.org>,
	"open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] staging: greybus: audio: expect 0 from kstrtoint(),
 not 1
Message-ID: <ahGCiKYKIBPcylJ-@stanley.mountain>
References: <20260522055344.38733-1-grandmaster@al2klimov.de>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260522055344.38733-1-grandmaster@al2klimov.de>

On Fri, May 22, 2026 at 07:53:43AM +0200, Alexander A. Klimov wrote:
> kstrtoint() returns "0 on success, -ERANGE on overflow
> and -EINVAL on parsing error". In contrast,
> manager_sysfs_remove_store() and manager_sysfs_dump_store()
> checked for 1 which always failed the operation. I fixed this.
> 
> Fixes: f9a21a3f4919 ("staging: greybus: audio_manager_sysfs: Replace sscanf with kstrto* to single variable conversion.")
> Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>
> ---
>  v2: style (X,!X instead of X!=0,X==0)
> 
>  drivers/staging/greybus/audio_manager_sysfs.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/greybus/audio_manager_sysfs.c b/drivers/staging/greybus/audio_manager_sysfs.c
> index fcd518f9540c..581791d566e3 100644
> --- a/drivers/staging/greybus/audio_manager_sysfs.c
> +++ b/drivers/staging/greybus/audio_manager_sysfs.c
> @@ -44,7 +44,7 @@ static ssize_t manager_sysfs_remove_store(struct kobject *kobj,
>  
>  	int num = kstrtoint(buf, 10, &id);
>  
> -	if (num != 1)
> +	if (num)
>  		return -EINVAL;

Really num is the wrong name.  It should be ret.  Also the declaration
should be at the start of the function...  :/

regards,
dan carpenter

