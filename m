Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8092578C64
	for <linux-staging@lists.linux.dev>; Tue, 16 Apr 2024 07:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713254237; cv=none; b=f7ms84LtPokAjSYZ4+b9IHudBH97OPrCDZdAKz7ep3bjJI99WSfL2zsIKg5qZqTNz6EjOwzgunaXB/ZLivtqe7ZuRzJ6QUeOdYoTllaWMt2vPWsAZpojTuw4iRY6/jlhi3PagZbnO5QbpT40Eh2LD2T8UD33v0XBUlzJ7ozEs/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713254237; c=relaxed/simple;
	bh=b31AnnXrNGswz4m57sykrNwwz1aACR/ovPuykzmKvow=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r2ilCDnp9t/BzAX3ZTYA94cypZqcEH3cGe8DcLAethe561316VwU05Iy767i6SxFsYXXyTX6e4VV4tmUpcCoFz2k0PSaPneNgXXicwh1Zf1nVeTPGrmvgWYNBwTEVp1DRAp8+TPK9/60IXw7YDhRAac85uF/4tdOyXB5hJwdeKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jCRPGq4l; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jCRPGq4l"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-57009454c83so3328262a12.2
        for <linux-staging@lists.linux.dev>; Tue, 16 Apr 2024 00:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713254235; x=1713859035; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4HIZb2nKPjLTTz62XK4VK6Iwqa3YIDFbrj0IrJZaoNI=;
        b=jCRPGq4lzssMPyBZlUaFyUpwVO7VQU3C4xE0xEv11nZkwq4h792U6QoWPz0lANioic
         Z5xcNMPpuis3GcvdhPapceb9gqxID/navJKRUbS7WZ1mtDdhmBRIXES8GWsgV+IqCfi7
         zaWUY5FEUZKCwQva9UkryhihYWhzFIeMJRnd2mj64Rm+cBNRsyV/fHelW1FlYGWjAfNL
         gLvUGB73y9LQbQO0UTlz7wnVTyCpRb0zcE2hgIGVqjC5xt3ZSKnfQm7Y33B2EEoqlkKx
         kNidLkh4tY8DxnQZtboyzHUMToyNf9OsPIt42yVqFBeg79rZRoIWms3BjaoAEI5vgM/S
         QwaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713254235; x=1713859035;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4HIZb2nKPjLTTz62XK4VK6Iwqa3YIDFbrj0IrJZaoNI=;
        b=A1WPVuvkD/Iw+nJQZ+XquyOCWUs/F2eQjVKkyYZ894m0h2yaUYzpZjp0WnxIbWBudi
         0FB6EDly0PkapSwTzZeX+6c8szdDHydpMGYpR1U0HfyT9XKEJ4cJWy2DKc+ApYoH+yDo
         DrucDkqVdftkAPDh0AUXCE48afze6BuHI6Z/0eU2RLiaFpG9W5vRLpiv/uH8aTm/bpmh
         P0IvBhUqYaiBHTm8V7qCUAeUDRdOUJd/6ZwcOAKBdPx6iuxlMP+71/GQaOAMfknPmykP
         DOoABCYGXYR4az0g9rGi9au4tExOYB//Kjx49hPj8/km5tlmJEuMWplonIuRahbnfmZs
         fKpg==
X-Forwarded-Encrypted: i=1; AJvYcCXrN2sRwRQE/0WxXvR6W/aSKA3gnOUhyPydFPimDSEmRvGyKCIl3xc0Cdy19dBlRihZ2XmfuGU5vV9uL98zLwcgRGpMndgPCg/vpH641A==
X-Gm-Message-State: AOJu0Yz+Be1o0KImMA8n3+hlBfypNHWY8J5GWv0k29wLsbU5ynmllt69
	7+zZqz8Jt1l+Y8CtBXZDDowAyPXghJ9R5iqq5FtMXI0jaD7Op94sBCVjK1evvHg=
X-Google-Smtp-Source: AGHT+IFmYom8ca5REWXBouKNnF3JyRoh/X3BZipPWdBTLAjIHlxGuqZNeTPobNF+ISHRPd4L/JQwdg==
X-Received: by 2002:a17:907:764c:b0:a52:57ad:63d0 with SMTP id kj12-20020a170907764c00b00a5257ad63d0mr4228551ejc.20.1713254234712;
        Tue, 16 Apr 2024 00:57:14 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id kf20-20020a17090776d400b00a51e9b299b9sm6444928ejc.55.2024.04.16.00.57.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Apr 2024 00:57:14 -0700 (PDT)
Date: Tue, 16 Apr 2024 10:57:10 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Martin Tuma <martin.tuma@digiteqautomotive.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Hugues Fruchet <hugues.fruchet@foss.st.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hans Verkuil <hverkuil@xs4all.nl>, Sergey Kozlov <serjk@netup.ru>,
	Abylay Ospan <aospan@netup.ru>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Dmitry Osipenko <digetx@gmail.com>,
	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Jacopo Mondi <jacopo+renesas@jmondi.org>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Pavel Machek <pavel@ucw.cz>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 21/35] media: venus: Use div64_u64
Message-ID: <99b220ad-79e4-4920-9e90-6cd6a3349bb3@moroto.mountain>
References: <20240415-fix-cocci-v1-0-477afb23728b@chromium.org>
 <20240415-fix-cocci-v1-21-477afb23728b@chromium.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240415-fix-cocci-v1-21-477afb23728b@chromium.org>

On Mon, Apr 15, 2024 at 07:34:38PM +0000, Ricardo Ribalda wrote:
> us_per_frame does not fit in 32 bits. Use the appropriate div function.
> 

Really?  It's less than one frame per second?

regards,
dan carpenter


