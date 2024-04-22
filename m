Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD1E4481D7
	for <linux-staging@lists.linux.dev>; Mon, 22 Apr 2024 06:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713768804; cv=none; b=WHYafGJkqe2PBB4XA8pa0YLoN1KSoOV+vYdUAZTI7JO9PRe57Dr442TTRI2Ht9sVcSqcXgXZOMZZ+A3BHCuqRcIp/hpzNiOA/iAgSihOLlNj/yChK4nhcWkbsxMlZUBnho2rAB7iLETvoIBSMVBWTRexCkWSpkgdnm4RTFEaPmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713768804; c=relaxed/simple;
	bh=WyWHeoU/Ff7umbOe8XQrl/qZdNdvHSjb9SSotewTso8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pXOcguJJ+RPu48gRp6qoCs01UgR/7JK8icVMaSPZkm6HLwaQhsCn4HksiQrmrsi/Zr1egIrd92/AkSgjV0uhSb28Xji9dnJ1OOoLb9tV+ztjLAmlupcjn9F6BQaWAKXXMBmB2C2fKZOSDLC/sKiRwTHmcV0Vu/yQyh656l72Ecc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=SWxpGfqR; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SWxpGfqR"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-6eb55942409so2108845a34.1
        for <linux-staging@lists.linux.dev>; Sun, 21 Apr 2024 23:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713768802; x=1714373602; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dg+W9++cTuSKiuuJU3BmFvsGHmcNsDKvQ8sCokwEeZM=;
        b=SWxpGfqReDdJL9vnBSRf//zwO9v24bTjayy/Wuu3BJ90n4tD7vVXpeXOlE9EQ6WWIE
         VavJWjKMRNGLmMfiifF4CGC4hAGh868Ht4UDAgYK/vZyWPgSZw7EUgg4K263JESnUtbg
         9l3xm7fGEcsqtQJXUKM3ydaMyRPptfMkqth18=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713768802; x=1714373602;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dg+W9++cTuSKiuuJU3BmFvsGHmcNsDKvQ8sCokwEeZM=;
        b=GxmGnCxxTxVe3kgf3R/hrnikEqrrvRlVKs34IwaYRaOuh+MTFn/SGVchY6NiFRfa5X
         fAOR2CUqum3JEe/Kg/SPwpUQRKM68kuyQGnHhleVZESzP21mwehi6152A94U0zq3I1pM
         ifNuzB2QpXKNUYryaBEtH7FjgY5s5ZNBCt5mI97riz7lw/dVFgBYFsCMLE/30fgbTtd8
         8cYTE4dpvCW8hMbQ5k9s55WS3W7scXQCgMesWFzIDdK8IOOVqSLNcZWCTqeuzfK5Vv+i
         fyc543vA1rTaKUgQ4EkGc1YsS1Ql3iS4ahty7uf/bVuNrV2AFYHHS7o/US4Xc9op90Aq
         mDeQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQNlsjDypqkQ61pQ7ssJZ9DGSQPMuPrPDUCTs5v6lkNFGLGr6FjxiwPwNm07M/All4r02WQES/WA1qid0AqV3z4quZrQujrfOm4Yb63Q==
X-Gm-Message-State: AOJu0YxDw+YjDbvok3Wyu2WtU4/sISy/uOcqFGPfQSGBB3Yic7B0oDSI
	APh2eJswI3D/2sC5Kz2WOe5MQzK5uFGd8thN76UPPhhwgvkrUW2CrQ8eZwzLI3NEm2vEc3gMmEb
	fzw==
X-Google-Smtp-Source: AGHT+IG0tIVYL9laGEKp58WJu1enwaDrnt8w5LRgkYwWXZTggUE/XxJf8Z+b7ov7wgomxIAlnwNSxg==
X-Received: by 2002:a05:6830:2056:b0:6ea:1697:948b with SMTP id f22-20020a056830205600b006ea1697948bmr10667888otp.18.1713768801771;
        Sun, 21 Apr 2024 23:53:21 -0700 (PDT)
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com. [209.85.161.43])
        by smtp.gmail.com with ESMTPSA id i21-20020a9d6515000000b006eb958c4b9asm1560648otl.30.2024.04.21.23.53.20
        for <linux-staging@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Apr 2024 23:53:21 -0700 (PDT)
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-5ad28c0b85eso983295eaf.2
        for <linux-staging@lists.linux.dev>; Sun, 21 Apr 2024 23:53:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXdDV/v22oYfrEGrygk43xsZWftBwZowdiiBWD/QeUXOfygGIQVxetrOFPRG9QLTH3t1xr1uGQWeiJJFJjbzUcbuNMTHje5lrrnlSlNhg==
X-Received: by 2002:a0c:ec88:0:b0:69b:1aec:88fb with SMTP id
 u8-20020a0cec88000000b0069b1aec88fbmr9872064qvo.23.1713768779447; Sun, 21 Apr
 2024 23:52:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240419-fix-cocci-v2-0-2119e692309c@chromium.org>
 <20240419-fix-cocci-v2-6-2119e692309c@chromium.org> <124e35b3-5b0d-4bd7-848a-5c848b339157@linaro.org>
In-Reply-To: <124e35b3-5b0d-4bd7-848a-5c848b339157@linaro.org>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 22 Apr 2024 14:52:43 +0800
X-Gmail-Original-Message-ID: <CANiDSCt34D8-Ys+DbEQM0SyFdBF4WoV5_+xuuCjVbf22kT0xfw@mail.gmail.com>
Message-ID: <CANiDSCt34D8-Ys+DbEQM0SyFdBF4WoV5_+xuuCjVbf22kT0xfw@mail.gmail.com>
Subject: Re: [PATCH v2 06/26] media: stm32-dcmipp: Remove redundant printk
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Martin Tuma <martin.tuma@digiteqautomotive.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Hugues Fruchet <hugues.fruchet@foss.st.com>, Alain Volmat <alain.volmat@foss.st.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Sergey Kozlov <serjk@netup.ru>, Abylay Ospan <aospan@netup.ru>, 
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Dmitry Osipenko <digetx@gmail.com>, 
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, 
	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, Vikash Garodia <quic_vgarodia@quicinc.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev, 
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Bryan

Thanks for your review

On Sun, 21 Apr 2024 at 07:15, Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> On 19/04/2024 10:47, Ricardo Ribalda wrote:
> > -     if (irq <= 0) {
> <snip>
> > -             return irq ? irq : -ENXIO;
> > -     }
>
> You're dropping the original intent of the driver author there no ? when
> irq == 0 they want to return -ENXIO.

platform_get_irq() can never return 0.
https://lore.kernel.org/linux-media/cd4aac19-c4cf-4db0-a18c-42f1bf1441a8@moroto.mountain/

Let me add that to the commit message.

Thanks!

>
> ---
> bod



-- 
Ricardo Ribalda
