Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91AE5200D5
	for <linux-staging@lists.linux.dev>; Mon, 29 Apr 2024 11:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714390782; cv=none; b=O0nWy7hDfawwE1+nOGXaQEhDW64xkXZEEDy6vta1wx+eIN/00eZiatOcUpu0xevs94+8Uki80rWK8+k/ycJY9y7rstSJaBhJ2KHXSG2CoVl0KyH3B/ALUf7kZCeYJLUoKW84dlrwTbe/B0SjjiQTdu5Qi81j6I46tSWs9K89GJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714390782; c=relaxed/simple;
	bh=I96nVD/pvl/HbzA+JSRfMVYooN/S/Dzke1463qRCo+o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GT7DZuR4azcExT0EZUv+gI3sTMgWKFsEM8cOPuhzDJ3l+MmSquymAoDzpkVxSfOaseZoa21qb6EVd6wnqVl8Xdjk3yWlpKLTYqnm6Ef7/F6q+hRB98F8iZ5qLzrrE/w12wUDcIZX9ElFVUzlymJIzUGZmahmNnaMSBeJ5XI4hmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=PEaB0CNx; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="PEaB0CNx"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-6ee2d64423cso644263a34.2
        for <linux-staging@lists.linux.dev>; Mon, 29 Apr 2024 04:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1714390780; x=1714995580; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=05L08pI3kBTDsTqcTJqQ2PruWVHcpez2K/eYqwLWDm0=;
        b=PEaB0CNxdA17lIKERWOs/E8q0VU7mAUYuw9Kg3bVo0Cmb0GgOnPBNQw3DXz2etD34K
         lK4kdiyr2jk1gGTB8EU58tnyddWKlgifcGj3K4MwaI/opW3xARpZv13TTjij9GbVYC1+
         XcrZeD9GfR2SuBzOlMgzLwOJB69tZJrM8PhSM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714390780; x=1714995580;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=05L08pI3kBTDsTqcTJqQ2PruWVHcpez2K/eYqwLWDm0=;
        b=WBQ+y810EJhYTAAqhpiKwNAw6ugM+6B16/UnySUxStEFhn96Z4YzAB1y2Uv5OLcRYP
         bIY9j0zMO66LXRJPZGTd1iDhjkYMCjpi82lV8TAr2QElJy81zI3NneAeqU1jz2nFJshp
         JpWr1gH47JSdcpmYFAKMaZuz09pxah76m54bpDBm+Snlk0OBR6WNVgumxwAIBZOsdc7K
         P14VJPP2BH5LQ0w4RTJq3ejNYC1i5Zwwrm189k/La3FlA9QUzABznZCL8rtIsOpZUf5y
         O5a2pEhUsNivzdxFpkseka/1Hq+SmensDcnXw3pF3oRyY49Urf2KEE1doX06zzaz0xqs
         43zg==
X-Forwarded-Encrypted: i=1; AJvYcCWXXbwTk7fwaQDn5nKioYusXOjV2CCie6BIfFsXQKrJV15XzXVqIMKHL2W0AEkGSPggID6vY+yaaLQXTGTzfV9vl9EtUe2qISRorfW6YQ==
X-Gm-Message-State: AOJu0YxSH9/80Jp3jIjUHmxx//kkPDGtI2a50ExnkmRLFcav4reuA/B8
	LlexdDSNb5Nz/pRbSUBKNI57FYgExVnLsYmc9Lie/5gk4LPgeeENmjUc6j82MsSP0GWbzJXcjJs
	=
X-Google-Smtp-Source: AGHT+IEsY/PY3P4D4xeS8Sh1QDIUy7H3ISEqfduoVsykYTO3fm5yYTuJDVuIdYeBLyFhfFkj2hx9rQ==
X-Received: by 2002:a05:6830:1558:b0:6ee:35eb:f1b2 with SMTP id l24-20020a056830155800b006ee35ebf1b2mr2633027otp.29.1714390780382;
        Mon, 29 Apr 2024 04:39:40 -0700 (PDT)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com. [209.85.160.179])
        by smtp.gmail.com with ESMTPSA id y10-20020a37e30a000000b007907319aa02sm7154593qki.67.2024.04.29.04.39.40
        for <linux-staging@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Apr 2024 04:39:40 -0700 (PDT)
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-434d0a63151so26136091cf.3
        for <linux-staging@lists.linux.dev>; Mon, 29 Apr 2024 04:39:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVrMFeBygrYTWO092ZHXbntRS/S7ZhIgoK/dQ51IIi7VWMkcViXrXUyflmJRMUJ+Ay1UFGWCowsLiKe+/CG7ZaZ0TRYu7u0wwsvvPjl8w==
X-Received: by 2002:aca:f1a:0:b0:3c8:39b2:bd8b with SMTP id
 26-20020aca0f1a000000b003c839b2bd8bmr7165395oip.55.1714390759097; Mon, 29 Apr
 2024 04:39:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240415-fix-cocci-v1-0-477afb23728b@chromium.org>
 <20240415-fix-cocci-v1-23-477afb23728b@chromium.org> <97f51ae8-6672-4bd4-b55b-f02114e3d8d0@moroto.mountain>
 <7a8d403b-8baf-4eff-8f9c-69cdcb8b2180@moroto.mountain> <9ba7f4e6-2b8b-44a3-9cac-9ed6e50f1700@moroto.mountain>
In-Reply-To: <9ba7f4e6-2b8b-44a3-9cac-9ed6e50f1700@moroto.mountain>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 29 Apr 2024 13:39:03 +0200
X-Gmail-Original-Message-ID: <CANiDSCsCpE55_huYq1BchDCR88O3FWRYBGYwA00o01ZdZeL3NA@mail.gmail.com>
Message-ID: <CANiDSCsCpE55_huYq1BchDCR88O3FWRYBGYwA00o01ZdZeL3NA@mail.gmail.com>
Subject: Re: [PATCH 23/35] media: dvb-frontends: tda10048: Use the right div
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Martin Tuma <martin.tuma@digiteqautomotive.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, Hugues Fruchet <hugues.fruchet@foss.st.com>, 
	Alain Volmat <alain.volmat@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Sergey Kozlov <serjk@netup.ru>, Abylay Ospan <aospan@netup.ru>, 
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Dmitry Osipenko <digetx@gmail.com>, 
	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, Vikash Garodia <quic_vgarodia@quicinc.com>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, Jacopo Mondi <jacopo+renesas@jmondi.org>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
	Pavel Machek <pavel@ucw.cz>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev, 
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Dan

On Tue, 23 Apr 2024 at 11:55, Dan Carpenter <dan.carpenter@linaro.org> wrote:
>
> Btw, here is the output from my check (based on linux next from a few
> days ago).  There are some false positives because Smatch parses
> __pow10() incorrectly etc but it's mostly correct.

This looks pretty cool :)

Are you planning to add this to smatch soon?

Thanks!
