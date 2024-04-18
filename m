Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED5B5168AF7
	for <linux-staging@lists.linux.dev>; Thu, 18 Apr 2024 14:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713451907; cv=none; b=YvInPailEjsmL7OKxBY76vNHA6XMXRUxKyCrx+3I3606hMMYdYXoYkweXCgZlFocg+7aDx+F0lbFwuW9ryOd2K8a50Z09t/Ai1Z3F1pTcMWCrFltg/mWT5K0y1DBNe6XGeuEPfVrLtukdjVMWJ81UuiNu3qaWQd7UE8OaSVoC4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713451907; c=relaxed/simple;
	bh=CbuQk1PghdDnmrxhojCwmpRorta2iCVuoxXGBVbnZE0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LpCDYY2u+f0kwNiFTlHcCnjNo9PWQ9x2yUyeglFF5iXuCkzc9LGo7e+LFMBeceHekDuCXwzpoQ3FFUX61836IljhjysEORuLP+NNBhCqvTtobSn2ADRYc8olsZXEojQ0uNBmFMbTfaNRuTyXc6X39x7wFbmWgSa5CFT3+fJUAK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=j5YCDI2V; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="j5YCDI2V"
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-4daab3cf090so499312e0c.0
        for <linux-staging@lists.linux.dev>; Thu, 18 Apr 2024 07:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713451905; x=1714056705; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oMqAEiiN7av4J6wM+O4afdcaiaOjYq8V1FKf5PLPclI=;
        b=j5YCDI2VrBliG2MPZzmCIRZMFX+Rm3GgQCWRj/jDHTwgj6Cv+vHPK5moBuXLhe4jFe
         NVOcYtKBiVpwzs3Cm5/QU2UPok78pN+AkreD6Qc+1LZtb6tyv1SBO37kEByvNAjDU9bQ
         1r2Xy2Of+ql2pzvyFd3+u6ovA7AyiwzpZ1Qb4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713451905; x=1714056705;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oMqAEiiN7av4J6wM+O4afdcaiaOjYq8V1FKf5PLPclI=;
        b=LoiHaQOacCAq08wmyRYZDXCbJN5TNaaaxSKiwLaWnEpenFQK7SKcmD+5Oxy65dsobG
         ROjC/b/LoVxFpch1exDXMmwvWBIrT7t5gRnRm1LKTG72YcicnNj7acgbczmSpgDWMqSj
         UNUqh4QVpfxCyr84Z1q5i31QtPrggzjmTD/Hw9vFf1FA1ramyos0fZnJST12QcpdG6WN
         HQdf+mkEhbrotILHktTaLrksSdunG5iptdIMMRTr1EHyk7DmytOiIua1NVbJ1k+sOu9Z
         9nLAuX1bMAH27V6GkjD5/FuM16gNP76l0fkQjft4LC4U8ZcCd9gP+aX+jVuWBSLNLFJm
         YgTw==
X-Forwarded-Encrypted: i=1; AJvYcCUIh09TNSotUctEhVvYMzXkTH0bVvjyqXMBxBN4bkpRROIojzpNwvW5elHI3tSUK9MEPR80XELXONKSkMKeOhuDhjbmjeCm4jEjJ6I+MQ==
X-Gm-Message-State: AOJu0YxU1AvB0SvEzkKdcsAf4OEVKuHbdyetMg00IpRh9LUeWtQhB3Nt
	8ZJvB5uGtz9YK4P2Yjm6Jiy21ekAGHqqWoeUn7FYB26bm8thnGXn4ud9jOG2vdS/cwtfslQ9rLQ
	=
X-Google-Smtp-Source: AGHT+IGjS+q258mb9gdR1tXCDfr+391qQ9tF1lFYaYfG+xJImGrRjIhGfKb30VT+OCvpQeX93nSOkw==
X-Received: by 2002:a1f:f201:0:b0:4d5:f28b:2c2c with SMTP id q1-20020a1ff201000000b004d5f28b2c2cmr3412482vkh.3.1713451904696;
        Thu, 18 Apr 2024 07:51:44 -0700 (PDT)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id r7-20020ab06f47000000b007e7b2f8e0b5sm175425uat.13.2024.04.18.07.51.43
        for <linux-staging@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Apr 2024 07:51:44 -0700 (PDT)
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-7e8a4947785so755392241.1
        for <linux-staging@lists.linux.dev>; Thu, 18 Apr 2024 07:51:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUPIC9jX9ygKaIrbkGmvmA6GNKBBQIwe20qlvFXLWNvwC70koSCVbJSTeENBSRD90Y1xxTQv2k5tyXozays3zAAAXm+nse6T8kRdNufGA==
X-Received: by 2002:a05:6214:4a5b:b0:6a0:4571:e0c8 with SMTP id
 ph27-20020a0562144a5b00b006a04571e0c8mr3999896qvb.18.1713451882078; Thu, 18
 Apr 2024 07:51:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240415-fix-cocci-v1-0-477afb23728b@chromium.org>
 <a003494c-a1a9-4fcd-83d8-766a75d6bbb2@moroto.mountain> <20240417155112.GQ12561@pendragon.ideasonboard.com>
 <CANiDSCs_qOXkhzuL+cFhpw0hvFMwU0TYyN2B5ZdAStb96TTKFA@mail.gmail.com> <20240418105310.GV12561@pendragon.ideasonboard.com>
In-Reply-To: <20240418105310.GV12561@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 18 Apr 2024 16:51:06 +0200
X-Gmail-Original-Message-ID: <CANiDSCuS3KQK9H37sDZJ+mcqheNSh7NBwchS3dPccVXcPTSNRA@mail.gmail.com>
Message-ID: <CANiDSCuS3KQK9H37sDZJ+mcqheNSh7NBwchS3dPccVXcPTSNRA@mail.gmail.com>
Subject: Re: [PATCH 00/35] media: Fix coccinelle warning/errors
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, 
	Martin Tuma <martin.tuma@digiteqautomotive.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
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
	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, Vikash Garodia <quic_vgarodia@quicinc.com>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, Jacopo Mondi <jacopo+renesas@jmondi.org>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
	Pavel Machek <pavel@ucw.cz>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev, 
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	Oleg Drokin <green@linuxhacker.ru>
Content-Type: text/plain; charset="UTF-8"

Hi Laurent

On Thu, 18 Apr 2024 at 12:53, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Ricardo,
>
> On Wed, Apr 17, 2024 at 06:19:14PM +0200, Ricardo Ribalda wrote:
> > On Wed, 17 Apr 2024 at 17:51, Laurent Pinchart wrote:
> > > On Tue, Apr 16, 2024 at 11:47:17AM +0300, Dan Carpenter wrote:
> > > > In my opinion, it's better to just ignore old warnings.
> > >
> > > I agree. Whatever checkers we enable, whatever code we test, there will
> > > always be false positives. A CI system needs to be able to ignore those
> > > false positives and only warn about new issues.
> >
> > We already have support for that:
> > https://gitlab.freedesktop.org/linux-media/media-ci/-/tree/main/testdata/static?ref_type=heads
>
> Those are manually written filters. Would it be possible to reduce the
> manual step to flagging something as a false positive, and have a
> machine build the filters ?
>

Do you expect that the list of exceptions will grow?

I hope that once the CI is in place we will fix the warnings before
they land in the tree.


> > But it would be great if those lists were as small as possible:
> >
> > - If we have a lot of warnings, two error messages can be combined and
> > will scape the filters
> > eg:
> > print(AAAA);
> > print(BBBB);
> > > AABBBAAB
> >
> > - The filters might hide new errors if they are too broad
> >
> >
> > Most of the patches in this series are simple and make a nicer code:
> > Eg the non return minmax() ,
> > Other patches show real integer overflows.
> >
> > Now that the patches are ready, let's bite the bullet and try to
> > reduce our technical debt.
> >
> > > > When code is new the warnings are going to be mostly correct.  The
> > > > original author is there and knows what the code does.  Someone has
> > > > the hardware ready to test any changes.  High value, low burden.
> > > >
> > > > When the code is old only the false positives are left.  No one is
> > > > testing the code.  It's low value, high burden.
> > > >
> > > > Plus it puts static checker authors in a difficult place because now
> > > > people have to work around our mistakes.  It creates animosity.
> > > >
> > > > Now we have to hold ourselves to a much higher standard for false
> > > > positives.  It sounds like I'm complaining and lazy, right?  But Oleg
> > > > Drokin has told me previously that I spend too much time trying to
> > > > silence false positives instead of working on new code.  He's has a
> > > > point which is that actually we have limited amount of time and we have
> > > > to make choices about what's the most useful thing we can do.
> > > >
> > > > So what I do and what the zero day bot does is we look at warnings one
> > > > time and we re-review old warnings whenever a file is changed.
> > > >
> > > > Kernel developers are very good at addressing static checker warnings
> > > > and fixing the real issues...  People sometimes ask me to create a
> > > > database of warnings which I have reviewed but the answer is that
> > > > anything old can be ignored.  As I write this, I've had a thought that
> > > > instead of a database of false positives maybe we should record a
> > > > database of real bugs to ensure that the fixes for anything real is
> > > > applied.
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda
