Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 107172C19E
	for <linux-staging@lists.linux.dev>; Tue, 16 Apr 2024 04:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713242493; cv=none; b=lSqLk0/aq0NPB8NbuZCoaEMAagm4nmAEwApIfXOl1emwRyPLs24hFM03w3QX8c3Z7LNRlQaBst5rw6AfuK1jmefs6uEJS3NQJA1PRFKTgzZCw+ya4RqDxq/WnUdPVJIAtqsF0t+kyy5WlIcKctETRcK9aG/DaaC+TeEzw2THeoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713242493; c=relaxed/simple;
	bh=DqDyd4MpI+rvYMYAT3Ft5xs95IMJydJhHOHuJjyBxW4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pPbY9i7b0NYgOJOCirJ49oR/xn6/+uXcJBKZSuNZjNtjIfoGZ7hiMENDQMMmTjQNJ/+IW9pDUm7B0A7Ta/A4bGglLNGXNLo9LDElbjL0M35vLlgy1wbugVVsOFAnJzrg+susjv0iADBvxWkaN9U0e9m1SLcQKYJqw7ZyTPx+fLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=TO+r8e8S; arc=none smtp.client-ip=209.85.160.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="TO+r8e8S"
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-23408962585so2028078fac.2
        for <linux-staging@lists.linux.dev>; Mon, 15 Apr 2024 21:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713242490; x=1713847290; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zlvfKPvFfqMVTjgmkdQ2dgHupdBvuhJAjVeekD23sMY=;
        b=TO+r8e8SWl8HQxH6nfYFdOaj8oSTdhrAtFkwWiXguvPZUvNglUc8hAqd0k79Ovjy2b
         Epps0CiuKrTk2zbfmoSTSw7sSk5HTjGsgLVKN7kfgRk/yhoNx0CKaSlKbGKA2lPI7Irn
         jWu2LSI46W28KjhGtV9S7o22Hb13JD5ReSChY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713242490; x=1713847290;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zlvfKPvFfqMVTjgmkdQ2dgHupdBvuhJAjVeekD23sMY=;
        b=w7dqfl0yY8jhVfDlwD02SkUmLTBt4jH3JlZdt2Mjq7WO/Vs8oMPHacxX7kAK4QqUj0
         quCd9JXVNheQv1eG5yW5Y5iJb+UX8xh369yp1CA4AicWEFk7eJtqcqbaGlq4fSwz5ub5
         bwSCZ5AkwgX8D5S/F79Ga6zBIohkV3p4BawSrgisHMXemQqWpwmIwOXmL4ZIdF8SQ9IR
         Mprli9oe+8UisSosU4dDNE8+pVexEdefE/yjot6pEmcT1p1/V5JVlAc5pIYKUEIXDXp3
         Xo1hecL+07gyGdmnGSIVuYaTXckgEHan9llzV0U2VoQbU7JyiejVpzv/eqgIOYNqWo1k
         5MSQ==
X-Forwarded-Encrypted: i=1; AJvYcCVnFHHqVUFVhECcovrxY+3Ob3u5yDt2jtNPQiZ1CQ7pwgzJY0NbloadrO5fANVCef13JidMscb5MUGAoUH3A4ipMD+GvbdnRNKrH/WlvA==
X-Gm-Message-State: AOJu0YzLSCBdecvS4+IFHexAi8B0LAazHMEIdgcRcGvS4bOOEKmcdj8C
	EdwSlntxx+pGkjNvR/YD3EVd6GqpH1uTRkX1z2+32Kvysx+Un2d0+6Pl21RGag==
X-Google-Smtp-Source: AGHT+IFGNPBipDIE0AiNQc/Cqlxd5431Vef5ObfevA6hF44fnzurKBxD1B4lS2oVTJREu9b1YFAdCg==
X-Received: by 2002:a05:6870:89a4:b0:22d:fcf9:bd97 with SMTP id f36-20020a05687089a400b0022dfcf9bd97mr15408827oaq.26.1713242490147;
        Mon, 15 Apr 2024 21:41:30 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:1137:d3d7:a09d:5379])
        by smtp.gmail.com with ESMTPSA id r4-20020a056a00216400b006edd05e3751sm8284703pff.176.2024.04.15.21.41.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 21:41:29 -0700 (PDT)
Date: Tue, 16 Apr 2024 13:41:19 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
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
Subject: Re: [PATCH 04/35] media: uvcvideo: Use max() macro
Message-ID: <20240416044119.GB14947@google.com>
References: <20240415-fix-cocci-v1-0-477afb23728b@chromium.org>
 <20240415-fix-cocci-v1-4-477afb23728b@chromium.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240415-fix-cocci-v1-4-477afb23728b@chromium.org>

On (24/04/15 19:34), Ricardo Ribalda wrote:
> It makes the code slightly more clear and makes cocci incredibly happy:
> 
> drivers/media/usb/uvc/uvc_ctrl.c:839:22-23: WARNING opportunity for max()
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
