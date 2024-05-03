Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AABA7152DEE
	for <linux-staging@lists.linux.dev>; Fri,  3 May 2024 11:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714737440; cv=none; b=cpVRvpemsgv6atywdrPyLsAp4Slj7Zo76kDXDXkeZwDHgsXFaScYaFEh4eGap6GMqEMAq943Fk+H24uXNvh++cnNQy7KDpayRWbYgcFO9hwX0Rnj0Z2W31UKn+0X5h0LINhiFdmUM+mzHAhJDN7doZ4H0QaqngqiYYAZCxTtxPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714737440; c=relaxed/simple;
	bh=CmcuBbTVhho6EBimKTWKrm1lTdbe7FzUQrr9f+yUs1U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aSjCQT7vBBvU/E1Gn6NuABL7WfdWIgZy1Alo+SflLSxZHddCXUq8olOM9wAzMJEHa7N5TiJ3YKeNwB9NPI9dM1Qo4FZmz5rzHj+CzobjqTrp2JJcOKPkuGJ3xsarxD6Wj/nG3/YTTMAq6vriVX9cCh0qt53omsmbFV6P6e1IP0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=HhhMa2T4; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="HhhMa2T4"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1ec41d82b8bso40327615ad.2
        for <linux-staging@lists.linux.dev>; Fri, 03 May 2024 04:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1714737438; x=1715342238; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=K7hPKV3HF7+4pxzh8EgR7k2JkSmFNYuW+tKLwH6I0Lg=;
        b=HhhMa2T4jVrDdeeRNUV1dDu8ikX/8TXI/G7wHrK6rUqvBpX5MSyK1zu5h0NfCLE9FP
         Pod6FPePiWI89uDDQYmI/znDarhc/yaxPWJoI7RgtzZ/OapgQUqfwgWzJ4gzRhRr+Y5o
         +lBQEG+qjtjUohW52NigrA+rXRehPB0gsK+eY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714737438; x=1715342238;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K7hPKV3HF7+4pxzh8EgR7k2JkSmFNYuW+tKLwH6I0Lg=;
        b=cb5ESEFkdSy/uZw1t6pH+B0UpgTkiR8kIjKONr4WT+z28HQMKk0ua3GA583ts+uZTO
         xWXIsDByTAZQRfwZ/B4bzk12ERFCmcbd++im4hOq0wgFraCEGmf8CDxBxvUeEuEwlXLm
         VE5DzkLAO3PdXzvJXwkCr7eA1T+pXVyNi9hileSbY/FBnt9SiZiFwNICwf8TZ17bOqyq
         ewiz8q+RKVQQFX26zeve8dszAAHQkElkUpudkFQJxx07483Jkft9dS8JhaFaCray0539
         YfJ9z5QHZqkgXrplVZjCzqViH9wKeNvex5b+ZIhS2qiDYnlvUr+4xSvkvFrQJuPBO1Qa
         08pg==
X-Forwarded-Encrypted: i=1; AJvYcCWwdbm/VPaoU7+OWfazsTB9/a/FCDq/jigsp9QYv/tge7+ikp0Ui55rCt9gyhSLpTc2Rwt/Z4e07mfxiPCLOuvYk0QiWSeI1kNXqUvZJg==
X-Gm-Message-State: AOJu0YwutA9nCIR70bU5HuNKkVzONpC80HmbHA6qJQqMQRuxtvk1BiJJ
	3VRAcEgpXCqal7gZkj8vg2bbLb4W1ZoTsIIlSrj8Y3DdofvkzlacYtzn2nLCIqYrQcqe2ZoN4oh
	wJQ==
X-Google-Smtp-Source: AGHT+IHJIGG5x6o8YyudFvCcGTzZLD6JKFMdhL03PA2FiIjfRSp77GvF0NEt6nyyvIbPV5eb6pXYQw==
X-Received: by 2002:a17:903:124d:b0:1e6:1a7a:98df with SMTP id u13-20020a170903124d00b001e61a7a98dfmr2416471plh.66.1714737438122;
        Fri, 03 May 2024 04:57:18 -0700 (PDT)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com. [209.85.216.48])
        by smtp.gmail.com with ESMTPSA id k7-20020a170902c40700b001ecae24f706sm3074367plk.51.2024.05.03.04.57.17
        for <linux-staging@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 May 2024 04:57:17 -0700 (PDT)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2b27c532e50so2740731a91.2
        for <linux-staging@lists.linux.dev>; Fri, 03 May 2024 04:57:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXaq/35uDtC/M5xZVARaKMxwwLVeyJeMssunyWyBB9utnMCvDPX5NeHLLrUiEMT0OgwG6+ceF0uIkINnW2pSkhhgbtP3vn+oxXLiTMsXg==
X-Received: by 2002:a05:6102:2329:b0:47b:d717:b689 with SMTP id
 b9-20020a056102232900b0047bd717b689mr2266975vsa.4.1714737415965; Fri, 03 May
 2024 04:56:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240429-fix-cocci-v3-0-3c4865f5a4b0@chromium.org>
 <20240429-fix-cocci-v3-26-3c4865f5a4b0@chromium.org> <20240503112758.763d8d31@sal.lan>
 <c4287024-8012-458d-9829-15ffbceb25cf@moroto.mountain>
In-Reply-To: <c4287024-8012-458d-9829-15ffbceb25cf@moroto.mountain>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 3 May 2024 13:56:44 +0200
X-Gmail-Original-Message-ID: <CANiDSCsU+jgYkUmHZOC8xPsL2DbgU7_sWrby1bQAXQNnp+g6Bg@mail.gmail.com>
Message-ID: <CANiDSCsU+jgYkUmHZOC8xPsL2DbgU7_sWrby1bQAXQNnp+g6Bg@mail.gmail.com>
Subject: Re: [PATCH v3 26/26] media: dvb-frontends: tda10048: Make the range
 of z explicit.
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Martin Tuma <martin.tuma@digiteqautomotive.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
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
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev, 
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

I am trying to get the DS, but
https://www.nxp.com/acrobat_download/literature/9397/75015931.pdf is a
dead links now.

Anyone have access to the datasheet?

Thanks!

On Fri, 3 May 2024 at 13:55, Dan Carpenter <dan.carpenter@linaro.org> wrote:
>
> On Fri, May 03, 2024 at 11:27:58AM +0100, Mauro Carvalho Chehab wrote:
> > Em Mon, 29 Apr 2024 15:05:05 +0000
> > Ricardo Ribalda <ribalda@chromium.org> escreveu:
> >
> > > We do not expect the sample_freq to be over 613MHz.
> > >
> > > Found by cocci:
> > > drivers/media/dvb-frontends/tda10048.c:345:1-7: WARNING: do_div() does a 64-by-32 division, please consider using div64_u64 instead.
> > >
> > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > ---
> > >  drivers/media/dvb-frontends/tda10048.c | 4 +++-
> > >  1 file changed, 3 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/media/dvb-frontends/tda10048.c b/drivers/media/dvb-frontends/tda10048.c
> > > index 3e725cdcc66b..1886f733dbbf 100644
> > > --- a/drivers/media/dvb-frontends/tda10048.c
> > > +++ b/drivers/media/dvb-frontends/tda10048.c
> > > @@ -328,7 +328,8 @@ static int tda10048_set_wref(struct dvb_frontend *fe, u32 sample_freq_hz,
> > >                          u32 bw)
> > >  {
> > >     struct tda10048_state *state = fe->demodulator_priv;
> > > -   u64 t, z;
> > > +   u32 z;
> > > +   u64 t;
> > >
> > >     dprintk(1, "%s()\n", __func__);
> > >
> > > @@ -341,6 +342,7 @@ static int tda10048_set_wref(struct dvb_frontend *fe, u32 sample_freq_hz,
> > >     /* t *= 2147483648 on 32bit platforms */
> > >     t *= (2048 * 1024);
> > >     t *= 1024;
> > > +   /* Sample frequency is under 613MHz */
> >
> > Are you sure about that? Some DVB devices have very high frequency
> > clocks, specially if they're also used for satellite, so I can't
> > be sure by just looking at the driver's code.
> >
> > Also, we had already a bunch of regressions with "fixes" like this
> > that actually broke frontend drivers.
>
> This patch preserves the existing behavior. The sample_freq_hz variable
> is a u32 so, in the original code, z couldn't have been more than
> U32_MAX even though it was declared as a u64.
>
> It's possible that the original code was wrong.  We have seen that in
> other places in this patchset.  Adding a note about the datasheet is
> also a good idea.
>
> regards,
> dan carpenter
>


-- 
Ricardo Ribalda
