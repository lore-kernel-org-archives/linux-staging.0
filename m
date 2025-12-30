Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD87929AB07
	for <linux-staging@lists.linux.dev>; Tue, 30 Dec 2025 22:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767133240; cv=none; b=PXs+YQOgnjyqVfbo+cQ7fM7dk7cTbmp3DyJVRoFlqtIEmcohCylmxihVpsHKlyhA95rX5CXDZqNub25KcnSw+xmIv8aj1ktr9VK9jCvMpOrF9aCSqU4CDe+9Ckeb/7YV9xwpzDmmNGRRCFIpr2vQVYbDsAyzEuqhMELTmXiph1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767133240; c=relaxed/simple;
	bh=CjQU4D0ezv8Xtzq3LSerIPTGTUt1oMP/rr2CCgvnx8I=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hzA2cQZf0HrNNgpAv06fCsJUJyj3nlWydJS+2qMU4oT+COTd/yqMuWgTRAXWUSTntj0j2bdaRHEZk4s2/DxbOsyHG+CsXvRY6KygQCNWJ3e5ufjxlvNUsZftsAnWP3ogQCOrTwpfBBafPyYJE1Sdfc2TzEiQMe5fbG+fp9siEmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lzs0rnvP; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lzs0rnvP"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-47a8195e515so63568735e9.0
        for <linux-staging@lists.linux.dev>; Tue, 30 Dec 2025 14:20:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767133237; x=1767738037; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sGGQSTUlZhJxYHgy8RV4vAFQdDFvSWTOXjMfOdrpY9A=;
        b=lzs0rnvPXUDqxKLHt4zUj3h2r8xUFodUPyXUEbS7kHqfju/AXiFcAMZIlCrVVCRyRo
         zrlSfvF1tnrPS3a/hplnB/08OIj4E6wfGWg818OtEUTc0m0HeNvC8nvoUdbaflcHlc+v
         HWy5MJWupPUNUL9bqBf/7rMw6VEQIdm9JQRoTXof7eS0tb9SXfoyR4LEOfgqAEURQaRB
         gpaYgxBmfIAAsYSfvAtE76TdgoUTiZRlOjpLCn4qe/ZHqM6SgTvx6GzwokeZ0+vYs96U
         O3laswdt404M/+rC3Mb9NYj/fNhh+3wu9M+m6PA2/ezmD7fk5+8r2u0wLPURnG2jITzg
         yMTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767133237; x=1767738037;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sGGQSTUlZhJxYHgy8RV4vAFQdDFvSWTOXjMfOdrpY9A=;
        b=SpT1l0euXmDwbZyt4kp1XgK0jXu2XrbeO7K/d/nrpNkOI899Ik7RoV2UF0k2DOcbmn
         vQnyzyP7ReOsYA4HQnhMhGLbAaxXJ9losSQwcKtlVQX/LEtPzspKUOhhTdw7tRXIGuVD
         Z/FEaKOYYmTHi2ET420jY8tADyQcuYzMHBhfjgh3mnZcXylLnlbT0WATCqdc/wnjn4wq
         2Ex9mmQdDAZYa3PsIBGCYnnq6jysLDtIniK8FcuGUSenmJHwyibtinlOaB73r8wsYeWf
         ZAKxbXMeOrWNyL6kUh4eKkazisKAoIdBrr88G7RoF6Yt0t3ZwGyKr4joe7gvTZLiKo6G
         Bhkw==
X-Forwarded-Encrypted: i=1; AJvYcCXO0AMUXxZbg7+ONv1i19lbMI4NBofX5o9MmYrNa5NT1FHXl1ErHe/tawSCLFaDLKAKwNU1O3tmuIZAopII@lists.linux.dev
X-Gm-Message-State: AOJu0YxnuACj5ycwT8gv2tHh4wtw6bRI1OmxjMatRxABuihz5eUqqYbS
	2F174TuHfh2HavHU62+pxLhZGGxNz9GPixep9Eowgg8XncYOm6fKh7jV
X-Gm-Gg: AY/fxX4RmjbIGBAJvGTMpxnLPPWNbZcCN5W8H0y79dp0h2iI0HfpDLYMHcDZDzcj+Og
	2qpJyX9NUambYYRATtgBvjqpFIlhUIOpaPEXGBCxWTD2qlhXv+C4L+PJphqpgBj0HGQoM2B/Ks0
	URts/4RjE8HH2bSAjn4FeSfrswX5lJ5z28O96tz03kdwBG1vwDADVloxDUoSUpwassCN4hchUXU
	lORkJYN7UZGLO8FIi+Kf6jtoBeOiWufOpQNDdampN8PGLBdIFgnW4NeOzhZONomv0RO9uZ7OvjK
	gpK8HEt9FTYko/v50e3CuUsCO3CPV5HyCJewo+ir4953fwwQ5hH9tqTQHlevS0KjvKAJHQ8bNII
	WTlfkkmhtTkoeg5gz4pGQWJoJQlOyZTPAn1/vPIeSUgM/rOVeN/BHQQpPTBTLujX48juvka1cyC
	26kkuoImX9ugZ8V97ec4j4uRt6aV6tCGzhsp5I+0tl2V2tC0+rJtdA
X-Google-Smtp-Source: AGHT+IGRbsWr1CjXDNRxuOQPJr5I9b+KOcFGioV2gJKWwo6gBLgB4LJQBEehEwC0bO4zoIs+uj05rA==
X-Received: by 2002:a05:600c:1c29:b0:46e:37a7:48d1 with SMTP id 5b1f17b1804b1-47d1959d4bamr467383295e9.34.1767133236770;
        Tue, 30 Dec 2025 14:20:36 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be3a40c5dsm266423085e9.6.2025.12.30.14.20.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 14:20:36 -0800 (PST)
Date: Tue, 30 Dec 2025 22:20:35 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Sun Jian <sun.jian.kdev@gmail.com>, Vaibhav Agarwal
 <vaibhav.sr@gmail.com>, Johan Hovold <johan@kernel.org>, Mark Greer
 <mgreer@animalcreek.com>, Alex Elder <elder@kernel.org>,
 greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: greybus: audio: avoid snprintf truncation
 warnings
Message-ID: <20251230222035.199100bc@pumpkin>
In-Reply-To: <2025123028-transform-nutshell-81fa@gregkh>
References: <20251229112649.137391-1-sun.jian.kdev@gmail.com>
	<20251230012908.214959-1-sun.jian.kdev@gmail.com>
	<2025123028-transform-nutshell-81fa@gregkh>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 30 Dec 2025 08:40:48 +0100
Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote:

> On Tue, Dec 30, 2025 at 09:29:08AM +0800, Sun Jian wrote:
> > W=1 reports possible truncation when formatting widget/control names
> > with snprintf() and a %s argument. Use a small helper and hide the %s
> > pointer from the compiler's truncation analysis via OPTIMIZER_HIDE_VAR(),
> > while keeping the existing snprintf() formatting.
> > 
> > No functional change intended.
> > 
> > Signed-off-by: Sun Jian <sun.jian.kdev@gmail.com>
> > 
> > Changes in v3:
> > - Replace the earlier scnprintf()/strlcat() approach with a helper
> >   keeping snprintf().
> > - Hide the %s argument from compiler truncation analysis using
> >   OPTIMIZER_HIDE_VAR().
> > - Add a small local length limit macro with a short comment.
> > ---  
> 
> The "changes" go below the --- line, as the documentation asks for.  And
> please include what changed from versions prior to that as well.
> 
> But:
> 
> >  drivers/staging/greybus/audio_topology.c | 22 +++++++++++++++-------
> >  1 file changed, 15 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/staging/greybus/audio_topology.c b/drivers/staging/greybus/audio_topology.c
> > index 76146f91cddc..35775067897c 100644
> > --- a/drivers/staging/greybus/audio_topology.c
> > +++ b/drivers/staging/greybus/audio_topology.c
> > @@ -1009,6 +1009,19 @@ static const struct snd_soc_dapm_widget gbaudio_widgets[] = {
> >  					SND_SOC_DAPM_POST_PMD),
> >  };
> >  
> > +/* Limit %s length to avoid -Wformat-truncation with snprintf() */
> > +#define GB_NAME_TMP_LEN 32
> > +
> > +static void gbaudio_prefix_dev_id(char *name, size_t name_len,
> > +				  unsigned int dev_id)
> > +{
> > +	char temp_name[GB_NAME_TMP_LEN], *cp = temp_name;
> > +
> > +	strscpy(temp_name, name, sizeof(temp_name));
> > +	OPTIMIZER_HIDE_VAR(cp);  
> 
> What?  Why?  That feels wrong.  Let's not add hacks for broken
> compilers.

I don't like it either.
But I don't know of any other way of silencing that compiler warning.
It is actually a real PITA and mostly pointless.
After all it only warns about strings it knows the maximum size of.
It is more likely that a truncation 'bug' will happen for an indefinite
length string.
After all, the whole point about snprintf() is that it truncates.
I can well imagine that trying to stop the 'format overflow' warning
has actually created bugs!

	David


> 
> > +	snprintf(name, name_len, "GB %u %s", dev_id, cp);
> > +}
> > +
> >  static int gbaudio_tplg_create_widget(struct gbaudio_module_info *module,
> >  				      struct snd_soc_dapm_widget *dw,
> >  				      struct gb_audio_widget *w, int *w_size)
> > @@ -1018,7 +1031,6 @@ static int gbaudio_tplg_create_widget(struct gbaudio_module_info *module,
> >  	struct gb_audio_control *curr;
> >  	struct gbaudio_control *control, *_control;
> >  	size_t size;
> > -	char temp_name[NAME_SIZE];
> >  
> >  	ret = gbaudio_validate_kcontrol_count(w);
> >  	if (ret) {
> > @@ -1086,8 +1098,7 @@ static int gbaudio_tplg_create_widget(struct gbaudio_module_info *module,
> >  	}
> >  
> >  	/* Prefix dev_id to widget control_name */
> > -	strscpy(temp_name, w->name, sizeof(temp_name));
> > -	snprintf(w->name, sizeof(w->name), "GB %d %s", module->dev_id, temp_name);
> > +	gbaudio_prefix_dev_id(w->name, sizeof(w->name), module->dev_id);  
> 
> This feels like a broken tool, let's not do foolish things just to make
> compilers quiet.  W=1 is not a good reason to just make things "silent"
> by moving code around like you did here.
> 
> sorry,
> 
> greg k-h

