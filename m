Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 084167B;
	Tue, 25 Oct 2022 15:15:40 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id a14so18851113wru.5;
        Tue, 25 Oct 2022 08:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r6+tPR/kzu6yF7DNjbTLOGctUOsV7x2e9sXfAZuE0k4=;
        b=K/0n8sGD13R9NapDToBhBYXraQ2lv2zWdofXSCF4F7BjIa6/wKU3fG1eRxjlEYsiXD
         c0YVX3StPEiX4/sDk8pF3BaoYxnxE5Vg9oaC/nl/oBwgbsZ9G/MHJVhgjkli8c9Lhp4n
         6x0BxFVlSjNYR76+vjd8I13nj/0cnPKK2k/kheJm9JmQhW0XsHpUsVv59PlUHo9WeZtt
         1puXpbkugYO9+ew8skdfhTD830InDexc/trs5T3qjef/5mdty2ideJ22l4a3lJwPTSqy
         HXSPlN7zpHx8QjtdKG8rXkzIhq3paMF8+XYbZQzMg3Jpv1D0phBioMJx6tAE3oMEfCRV
         BI5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r6+tPR/kzu6yF7DNjbTLOGctUOsV7x2e9sXfAZuE0k4=;
        b=tnzENKk4FzCH4gtmNsFQkVEIBZr+OX3Y/HQta+GK1kvNYlFnOSAi6IUEPi8U0saRdI
         eIAV2yHFGqRGIx05KpVs/VWNNDnqGUwbYngKiuDlLob6ukUvi9EhcuLBFGB4zyqSA081
         IdmOYEgWYRAhNK0crzlVEaGKoIhGXuodEXFywLvPLFdB/3ycxv5Dqmaxhqn8HeF6Va5c
         62OE2ymTVwHE1K2T/XfiMekTycYlfmg8YIPR5AkgqQ8tUUtDdT1AX/W3FZn9bMi8wXy/
         +roBX0pwoiK7bSu50V6b1wAsoyrqsw2VHAw5aw/7K2kDPuL4iBhYtnMfqbO8FamUW6Px
         cj6Q==
X-Gm-Message-State: ACrzQf1rvzUhqp2c8frJPN0mnN5JTdmLIuQKZ4PlSriZbtMitm3WNisp
	vakUnDv4wf7GqnYhNrHBPFl5yYjmAVRofQ==
X-Google-Smtp-Source: AMsMyM6L8Y9mJA8bh1cRNm85m47Dxo8RyLw6mQrzRo0S0OGLSTb5Y6EY/LQsZhz+jpc7NS+0GIN/Ww==
X-Received: by 2002:a05:6000:1862:b0:230:fc9a:813b with SMTP id d2-20020a056000186200b00230fc9a813bmr25408691wri.552.1666710928334;
        Tue, 25 Oct 2022 08:15:28 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id j37-20020a05600c1c2500b003b4c979e6bcsm12181227wms.10.2022.10.25.08.15.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Oct 2022 08:15:27 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc: mripard@kernel.org, mchehab@kernel.org, gregkh@linuxfoundation.org, wens@csie.org, samuel@sholland.org, hverkuil-cisco@xs4all.nl, linux-media@vger.kernel.org, linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 08/11] media: cedrus: prefer untiled capture format
Date: Tue, 25 Oct 2022 17:15:26 +0200
Message-ID: <4749341.GXAFRqVoOG@jernej-laptop>
In-Reply-To: <Y1f7LCVwRgT9FHDe@aptenodytes>
References: <20221024201515.34129-1-jernej.skrabec@gmail.com> <20221024201515.34129-9-jernej.skrabec@gmail.com> <Y1f7LCVwRgT9FHDe@aptenodytes>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne torek, 25. oktober 2022 ob 17:05:16 CEST je Paul Kocialkowski napisal(a):
> Hi Jernej,
> 
> On Mon 24 Oct 22, 22:15, Jernej Skrabec wrote:
> > While all generations of display engine on Allwinner SoCs support
> > untiled format, only first generation supports tiled format.  Let's
> > move untiled format up, so it can be picked before tiled one. If
> > Cedrus variant doesn't support untiled format, tiled will still be
> > picked as default format.
> 
> Makes sense to me. Of course the order shouldn't matter to smart-enough
> userspace but it doesn't hurt to serve the most generic case first.

Per Documentation/userspace-api/media/v4l/dev-stateless-decoder.rst driver 
should select most appropriate format for current platform by default. Setting 
capture format is optional by aforementioned document.

Best regards,
Jernej

> 
> Acked-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> 
> Cheers,
> 
> Paul
> 
> > Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> > ---
> > 
> >  drivers/staging/media/sunxi/cedrus/cedrus_video.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_video.c
> > b/drivers/staging/media/sunxi/cedrus/cedrus_video.c index
> > 3591bf9d7d9c..f9f723ea3f79 100644
> > --- a/drivers/staging/media/sunxi/cedrus/cedrus_video.c
> > +++ b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
> > @@ -56,13 +56,13 @@ static struct cedrus_format cedrus_formats[] = {
> > 
> >  		.capabilities	= CEDRUS_CAPABILITY_VP8_DEC,
> >  	
> >  	},
> >  	{
> > 
> > -		.pixelformat	= V4L2_PIX_FMT_NV12_32L32,
> > +		.pixelformat	= V4L2_PIX_FMT_NV12,
> > 
> >  		.directions	= CEDRUS_DECODE_DST,
> > 
> > +		.capabilities	= CEDRUS_CAPABILITY_UNTILED,
> > 
> >  	},
> >  	{
> > 
> > -		.pixelformat	= V4L2_PIX_FMT_NV12,
> > +		.pixelformat	= V4L2_PIX_FMT_NV12_32L32,
> > 
> >  		.directions	= CEDRUS_DECODE_DST,
> > 
> > -		.capabilities	= CEDRUS_CAPABILITY_UNTILED,
> > 
> >  	},
> >  
> >  };




