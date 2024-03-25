Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06C1F4085A
	for <linux-staging@lists.linux.dev>; Mon, 25 Mar 2024 19:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711395762; cv=none; b=J2taSpB+x/Clr2UyOPNtOEuVyfIsTrqVZT2FED6gGIkHmmBfJ06xnU/G1rLQ+RaRTuarQg9KZieeTT6PxM7M+TKaY4PbkLRhB0YSADu55x7OhQ2uLElmqBmC7MMSt27l1Gyb3JxRmS4SioSkb5FwiaML7tDcdMKI2msvenn6lQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711395762; c=relaxed/simple;
	bh=iR4RWM9SW15Ytpe+zLkScY//gHwgLlOIGaQIIcnl9hw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a904aYKQnvEiBbbLQ9ym16pDD/V3eIrvdEZrahe5iJ05z9sA0zXDtx1acu+7IA0LWQIQ5dqpSzqDtjRAoFc1WpA8docoFJUPazO1+0BmB71I8EC9GJtypt8RTB1CZGu22qrcNVJdPlcCa2Ttk1CWD+DOWPq9JMoj7eIWorWkhys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=USwK21/M; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="USwK21/M"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-566e869f631so5090836a12.0
        for <linux-staging@lists.linux.dev>; Mon, 25 Mar 2024 12:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711395759; x=1712000559; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KuzOZKWfexqxW20YM2/HIeua9/M06pZ/a0UxyioS85Q=;
        b=USwK21/MWb1QFbbQrxgmUEmn8q7rznca1HEzK9QLmgQX/UhFt1PR9t27X7K1NwyEsD
         Q33TVumzzWcX92KNhusOSnf7FyKg65RNZKB6JYrM9JHLzyhJGYqzp8R81VY3LZNROSVB
         m3cSSLGaul7TYtWV2s2XWDKV9JEpQUt9UQGWsntee/NRHmprDG00ToLirMNTSYgpepVc
         GF+ps2KbiNAj+mTeXVZE2wjmye9khTDQPrJ8BDbvN1YvzTaD2kavCQ0F2qxkps8loVE1
         GiyBET7pDs6vowY1lQ2kwysHr4VZEkTSf25WWaiLNvxzuueHwBjh8OyHtiI5Wfkr/dBy
         hPcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711395759; x=1712000559;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KuzOZKWfexqxW20YM2/HIeua9/M06pZ/a0UxyioS85Q=;
        b=sNGQMz6PjmDaoHG+htk2yUopOVMLv7G5oly+pzoTDLwXGcl+GMphtHKqA3mkt7Z+Gs
         KUdsoty021gvPtKL0cl706zfgLlsr1KW2dg8tPEUYZGzhnapvwWVR4tTTc+W+7oZXzBC
         0xvYMIu0tlEYfojyjYoZ02TnSEyV+hJ5xIWKOvAPEYcXY6PNymc2w1nu69uCAaw6wDvk
         t9qzMDXwCIxeUABkgDD261eiTs500qQvRWivinhBIGV08xVgp9+GhOH4bgdFtPMvt9Bl
         6jaN7IFPBu+xlpz7SbN1CIfSUeFySO7BRFYG8KyAbHDWFoBHxLyR+LDAicqHKbcVKkT/
         VcPw==
X-Forwarded-Encrypted: i=1; AJvYcCXXbDm3O1taiT4508GLZCijpA0rVc5fhwH9q/Um4Ghr/fvI35j7MjOjzFUnKM4PgXL0EhXdgJ09tTufvyHe8Wm4poie0AtqVGH99qSXKg==
X-Gm-Message-State: AOJu0YxOp6mCw1Hwrp37Ov63y7IuvQT1SSP2CuxzpccmXqEBf16nGqWw
	gPG1cQEkvf7uSwRQby9vkDdvZj/TgJb8LPe9XHv39a6oAyyqgFs5xCQBu4Cg8Lo=
X-Google-Smtp-Source: AGHT+IHJIy9p7akZElmhV942HZMfhlm4dCbkmPK86uIB7i5F9c7KRMFn/SQ4Eba22ZuVgffwIIA3og==
X-Received: by 2002:a50:c357:0:b0:56c:1884:90cb with SMTP id q23-20020a50c357000000b0056c188490cbmr1784534edb.5.1711395759202;
        Mon, 25 Mar 2024 12:42:39 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id cn28-20020a0564020cbc00b0056bf2e2c898sm3307359edb.1.2024.03.25.12.42.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 12:42:38 -0700 (PDT)
Date: Mon, 25 Mar 2024 22:42:35 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Prasad Pandit <ppandit@redhat.com>, florian.fainelli@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	linux-arm-kernel@lists.infradead.org, rjui@broadcom.com,
	sbranden@broadcom.com, linux-staging@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Prasad Pandit <pjp@fedoraproject.org>
Subject: Re: [PATCH v3] staging: bcm2835-audio: add terminating new line to
 Kconfig
Message-ID: <201b6c82-1ebf-4dc2-9221-4fc87d1dd565@moroto.mountain>
References: <20240313114126.1418453-1-ppandit@redhat.com>
 <2024032540-scrubbed-reluctant-8860@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2024032540-scrubbed-reluctant-8860@gregkh>

On Mon, Mar 25, 2024 at 07:04:15PM +0100, Greg KH wrote:
> On Wed, Mar 13, 2024 at 05:11:26PM +0530, Prasad Pandit wrote:
> > From: Prasad Pandit <pjp@fedoraproject.org>
> > 
> > Add terminating new line to the Kconfig file. It helps
> > Kconfig parsers to read file without error.
> 
> What in-tree parser has a problem with this file as-is?  If it's an
> out-of-tree parser, that's different, and the tool should be fixed, no
> need to touch the kernel files for no good reason.

It's annoying to cat a file when it doesn't have a newline on the end...

dcarpenter@moroto:~/progs/kernel/trees$ cat -n drivers/staging/vc04_services/bcm2835-audio/Kconfig
     1  # SPDX-License-Identifier: GPL-2.0
     2  config SND_BCM2835
     3          tristate "BCM2835 Audio"
     4          depends on (ARCH_BCM2835 || COMPILE_TEST) && SND
     5          select SND_PCM
     6          select BCM2835_VCHIQ if HAS_DMA
     7          help
     8            Say Y or M if you want to support BCM2835 built in audio.
     9            This driver handles both 3.5mm and HDMI audio, by leveraging
    10            the VCHIQ messaging interface between the kernel and the firmware
    11            running on VideoCore.dcarpenter@moroto:~/progs/kernel/trees$
                             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

So you could resend with that as a justification.  But, yeah, it's a
good idea to fix the tool as well.

regards,
dan carpenter

