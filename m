Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BA362CA1
	for <linux-staging@lists.linux.dev>; Fri, 10 Dec 2021 18:33:08 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id o20so33083499eds.10
        for <linux-staging@lists.linux.dev>; Fri, 10 Dec 2021 10:33:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=R+5wfzvY98r911pdlNHS5MRZhjqkHPF9SqDy5RQ+nGs=;
        b=0FrAeyHRpiQDLNRCH38LGYEW5OlercFk3DROOyI+5MF4Aiw8BvLF+GCTJpv3NKxJy8
         w6XzrFa0A4VvMMlEU5z/Z298tMnaEJKBq6VeGIjX+thf/iO5KbDMg1BG2s0ux0pQV0XL
         L0w0pukiLEDpC5eKc8vPyhFf4+3+6sceGamqAVhs5Kn+fhrwpRXew7EnfGZfjV1KOpOo
         GsbDXtupxwNXVLa7onRj0aOr7ByIMeeLVr8b9i5Ih2ez3BMkuu+Noz8qQcPqLFM956T3
         mU1cLd9j/5Aeb5XROTdKgsLG6YeZUnyInnb8MjJCX3TEKg+E78spgZbNmQA8jGbD++MV
         Xm+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=R+5wfzvY98r911pdlNHS5MRZhjqkHPF9SqDy5RQ+nGs=;
        b=x6x2rHOeuAi+iH14qEUKkEvd/lcgQutlB18lpumOdORcL3mg236Tet3oDxdrA18tSP
         v3G2K4XfPFaau8i5rf2QUzZG+bgdv+uBWoovasMNnbtdRCZqKr5mIWXkdfy96EougkHn
         qh9tBJn9LdI59/+pgWazzEMFL9+8Ze27rQwAsI64LxMsb6Yva1UqYAnloV/0NhV/LWV4
         Ylq3aTnp0ahFg0kks+BUxTAOx8ypccVE1Ziv8lr18X+dXkVQjcqpkKrhrK0Eh3t2CyG0
         sL5nfIG82GfV944AazjgwI3R4w2BWNdxjvIISy+mksrBy3CPG615T8ccjpPKh2xvczCG
         hf7Q==
X-Gm-Message-State: AOAM5305kYkJivx2gywewC0lMQ/7/+d+vXx5K/WKp/ZTcowU+0m8IFq5
	aKHozwjw3+twVfahe/snkJNtP2mWzygTnSXhoUopWg==
X-Google-Smtp-Source: ABdhPJw2lS/O2yAfLVTw6WVq78ELyMdt5/AEs5anuvPRPowAgkoa3NmZtsHE2c0DEj0r6fuPtxiB7KX0gypvQotrn6Q=
X-Received: by 2002:aa7:c30e:: with SMTP id l14mr40506518edq.370.1639161186439;
 Fri, 10 Dec 2021 10:33:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211208225030.2018923-1-aford173@gmail.com> <20211208225030.2018923-5-aford173@gmail.com>
 <YbHZvysazqYeZ8h3@eze-laptop> <CAHCN7xKrHSSsqS9DNL1tMH1Ctpz16FsSgcVbSHXzUWF98v738Q@mail.gmail.com>
 <YbNz94G3vwbHCMdB@robh.at.kernel.org> <c88b7a90f7a3bf94fc0cbb9a6f967ce769d5c03b.camel@pengutronix.de>
 <CAHCN7xLQrYy6H3U_yjCevu7F3AtEJJNbA7gdig=dn08hQfXCUA@mail.gmail.com>
In-Reply-To: <CAHCN7xLQrYy6H3U_yjCevu7F3AtEJJNbA7gdig=dn08hQfXCUA@mail.gmail.com>
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Fri, 10 Dec 2021 15:32:54 -0300
Message-ID: <CAAEAJfAuH_cupFkEN=5M3fy-JJ401EB3f2-6yvXFt9zJ4rYW4A@mail.gmail.com>
Subject: Re: [PATCH 04/10] dt-bindings: media: nxp,imx8mq-vpu: Support split
 G1 and G2 nodes with vpu-blk-ctrl
To: Adam Ford <aford173@gmail.com>
Cc: Lucas Stach <l.stach@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	linux-media <linux-media@vger.kernel.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Chris Healy <cphealy@gmail.com>, 
	Adam Ford-BE <aford@beaconembedded.com>, Nicolas Dufresne <nicolas@ndufresne.ca>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	NXP Linux Team <linux-imx@nxp.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"open list:HANTRO VPU CODEC DRIVER" <linux-rockchip@lists.infradead.org>, 
	devicetree <devicetree@vger.kernel.org>, arm-soc <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	"open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

> >
> > I'm in favor of dropping the old binding from the schema. New DTs
> > should clearly use the new binding and old DTs shouldn't change
> > anymore, so validation is less useful there.
>
> I wonder if it makes sense to have a more standardized hantro schema
> for all the users instead of one dedicated to each platform using a
> hantro driver.  The unified schema could have all the various
> compatible flags so the driver still knows which features are
> enabled/disabled and it's very clear who all the users are for it. I
> would think it could cover both the encoder and decoder variants as
> well.  We do something similar for 8250 serial ports.
>
> If so, can someone from the media group suggest the best one to
> follow?  Ezequiel suggested I look at the sama5d4-vdec to help reduce
> some clutter in the driver.  If that binding is good enough, should I
> just add the compatible flags to that and potentially rename it.
>

A unified schema might sound elegant and compelling, but I suspect
it can bite us down the road, due to differences in the platform integration.

Seems we are all on-board going forward with a patch similar to this one,
but also dropping the deprecated binding from the schema (while of course
still supporting old DTBs on new kernels).

Rob's suggestion about having a warning in the platform if the binding has
not been updated, sounds like very useful too.

Keep in mind v5.16-rc5 is near, which means we still have a few weeks to
discuss this patch, until the next linux-media merge season.

Thanks,
Ezequiel
