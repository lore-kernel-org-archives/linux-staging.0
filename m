Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E6471FC8
	for <linux-staging@lists.linux.dev>; Fri,  5 Jan 2024 02:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jKMMuB6J"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-6d9af1f12d5so830061b3a.3
        for <linux-staging@lists.linux.dev>; Thu, 04 Jan 2024 18:19:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1704421167; x=1705025967; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PtFtZ+5mwnqDmafnvGk1KxVAkboQiwGd/FdiEdjKkj8=;
        b=jKMMuB6JH2o/zrl8OxanfDx6qRKefxaHWTyinjt8ka0QREhHiEQohkaVmI4iN4R243
         mTj3pdrY0ARij7LGghBQwICmuEmrQtcVbmZu0VRO5JIUOIrO6JA8RSOwNjCjtH+ax9r0
         NLW7+wWEftSJ/dqr82yv1mLudjtEbJKyP4V68=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704421167; x=1705025967;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PtFtZ+5mwnqDmafnvGk1KxVAkboQiwGd/FdiEdjKkj8=;
        b=HYPCrHO8keGnNp+G/zvZF7jym984yjrGtrjmze5EOBPVOupq4oTmWfXIFgg7slgWfs
         9hc49CAAdKvG+z9qzyLWxVguWMlYvvLcg1CpecqCDEe/9om37uDkL2C21mDEOwYYVs/C
         89GCwLhtUmC/dSijNrCKSBhlT6FtJqMoP3PFf1asadKhEfi6SVabempSBJq8yB5wDjvG
         kMSRHWRFBzzeNhshIyG6fYkcRh6cCm6hRXPoxvHlrnH2k/TYdULKbUWJbKqlQ8sbS1cg
         froU0E0Qt5ah2euLy5h5REwuhcvFcCDv0oy+c0J6Myw8hx31s9q7H7Eapsz48BXs2tiU
         1Ogg==
X-Gm-Message-State: AOJu0Yy27azx+NiQG6fRTiW+f8QJ1uUnf/YRmUwrhyHsESrnCMjZwXTs
	ZrH7fEIlftZppzXOCsmBMHhQPcQtsCLJ
X-Google-Smtp-Source: AGHT+IG10zyDX+DZdfngP0HU48q9cOHuEIi1EQDy+l3D5Dbo4SFEIG4ySgoZuZ464VPGAeOFGGum7Q==
X-Received: by 2002:aa7:8896:0:b0:6d9:c201:66f0 with SMTP id z22-20020aa78896000000b006d9c20166f0mr1472598pfe.27.1704421167568;
        Thu, 04 Jan 2024 18:19:27 -0800 (PST)
Received: from localhost ([2401:fa00:8f:203:65cf:cf74:4dbc:9e23])
        by smtp.gmail.com with ESMTPSA id w9-20020a63d749000000b005cdf9c8e922sm339313pgi.85.2024.01.04.18.19.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jan 2024 18:19:26 -0800 (PST)
Date: Fri, 5 Jan 2024 11:19:23 +0900
From: Hidenori Kobayashi <hidenorik@chromium.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: staging: ipu3-imgu: Set fields before
 media_entity_pads_init()
Message-ID: <20240105021856.wpzmwtyzxzqfznrp@google.com>
References: <20231228093926.748001-1-hidenorik@chromium.org>
 <27f1c487-78cc-4e56-ba79-1434aba131fd@moroto.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <27f1c487-78cc-4e56-ba79-1434aba131fd@moroto.mountain>

On Thu, Jan 04, 2024 at 01:04:27PM +0300, Dan Carpenter wrote:
> On Thu, Dec 28, 2023 at 06:39:25PM +0900, Hidenori Kobayashi wrote:
> > The pad's flags is checked in media_entity_pads_init(), so it has to be
> > initialized beforehand. The ops initialization is also moved together
> > for readability.
> > 
> 
> How does this bug look like to a user?  What is the Fixes tag?  Does
> this need to be backported to stable?

I suppose I should have included those in the commit message.

1) To a user, the imgu driver fails to probe with the following message:

[   14.596315] ipu3-imgu 0000:00:05.0: failed initialize subdev media entity (-22)
[   14.596322] ipu3-imgu 0000:00:05.0: failed to register subdev0 ret (-22)
[   14.596327] ipu3-imgu 0000:00:05.0: failed to register pipes (-22)
[   14.596331] ipu3-imgu 0000:00:05.0: failed to create V4L2 devices (-22)

2) Re Fixes tag, I see that the first commit of imgu driver already
initializes the flags after media_entity_pads_init(). The documentation
of this API ( "Drivers must set the direction of every pad ... before
calling media_entity_pads_init") predates the first commit. So, I guess

Fixes: a0ca1627b450 ("media: staging/intel-ipu3: Add v4l2 driver based on media framework")

3) Re stable, I was not sure. The probe failure only appears after a
check was added by Commit deb866f9e3a45ae058b21765feeffae6aea6a193. That
check is not in linux-6.6.y branch. So I was not sure if this counts as
"a real bug that bothers people" mentioned in the document.


With the above, how does the following sounds to you?

The imgu driver fails to probe because it does not set the pad's flags
before calling media_entity_pads_init(). Fix the initialization order so
that the driver probe succeeds. The ops initialization is also moved
together for readability.

Fixes: a0ca1627b450 ("media: staging/intel-ipu3: Add v4l2 driver based on media framework")

Thanks for the guidance,
Hidenori

