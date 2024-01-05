Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8491420B09
	for <linux-staging@lists.linux.dev>; Fri,  5 Jan 2024 07:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nQ1Ku1mZ"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-50e67f70f34so1332664e87.0
        for <linux-staging@lists.linux.dev>; Thu, 04 Jan 2024 23:34:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704440064; x=1705044864; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=00sRjN2CupqB8Q7ctHplMwOy5YYcg3KEnI/LfxuJ5+A=;
        b=nQ1Ku1mZzI7res0gvx3ACMHejTAGebq52quWiW+Hzy0oBLbq5fnZtxIshGpIwIBNn9
         2XyIRZ/I3ZDgV2CmrPxAiufNchDoUqxnU+/Q57SSEj1W7MIOganI2aI6Yo/bXxYwusLn
         d8QtmbMxDkICcmO0eRYq/ZSN78ve79L5nh7J9sMN4jp57Pty8rkEs4oLmHfPSWH1SZDh
         cIoQzF//SbtaP9gzCYR5WWCThkX/yj2O4pdjBvmn8xpKoc1lHgQ22PvU6iG+BBo8waCj
         ity1FGdhAamqv2tGAvPiq8cFCzH+3O9Hmg/n75m72+UH/AMp/vg/2fagBbpIYmtUDjUj
         V+Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704440064; x=1705044864;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=00sRjN2CupqB8Q7ctHplMwOy5YYcg3KEnI/LfxuJ5+A=;
        b=OXWmj1/zn0+Vp4ItjdgvwfozHOxvfQHMaF4bCN/SX7XGeTGEYh9qR0SPF8wLAupR0V
         1QMRaJpgUi06OwGE4iekR/zCAo3yxYaINVSJRPySLdi2sNpJYkQuN96RQ/w2e18jj59L
         zpLA4G/qryH5QnQjB/IJKSCiJtx7ustFrByRGNmlbCHGtIn6pVqk6ooJXL/i+YGcgEBW
         ADNoCJ9T3Ldu1ST8jAvelTYp7EUsWwLKsot9qrB4fNkpblelVhFPiUKi20z0gEdLtkm5
         hQw9KgJYcueWJFCfl7W1gP2q/zfzblMOjPQ+s7Z7d+GiwKFV+h6w4dvPRXMw6SswvrrL
         Lcxg==
X-Gm-Message-State: AOJu0Yz5BeB0+KRY8qP6xlMz+xKdE2vw/AVnd5tqitTu7wi30+BjqgjI
	Ik2t5/fDEP8GXBU1lgNZhLesA+1/d3GfeA==
X-Google-Smtp-Source: AGHT+IFJPeJdKogeOQU8rBCXaTMRowRS002OJPjTz7DXhsqvVsPyf2CuFAyVwGskikaF3cKz713Frw==
X-Received: by 2002:ac2:5e29:0:b0:50e:7ded:5a2b with SMTP id o9-20020ac25e29000000b0050e7ded5a2bmr672265lfg.43.1704440064409;
        Thu, 04 Jan 2024 23:34:24 -0800 (PST)
Received: from localhost ([102.140.209.237])
        by smtp.gmail.com with ESMTPSA id oq3-20020a170906cc8300b00a293c6cc184sm399089ejb.24.2024.01.04.23.34.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jan 2024 23:34:24 -0800 (PST)
Date: Fri, 5 Jan 2024 10:34:20 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Hidenori Kobayashi <hidenorik@chromium.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: staging: ipu3-imgu: Set fields before
 media_entity_pads_init()
Message-ID: <a6f9ff72-421a-42c6-b24a-3dbf5a55e631@moroto.mountain>
References: <20231228093926.748001-1-hidenorik@chromium.org>
 <27f1c487-78cc-4e56-ba79-1434aba131fd@moroto.mountain>
 <20240105021856.wpzmwtyzxzqfznrp@google.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240105021856.wpzmwtyzxzqfznrp@google.com>

On Fri, Jan 05, 2024 at 11:19:23AM +0900, Hidenori Kobayashi wrote:
> On Thu, Jan 04, 2024 at 01:04:27PM +0300, Dan Carpenter wrote:
> > On Thu, Dec 28, 2023 at 06:39:25PM +0900, Hidenori Kobayashi wrote:
> > > The pad's flags is checked in media_entity_pads_init(), so it has to be
> > > initialized beforehand. The ops initialization is also moved together
> > > for readability.
> > > 
> > 
> > How does this bug look like to a user?  What is the Fixes tag?  Does
> > this need to be backported to stable?
> 
> I suppose I should have included those in the commit message.
> 
> 1) To a user, the imgu driver fails to probe with the following message:
> 
> [   14.596315] ipu3-imgu 0000:00:05.0: failed initialize subdev media entity (-22)
> [   14.596322] ipu3-imgu 0000:00:05.0: failed to register subdev0 ret (-22)
> [   14.596327] ipu3-imgu 0000:00:05.0: failed to register pipes (-22)
> [   14.596331] ipu3-imgu 0000:00:05.0: failed to create V4L2 devices (-22)
> 

Yeah.  This is super useful information.

> 2) Re Fixes tag, I see that the first commit of imgu driver already
> initializes the flags after media_entity_pads_init(). The documentation
> of this API ( "Drivers must set the direction of every pad ... before
> calling media_entity_pads_init") predates the first commit. So, I guess
> 
> Fixes: a0ca1627b450 ("media: staging/intel-ipu3: Add v4l2 driver based on media framework")
> 
> 3) Re stable, I was not sure. The probe failure only appears after a
> check was added by Commit deb866f9e3a45ae058b21765feeffae6aea6a193. That
> check is not in linux-6.6.y branch. So I was not sure if this counts as
> "a real bug that bothers people" mentioned in the document.

Hm...  I don't know either.  Wait for a day and see if anyone else has
an opinion then listen to your gut and resend with whatever your gut
says?

regards,
dan carpenter

