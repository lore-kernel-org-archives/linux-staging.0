Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5872319600
	for <linux-staging@lists.linux.dev>; Mon, 29 Dec 2025 14:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767017855; cv=none; b=ke64BclpEn/tKBGhoID21aYUoaIIylLOoGUB1rpvzTBZbeQ+KVQH4PAP5YpqNq7JQXAfWOoa3H8FZw3ckvpvLPLYQnAYWMuigccL+7ROZy5ckz+QTSaRg6ID+dOlORdtQEeLzZuxcZK/ytwsAGf7b8xlXoKRg37t689iMLbQ0RU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767017855; c=relaxed/simple;
	bh=idWBxsg7evd6xv3ze1XDMsv3tEcoQzARmjAxZyH6Z6s=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AU59JyymP3XGO8jan6xTjueGF99BkonMztX1DoMv047GRvWCOnafuUEJw2ZAF/lTavTKt6WoybsA0OU0IpwMItZPbi+A5ZJtOWiTTJu7D2CAezbyERAHCu69jegy0HAkl3/DcKqOm83v9W9HVeIbDADvIZHW+UCKMGj1WFi+nnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m7u7A41y; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m7u7A41y"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4775ae77516so90325975e9.1
        for <linux-staging@lists.linux.dev>; Mon, 29 Dec 2025 06:17:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767017852; x=1767622652; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OxmPqDzQ1eh73iQT4nuH91AB3I70CPbxlV27YCDsWcI=;
        b=m7u7A41yqByYi705LRo62bT4zq6lQTKaVo6OcDTKVZ12jhPzW2/XkXb/+23Dbz+uXN
         ULIGh3EiAljv/fgz314+0fm4fAisTnouGzsisogdbv4PqCqwg3WXwnlxhpgC/imTpJEp
         GhJ6X47Y2OfvQ2se4UM0nHyv8zSXDqbCeAwOYbFU7GjAS/jV3XHhYyqjSyDRtNaAfgOy
         L1fq+hH/gkTtK8fc5LWp2l+pAzobjWsEjogZwknm1xH5VkuNlUdQ+43XGj+cVKsNz6RA
         aJi37xk5Ca8K4oZDnp35OQrvV9kv7DOZYBvMtEfzLs349zrrSdAzdLgn/Th1vQ2fambP
         lsrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767017852; x=1767622652;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OxmPqDzQ1eh73iQT4nuH91AB3I70CPbxlV27YCDsWcI=;
        b=ZywXs7KqDiuyDWD8P+4D2wFwW8iXkw7L8tvPWvE5RAh/ci7AwREfl6n/RlI12MjWDv
         XT9zr4Aj7FmhUIt1QJ4+cjLd0Qxbc/H5w5yvTTrmDRuZs0cJ9I2qgUGLD3dHmwLN1ZDU
         8FjddviprEULQBwPHqkwa8AssjINLKFROL1XnaHbBHRBQtyvzg2DmDmr6hicGAdPb0qX
         unF4l8wVJE8W8c90TL8m4MtCuOGjHHMScX0c8OUhsa56quorwtwQBfKdO1wl5M2A+y4/
         BjiGP0uOK/Ef2LAXd/9kt+MsjEXlfrZwa8/XvQyFlqAwQ6jIIEVmHK7vUbzn7AmalAOc
         zk1A==
X-Forwarded-Encrypted: i=1; AJvYcCV00Uw23Vk0uTsLrIWt/A7iz26zPnsz1VOIwpYVropoQeUtrgdaKqcXJ8rzLAThHj7TPthr6eo73DT9q8WQ@lists.linux.dev
X-Gm-Message-State: AOJu0YyUDe7q35xlPenYDunQvBQO4wmqrgQFR9DTkPrhMefTmqzeOykd
	Yn1KD1tYkpd6EYt4nYbrToQ6PWcWMzuLNiN+MlXrPqM8zPAvHDRipFhLg7RVgA==
X-Gm-Gg: AY/fxX7ikWiiNT+RXQ5Bt78yn4SDhYEy3oLjrUPRFQnLMTcAeJgpJwqV0nugbQjTVwe
	u3SO2eYVPUip0UGtBdf5p0tbza4ugH9DAKMAwy+DwoDUjOnTXk7ytbhnwzItKMgAfM1FRiB3T09
	fKpZ24TwMX4G+W0HE+6dst1f5hb3nM0A4q6KU595Q7iNmXAYZ03lGWLZ6ibVZLomLmwME9hfIqY
	KcVNXPMzU0uFVu91d37NPtIrwVyw3jlOxJOGR2JKFfgdNSv74CNx8rWMjEjgkRSeh1l1yFdOq3q
	6XXEIdlFdoeDCW5vPljNyvZjlzot7M0qgORfDnhwMv9dBH/jSEQmJAg3wJYBuUOiUCcHhh70OeW
	m2jngEILm6xEysOn7Uu2ywMez+ln+5Dz5RIlnUzo42KjFLVhYpOizgiNxJ/NE7TfZDKZzkQzuuE
	8KrI0WS5ETJ7hx8NSSnAGcp952PH6WZSto2mX5zS85b2R/vCNLpNeq
X-Google-Smtp-Source: AGHT+IFqLIYpIhCE0+V2lfdDOxx33PVDlLSyI+RSX7t/Dwp3SJx49tBapNLAXp/LwZmAS6YB0rdsMQ==
X-Received: by 2002:a05:600c:310e:b0:479:2a3c:f31a with SMTP id 5b1f17b1804b1-47d1956eb70mr359769615e9.1.1767017851748;
        Mon, 29 Dec 2025 06:17:31 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d19352306sm531408705e9.5.2025.12.29.06.17.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 06:17:31 -0800 (PST)
Date: Mon, 29 Dec 2025 14:17:30 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Sun Jian <sun.jian.kdev@gmail.com>
Cc: Vaibhav Agarwal <vaibhav.sr@gmail.com>, Mark Greer
 <mgreer@animalcreek.com>, Alex Elder <elder@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, greybus-dev@lists.linaro.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: audio: avoid snprintf truncation
 warnings
Message-ID: <20251229141730.2b863ba9@pumpkin>
In-Reply-To: <20251229112649.137391-1-sun.jian.kdev@gmail.com>
References: <20251229112649.137391-1-sun.jian.kdev@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 29 Dec 2025 19:26:49 +0800
Sun Jian <sun.jian.kdev@gmail.com> wrote:

> W=1 reports possible truncation when formatting widget and control names
> using snprintf() with a %s argument and fixed-size buffers. Build the
> prefixed names using scnprintf() plus strlcat() instead, so truncation,
> if any, is handled by the string helpers rather than during printf
> formatting.

That is just brain dead - more so than the fact the the warning is pretty
hard to ignore.
Commonning up the code as:
static void prefix_div_id(char *name, size_t name_len, unsigned int dev_id)
{
	char temp_name[32], *cp = temp_name;

	strscpy(temp_name, name, sizeof temp_name);
	OPTIMISER_HIDE_VAR(cp);
	snprintf(name, name_len, "GB %d %s", dev_id, cp);
}
should be enough and is about the best you can do.
Possibly worth a comment that name_len is expected to be 32.

The way this code processes the tplg_data isn't nice at all.
Convert the offsets to correctly typed pointers as soon as possible.
You might want to verify that the separate arrays don't overlap.

There is also the:
	curr = (void *)curr + w_size;
which AFIACT is just 'curr++';

	David

> 
> No functional change intended.
> 
> Signed-off-by: Sun Jian <sun.jian.kdev@gmail.com>
> ---
>  drivers/staging/greybus/audio_topology.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/greybus/audio_topology.c b/drivers/staging/greybus/audio_topology.c
> index 76146f91cddc..4293ab899390 100644
> --- a/drivers/staging/greybus/audio_topology.c
> +++ b/drivers/staging/greybus/audio_topology.c
> @@ -1087,7 +1087,8 @@ static int gbaudio_tplg_create_widget(struct gbaudio_module_info *module,
>  
>  	/* Prefix dev_id to widget control_name */
>  	strscpy(temp_name, w->name, sizeof(temp_name));
> -	snprintf(w->name, sizeof(w->name), "GB %d %s", module->dev_id, temp_name);
> +	scnprintf(w->name, sizeof(w->name), "GB %d ", module->dev_id);
> +	strlcat(w->name, temp_name, sizeof(w->name));
>  
>  	switch (w->type) {
>  	case snd_soc_dapm_spk:
> @@ -1169,8 +1170,8 @@ static int gbaudio_tplg_process_kcontrols(struct gbaudio_module_info *module,
>  		control->id = curr->id;
>  		/* Prefix dev_id to widget_name */
>  		strscpy(temp_name, curr->name, sizeof(temp_name));
> -		snprintf(curr->name, sizeof(curr->name), "GB %d %s", module->dev_id,
> -			 temp_name);
> +		scnprintf(curr->name, sizeof(curr->name), "GB %d ", module->dev_id);
> +		strlcat(curr->name, temp_name, sizeof(curr->name));
>  		control->name = curr->name;
>  		if (curr->info.type == GB_AUDIO_CTL_ELEM_TYPE_ENUMERATED) {
>  			struct gb_audio_enumerated *gbenum =

