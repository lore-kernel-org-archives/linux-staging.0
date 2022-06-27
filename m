Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D048333FF
	for <linux-staging@lists.linux.dev>; Mon, 27 Jun 2022 17:44:50 +0000 (UTC)
Received: by mail-oi1-f182.google.com with SMTP id r82so5118937oig.2
        for <linux-staging@lists.linux.dev>; Mon, 27 Jun 2022 10:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=v+dkrP2udNa9sOxtusDdTPKwT59IDya3j7lSRZunhgo=;
        b=hq0YjRdG9AhL2dAGsQRZXNGTdvU4mcLdbhoK6/QbH1g+a5rBIVlYtl9tqXCIkSN4U7
         gtiV3/f9XovWSBq7G2K/20G4aSKDGIAEMqx5wtUkiv9cyWQFtBf72eEAFyJs7jTlNHZQ
         VITvQB+1q0n+jtiPp7xYaVdO7JZ2APg24MQxs0ZeTqGMaGDwQCYywXfru6wL/haAQPy+
         EEHt0s7ggb3g21vp3p+IGbKiZ243SeRZandqU9a2nIooRpNeR++J0jsS02uulYlsX5dq
         bec4pW4+j4Zxz4vHNfKpFxciD8P/KaR+1qBhctFCb7IUiRQ1Rz2mHZqrXV5sgdpPiOim
         lofA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=v+dkrP2udNa9sOxtusDdTPKwT59IDya3j7lSRZunhgo=;
        b=5C50cHxHNo0rKC5sIJ9Ljus0o+5gLR5QSNPImt4GO0/N21Uz54v3Zt4gRRiG02dRlf
         GE6owdv7rXDOLrSuUYR2J08YgCtmP3VlZB0iiJUmzCplT0yUkrkTYOVU8T/Zlw1X4g4e
         6uEGVpoCeMEPr9nzvn3091G8HM0oUBvv5orug+3IOxiFNaE3sabR+QkRL0w4IK7Cdsgu
         gGyfLcQAYVwUxg+a1lqG/qIaS2iOqWR/7JfVwOb3bjF6/8NguZy6uYIemL5LNtCBxPOz
         Fce4+PK8b7kgAaIv7tW30FCZo/VK86eYVwESnJxPeHwDV2HqwTumo5GAGu8JnQewYYF2
         7llw==
X-Gm-Message-State: AJIora+JDy1uTONWfDPjP369ykrOKJgVKd+G6YRq/Zjr6j2E7Vjkh5CY
	ZD9+IZNDm930pFZ9BCB3qXgfmw==
X-Google-Smtp-Source: AGRyM1tcFw++OyIJoIgcqrFORwWhgAzwJoCx66v4j6E9ylGaKiz54nY3UYOhi5uhQbmV96+7sensEA==
X-Received: by 2002:aca:f03:0:b0:335:4760:d9c8 with SMTP id 3-20020aca0f03000000b003354760d9c8mr8262390oip.128.1656351889745;
        Mon, 27 Jun 2022 10:44:49 -0700 (PDT)
Received: from eze-laptop ([190.190.187.68])
        by smtp.gmail.com with ESMTPSA id k19-20020a056870d39300b0010200e2828fsm7424768oag.30.2022.06.27.10.44.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 10:44:48 -0700 (PDT)
Date: Mon, 27 Jun 2022 14:44:43 -0300
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: Brian Norris <briannorris@chromium.org>
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	linux-media@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	kernel@collabora.com,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/5] media: rkvdec: Disable H.264 error detection
Message-ID: <Yrnsi2lbtYEDgTEk@eze-laptop>
References: <20220610125215.240539-1-nicolas.dufresne@collabora.com>
 <20220610125215.240539-2-nicolas.dufresne@collabora.com>
 <YqNzt9T9BaYu8tgb@google.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YqNzt9T9BaYu8tgb@google.com>

Hi Hans,

On Fri, Jun 10, 2022 at 09:39:19AM -0700, Brian Norris wrote:
> On Fri, Jun 10, 2022 at 08:52:11AM -0400, Nicolas Dufresne wrote:
> > Quite often, the HW get stuck in error condition if a stream error
> > was detected. As documented, the HW should stop immediately and self
> > reset. There is likely a problem or a miss-understanding of the self
> > self reset mechanism, as unless we make a long pause, the next command
> > will then report an error even if there is no error in it.
> > 
> > Disabling error detection fixes the issue, and let the decoder continue
> > after an error. This patch is safe for backport into older kernels.
> > 
> > Fixes: cd33c830448b ("media: rkvdec: Add the rkvdec driver")
> > Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> 
> This is effectively how ChromeOS previously was using this hardware for
> years. When moving to the upstream/staging driver, this started giving
> us problems. This fix is helpful; we'd rather sacrifice error detection
> for now, to avoid hanging the hardware in error cases ;)
> 
> Reviewed-by: Brian Norris <briannorris@chromium.org>
> Tested-by: Brian Norris <briannorris@chromium.org>

Reviewed-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

Given this is stable material, looks like we should queue it,
while the rest of the series is still being discussed.

Thanks,
Ezequiel
