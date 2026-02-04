Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 456203D34B8
	for <linux-staging@lists.linux.dev>; Wed,  4 Feb 2026 10:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770201163; cv=none; b=ed+E9RxNSk3EDj3pE5UBWy08vSWSLiAVn3eUwxIwrmOaK34zaZxOU/+TI1vcoN2y6g5VYeLLLMSQk6pQxga6Cf1HlM5AOaM4+9q145yP1ljDWHFjad0ygOlu2ElLhigOWod6H2NQJIfE/7HqCxS8kl1m1OQleLKB5tAiYIp/pNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770201163; c=relaxed/simple;
	bh=b2cRwyuXxJOInW7Wf1Nmi/IKrpY1TVgZuFPHiHNaWoI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=c95r3e3m0e+QpDDShIrnLha7hYyZ08Jq8UMPw4Dx9f0eVXaCbcYBGEakiUN/OaDfka79QAvjbpRwpubebjAf7ObQRn/zbXDp3pQ8E39Qj2SgN9rQLV9uZRa0pTFweRHHH+oh6FLcPFEWn/lX8cGe6UWVT6Dpbi+gb7cImMB1H54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bSEIYhUK; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bSEIYhUK"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4806fbc6bf3so70270175e9.2
        for <linux-staging@lists.linux.dev>; Wed, 04 Feb 2026 02:32:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770201161; x=1770805961; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MRBjj22CT+sIy28hxhJS7D7A0Tb1EUHDE7RRcCvtOJ0=;
        b=bSEIYhUKS5uvrJD3cCSsBCNycsCg606mBy/CeGzHT0xSAGpxOwCiZ2UI8V+72trDhl
         yvgsycf+CNRZ9IA9jiis28LQlaJ0mfOA0t5C9qUEm9J3FUDzRvQNVFuwj740fkBQooYq
         QOBnKakXfvm8ZM157wG3XzcFAPPpGaHtx4Fl9ffWEywi64LPNJTpNhw+cvhZZYc1Fv1i
         CPfzH2PepPz3aVtrmIea9drwawspxUhaxGjAAGzfljz+pNcE7qSA3G/0Z/pr6pSKQ8uq
         sdgXHl9SgJw8s6UzTkLJ2jw+IT3n6YXVm39npkwa+DZ04XUDFCAr1vvCte6fpChKFBoQ
         0Ofg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770201161; x=1770805961;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MRBjj22CT+sIy28hxhJS7D7A0Tb1EUHDE7RRcCvtOJ0=;
        b=o8BPE8JF1Y7+RXq0ZWfHqA+kSRMoK0XPhJoieVJmyBThC4KLN9lagzZYCgdIi15t88
         96zpePyGQCSY7L469d0DTNsnV5bnoI4tdaQi9e6aam/uZfx1rxMNKPjhtKzzyosuUPyB
         FfkV6Oc4rkfjugoOnTLOnPfzHA2LI+sNgEB88OYlF3Pj47ADhb3X0v0fl5d5HznCVmnQ
         jNk6m5PCrRWsHAwdMnEwkFfb2uDS5zQc9fukwX8iFuMrHXCQsYWsYkdI1a1HQp/pU6VQ
         flGmWzY6Gyh/bppbCC1+enneGLsrP2wrgs6Vz7P8ogrqNk1r0YwnY6PKOjSZNNAl8W7P
         6ksQ==
X-Forwarded-Encrypted: i=1; AJvYcCWH1BSokzy6pMEhg3K1lldzbkv8S9vY7EMq8rLe1XY+ltTuKYhXCsg962hXDAGcdDGWDwkZPoaIFLnR4hiE@lists.linux.dev
X-Gm-Message-State: AOJu0YxfOBrLVAH2waA/viIHSu8jJ8XMY81oOdq9qgonmD/mXbHH1jmQ
	ZyHcdEfA1yOtrXD46orRlfRnmFF+xWS2luGfJrhQJXT7TtHd8r2szrIl
X-Gm-Gg: AZuq6aIuHfGUAOxW+0556g3x4b2UfFQEKUtFEMhp3DfzJW/WijSxiARzNorakflozdN
	EOISmD4SA7bdsO2gCOc7CKfpKsSsWOU7fmOIlxDGyZdgQ2etD4EjNLZaQebSGs/1tg7ELaLMLfI
	MdOZYHr1UMyhRmeAv6864HMKnjKlz/HEt9ogGE3tXrVOSD/BfwBZ0Vf4GgPtzx+hM1Sg6C83OIN
	GGvLssSsEpFGgsp+OdoMSmditbNhJ9B9O+Akij69twE8cFCI1i2STt0zATbkPBwUlNzaF/Ca/D6
	zXwJsn7L3TWZX/GRDnRbkag3sVOqGOgA459/Kw892Dp3jO5j7Gmm234/rvhwS6vHh141MZdLIf9
	WBUNPEVnwoW47JaE3FJF7uBWMkJwf+RQC1YJeFyfrgqcR0dP+O2Ld6ythC3IcoqlHHTqTMXuDeB
	SufUFCKm37ZmOM7LyArvU2/bMgwt2oSWrKiyt8v0BZVgk4D8l/lSuH
X-Received: by 2002:a05:600c:4e05:b0:477:af07:dd21 with SMTP id 5b1f17b1804b1-4830e977f95mr35524735e9.25.1770201161433;
        Wed, 04 Feb 2026 02:32:41 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4831091a0e9sm61722105e9.10.2026.02.04.02.32.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 02:32:41 -0800 (PST)
Date: Wed, 4 Feb 2026 10:32:39 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Michael Harris <michaelharriscode@gmail.com>, Lars-Peter Clausen
 <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, David Lechner
 <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy
 Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] staging: iio: adt7316: convert magic numbers to
 BIT() and GENMASK()
Message-ID: <20260204103239.332b66af@pumpkin>
In-Reply-To: <20260131162140.5abb833b@jic23-huawei>
References: <20260130-adt7316-correct-macros-v1-0-8a71df1e42f1@gmail.com>
	<20260130-adt7316-correct-macros-v1-2-8a71df1e42f1@gmail.com>
	<20260131162140.5abb833b@jic23-huawei>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 31 Jan 2026 16:21:40 +0000
Jonathan Cameron <jic23@kernel.org> wrote:

> On Fri, 30 Jan 2026 23:38:28 -0800
> Michael Harris <michaelharriscode@gmail.com> wrote:
.. 
> > -	return sysfs_emit(buf, "0x%x\n",
> > +	return sysfs_emit(buf, "0x%lx\n",
> >  		chip->dac_config & ADT7316_DA_2VREF_CH_MASK);  
> Is the compiler complaining about these? It really should be able to tell that the masks
> are small enough that the original can always print the right thing.

That will be because BIT() and GENMASK() generate 'unsigned long' values.
Sort of silly when they are used for hardware registers that are fixed width.
You can use BIT_U32() and GENMASK_U32() instead - they will be
'unsigned int'.

	David

