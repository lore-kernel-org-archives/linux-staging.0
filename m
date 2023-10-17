Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5469747B;
	Tue, 17 Oct 2023 07:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l5kg0EIi"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-5a84204e7aeso35903757b3.0;
        Tue, 17 Oct 2023 00:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697527864; x=1698132664; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eDTzbP2xWSfZcdzhTVPjMCIeC76MnVa5/4v6LhJNkX4=;
        b=l5kg0EIifog0TyNvGsBy4SIWs+ro5/QDa6sG4WUOakuHkG/IpFXr5SZxO/l+w/c0fU
         bFYh515/2Cv8gwwI8I06zkQ4uLZx4Eb5b/xj7fmD6juL7xAgUl/saOeYYxoHGR40fn2W
         WNVEFnF9XfdRkCp52O1PDJc3hqybTzfWboyc1l4hmDB5VDLhBzN7FlhRehskzRgL/TF9
         IPwY0++ueo6fKYanQsvYYHZ9/qpBgwXGQPBJFj9fOgkn8+z+2LBTEMY9GHkPXAQdNdPE
         UAa7UyPsPi2z+W+409l6mpPJpr+GrPIq5fN5MJ2ZJc2D8M0Lojp7oIpIfSpmOzWuKD+g
         K8uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697527864; x=1698132664;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eDTzbP2xWSfZcdzhTVPjMCIeC76MnVa5/4v6LhJNkX4=;
        b=cci7efIRwRPynYtGU2c+CcgYS3JD+jV7ypfS/THDEhp+WL7GSw+u48nXnFT16WxXfx
         kWKTh2blZcrolQlmebHPvYH6q03pwbdOiNZ+PWfnFLT3m7Kt+HLz8fyRyp+52eFquMq1
         R5xLxrL+GjwdLPYwOL1OIqg7PllGJaJkrApwxPYL7i6+0f1Qnu5dcTbvTsUnE993pzra
         0GyJKtbyNcaRWQ3j35nKxWt4IHGe4fNp+FhJ325h+YutwztlPfDX2CDij4IwtQ73K5/m
         EgzpCeqynlq+g6Z2Rl1OCw1421acXQRN09iwcb2CCXCn2nwsM8ijUq/2qZwCmN/MSCd5
         QfzA==
X-Gm-Message-State: AOJu0YyrA4bHH72eGIm9lp56xpZGyf6awzPOXvyg4BOh91l1r/ct8qoE
	EQfYoX9zCPsm1Ep1PltEsKg=
X-Google-Smtp-Source: AGHT+IG25/o4TcNYMhrs5//KXEuFr8Lm92dWuvRLd4ntUpRXh4/VQczrlbTuVj51JMX8VrPiFLzv+Q==
X-Received: by 2002:a0d:dd8a:0:b0:589:c065:b419 with SMTP id g132-20020a0ddd8a000000b00589c065b419mr1608797ywe.34.1697527864621;
        Tue, 17 Oct 2023 00:31:04 -0700 (PDT)
Received: from gilbert-PC ([105.112.189.86])
        by smtp.gmail.com with ESMTPSA id h3-20020a816c03000000b005a7c969137csm406496ywc.19.2023.10.17.00.31.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 00:31:04 -0700 (PDT)
Date: Tue, 17 Oct 2023 08:30:58 +0100
From: Gilbert Adikankwu <gilbertadikankwu@gmail.com>
To: Julia Lawall <julia.lawall@inria.fr>
Cc: outreachy@lists.linux.dev, forest@alittletooquiet.net,
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] staging: vt6655: Rename variable bUpdateBBVGA
Message-ID: <ZS44MmlkQUtnuhz+@gilbert-PC>
References: <cover.1697495597.git.gilbertadikankwu@gmail.com>
 <9bd935c464671db2654c654964812cc48f4603d3.1697495598.git.gilbertadikankwu@gmail.com>
 <a060ab8-238d-dffa-ce4b-9b814667786c@inria.fr>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a060ab8-238d-dffa-ce4b-9b814667786c@inria.fr>

On Tue, Oct 17, 2023 at 06:48:00AM +0200, Julia Lawall wrote:
> 
> 
> On Mon, 16 Oct 2023, Gilbert Adikankwu wrote:
> 
> > Remove bool Type encoding "b" from variable name and replace camelcase
> > with snakecase.
> >
> > Mute checkpatch.pl error:
> >
> > CHECK: Avoid CamelCase: <bUpdateBBVGA>
> >
> > Signed-off-by: Gilbert Adikankwu <gilbertadikankwu@gmail.com>
> > ---
> >  drivers/staging/vt6655/baseband.c    | 2 +-
> >  drivers/staging/vt6655/channel.c     | 2 +-
> >  drivers/staging/vt6655/device.h      | 2 +-
> >  drivers/staging/vt6655/device_main.c | 6 +++---
> >  4 files changed, 6 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/staging/vt6655/baseband.c b/drivers/staging/vt6655/baseband.c
> > index 7d47b266b87e..f7824396c5ff 100644
> > --- a/drivers/staging/vt6655/baseband.c
> > +++ b/drivers/staging/vt6655/baseband.c
> > @@ -2087,7 +2087,7 @@ bool bb_vt3253_init(struct vnt_private *priv)
> >  		/* {{ RobertYu: 20050104 */
> >  	} else {
> >  		/* No VGA Table now */
> > -		priv->bUpdateBBVGA = false;
> > +		priv->update_bbvga = false;
> >  		priv->bbvga[0] = 0x1C;
> 
> I wonder about the name bbvga in the line above.  Does the initial b mean
> byte or is it a lowercase version of BBVGA?
> 
> julia

Hello,

bbvga is lowercase version of BBGVA. It was added with this commit 11b896e65f4bff7e412b3abca366ea0bdadc8834

Thanks
Gilbert
> 
> >  	}
> >
> > diff --git a/drivers/staging/vt6655/channel.c b/drivers/staging/vt6655/channel.c
> > index 6ac7d470c041..c11bc2dbc356 100644
> > --- a/drivers/staging/vt6655/channel.c
> > +++ b/drivers/staging/vt6655/channel.c
> > @@ -86,7 +86,7 @@ bool set_channel(struct vnt_private *priv, struct ieee80211_channel *ch)
> >  		return ret;
> >
> >  	/* Set VGA to max sensitivity */
> > -	if (priv->bUpdateBBVGA &&
> > +	if (priv->update_bbvga &&
> >  	    priv->bbvga_current != priv->bbvga[0]) {
> >  		priv->bbvga_current = priv->bbvga[0];
> >
> > diff --git a/drivers/staging/vt6655/device.h b/drivers/staging/vt6655/device.h
> > index 68bfadacfa7c..b166d296b82d 100644
> > --- a/drivers/staging/vt6655/device.h
> > +++ b/drivers/staging/vt6655/device.h
> > @@ -246,7 +246,7 @@ struct vnt_private {
> >  	unsigned char byAutoFBCtrl;
> >
> >  	/* For Update BaseBand VGA Gain Offset */
> > -	bool bUpdateBBVGA;
> > +	bool update_bbvga;
> >  	unsigned int	uBBVGADiffCount;
> >  	unsigned char bbvga_new;
> >  	unsigned char bbvga_current;
> > diff --git a/drivers/staging/vt6655/device_main.c b/drivers/staging/vt6655/device_main.c
> > index b08fcf7e6edc..b654fc24d725 100644
> > --- a/drivers/staging/vt6655/device_main.c
> > +++ b/drivers/staging/vt6655/device_main.c
> > @@ -179,7 +179,7 @@ device_set_options(struct vnt_private *priv)
> >  	priv->byBBType = priv->opts.bbp_type;
> >  	priv->byPacketType = priv->byBBType;
> >  	priv->byAutoFBCtrl = AUTO_FB_0;
> > -	priv->bUpdateBBVGA = true;
> > +	priv->update_bbvga = true;
> >  	priv->preamble_type = 0;
> >
> >  	pr_debug(" byShortRetryLimit= %d\n", (int)priv->byShortRetryLimit);
> > @@ -423,7 +423,7 @@ static void device_init_registers(struct vnt_private *priv)
> >  	/* initialize BBP registers */
> >  	bb_vt3253_init(priv);
> >
> > -	if (priv->bUpdateBBVGA) {
> > +	if (priv->update_bbvga) {
> >  		priv->bbvga_current = priv->bbvga[0];
> >  		priv->bbvga_new = priv->bbvga_current;
> >  		bb_set_vga_gain_offset(priv, priv->bbvga[0]);
> > @@ -1040,7 +1040,7 @@ static void vnt_check_bb_vga(struct vnt_private *priv)
> >  	long dbm;
> >  	int i;
> >
> > -	if (!priv->bUpdateBBVGA)
> > +	if (!priv->update_bbvga)
> >  		return;
> >
> >  	if (priv->hw->conf.flags & IEEE80211_CONF_OFFCHANNEL)
> > --
> > 2.34.1
> >
> >
> >
