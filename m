Received: from fout-b7-smtp.messagingengine.com (fout-b7-smtp.messagingengine.com [202.12.124.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE2E82E3FE
	for <linux-staging@lists.linux.dev>; Thu,  1 Oct 2026 05:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790831885; cv=none; b=KU86qMrJ/QmrYif+P298IKyP+x4Vzcr0MvIsCJvES9rpgV8MZBSSSK7JQY9/P8Ntd6s6Rfkz7kxUeVQHzlEuco4wM9XVwGdhusHNm8axMBpv8pQFtsHVt6aBrbLONA/hQPyp//qwjEIaceKLY1Q/E/rt2vZ7EzIXDknHUl7BKVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790831885; c=relaxed/simple;
	bh=xk81vqeMBWWYZI9hXyBbjQvIzetRt5eUcuHWm5gfRGo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KZJfkZuDOFh1W1PXwDUPyJvFXMTF+mwVGyqvd9rvT545QccQ1uTAx9T2rlIg6tW1l0O/stfDPXIFepkMG4F1UOuhEx1a5ClebcaNccUTcsOPKT9k6mnbrLeJKIgTXnoZyZ0SsvghPWeLc44egviobWKSUZuGjYP3giz8RD6iiEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=IDZERrFz; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=xU0f3YB2; arc=none smtp.client-ip=202.12.124.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="IDZERrFz";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="xU0f3YB2"
Received: from phl-compute-07.internal (phl-compute-07.internal [10.202.2.47])
	by mailfout.stl.internal (Postfix) with ESMTP id D786E1D000D7;
	Thu,  1 Oct 2026 01:18:02 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-07.internal (MEProxy); Thu, 01 Oct 2026 01:18:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1790831882; x=1790918282; bh=yKeve/C5A4
	p1jUEdyMgU/invpUB5OFzof8W7hranjFs=; b=IDZERrFzJXOdjIfKVsShbwxJke
	a3gm7mcTrOh7Moxmp3UifOj9KbbMTlPp0j0GcjPUEW6f7cHtYKEWuIMKIwbZBkRp
	8IqtZ1JhvlrM0n5OARzGfNm8/u3iTW/X1pVCfWzOnNJ43kAmBPGQmoC833I8PTya
	4/mQI0MOgqi01Oeqtd2rm2GSG8hKDLv3NEzGP1HTFjgZeGz8wdxtOV4PgZjCKcrJ
	4soMxFHDrol/dOJxa1Pt0XfnHWro6pwbahWC4H7tQ4WKQ2XGMJMWmSv1QtaBmJ1S
	Pd1+nMD3QbJhb8fw434e74ANVtqaQ7Wjf0sJ9erkqxvhYwZXHzMvJ/EQredg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1790831882; x=1790918282; bh=yKeve/C5A4p1jUEdyMgU/invpUB5OFzof8W
	7hranjFs=; b=xU0f3YB2c+owu4BitZkKmzb1Wfio2lErKGe4WhLtjIV2Ryrdgtj
	+bB0ZDue6LOxgpAaTHOY7KDdnwRfnvI4q7tntm6i45sCYAafHEkbUrhITUKhd3J7
	2Yvcli9flDHVYWPViA251L+nbQJf1EVRCBHx2OIAJTKdxt/z7d3VGUX+3I7+suBA
	yHIsJB7/tbQklW8O/dyt4Qg6AMeZPdiuPdX8AMFNhudc72Pe06BEWZF0kDqcMKDL
	fC40Eq2kDqjv2G9hWyiFFmmXKoRti3Q/ZwZV1VKjFudQclaTYEe3aJzEyE5gPEmH
	KsfVl7M3IWKIucuUFX4YHkMBGtfKoqr2BXQ==
X-ME-Sender: <xms:Cu29aug-2tVX6UPsn_icpAtLuaORnPlx3vGsOTGUfxHWhPNlsW8K0Q>
    <xme:Cu29as1GcSlvB5-N9_YDsmapDbJF_G3x17VDeVqbb9bAmUx7DstEHRgSDed9WwEwz
    ENpOuW4Y1COFNfhHE92Mxtyrb6Zq_3TrU33CJ5d-LBFouMwqQ>
X-ME-Received: <xmr:Cu29agiJFCMXYL7UDzBGOGS5Vli02715tkAPXQl-2F2_6HTInp4JMftBidtPY75KgiHbTgO9henq4qc4QGMEQGsqUILu5wdi0wsVKTa0kn0>
X-ME-Proxy-Cause: dmFkZTGik92oJEVY6R79gT2/d3B0/8GSW9bZCBmz6sNkVx4n9jBgX8w7cbuoQflwqulhm0
    MmJ30Af+OwuWWU96O3ZOU76exgFtmmc4RZYcVLGyZJcHNIBE74+53yXLYYScwTvBT4ySzw
    b+Nt46FgpVOkxCy4gJcOU1tRkNb5rFK4hyJDid7ljK+xIkNpVJqSkMz0TC6MQ5i9ETb+QF
    LZnE9MGglMXP0EENILgufuLwkdk+JZQvHOO605R3ZONx/VCFeBfdoaGySYa5UHkl6WyuiO
    6J96a+m6H91Vh04wOqZq3bgXLDp3VmPX9CjHlYqbLf27JWUf+PcWoW1h1i8jJ8z+Ni0AXs
    xXuT5GV933lVnJ55pgtnNitgLXqXE+Fpk4k3uS6aHMZDDX/2i6kPQMNDz3NXTqDfVqa5jq
    v36ZNcwVYlgHGZUMSZil1sHByGc4twUNCJRHZ8wU8Yc73rSwPXnwfV/I9HtwVPwIA2NVuj
    WMvQr0Z++/ox1tEjjrIVQjn6GLwv4KtlvYPQl9DMgtvjcmKmVixarNZdlmQMZnONxt6AWG
    e3S71CubV4HCJn9G4SSMuIn50naMxQ0VAyRoTkp5G8+5kfSiY8dZxRi2BQpgr5SvypmASw
    U9YIHulezvpB98JOFIgyxnd0s0c3LKxXmjEhqVgassB+wO3oAArFKSirJxGQ
X-ME-Proxy: <xmx:Cu29akfW0fQ087wm6aN7SCUHJox05M9jwcXKjf-_rK41CI13LtbDtA>
    <xmx:Cu29arkZO2dERmHOWLauS8JSo9tXB7W2TqJcGoSSw6Wc4iFcuUHkLQ>
    <xmx:Cu29alsQ_0zF19nrf-PMiTvikm8ln5pPKuwUEiIAGq8Gl8TBKmt6Iw>
    <xmx:Cu29ap9LQpLF2eJEmtdBcReWwt77crAozwtpQzH2ICWoqTiuIAxmpQ>
    <xmx:Cu29ahhEcnLWulLABupz84FdHlaZEP-R1fxxc77_A892qrwOk7qDbcLA>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 1 Oct 2026 01:18:02 -0400 (EDT)
Date: Thu, 1 Oct 2026 07:17:56 +0200
From: Greg KH <greg@kroah.com>
To: mimo-4@ilands.app
Cc: linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: greybus: audio: warn on truncated topology names
Message-ID: <2026100101-jazz-leverage-4000@gregkh>
References: <010101a0f1a1871a-66dc9225-3e85-411c-9845-d407864aaf9b-000000@us-west-2.amazonses.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <010101a0f1a1871a-66dc9225-3e85-411c-9845-d407864aaf9b-000000@us-west-2.amazonses.com>

On Wed, Sep 30, 2026 at 09:24:50AM +0000, mimo-4@ilands.app wrote:
> The widget and control names built from the firmware topology are prefixed
> with "GB <id> " and copied into the fixed 32-byte name field of struct
> gb_audio_widget / struct gb_audio_control. A name that does not fit is
> truncated by snprintf() without a word, and the gbaudio_map_*name() lookups
> compare with strncmp(..., NAME_SIZE), so two distinct names can end up
> comparing equal.
> 
> Warn when the prefixed name is truncated instead of failing quietly.
> Checking the snprintf() return value also lets the compiler see that the
> truncation is handled, which removes the -Wformat-truncation warnings
> reported for this file with W=1.
> 
> No functional change for names that fit.
> 
> Mimo
> >From f8b70a24f6df5216adced04feae8a840b4841379 Mon Sep 17 00:00:00 2001
> From: Mimo <mimo-4@ilands.app>
> Date: Wed, 30 Sep 2026 03:53:31 +0000
> Subject: [PATCH] staging: greybus: audio: warn on truncated topology names
> 
> gbaudio_tplg_create_widget() and gbaudio_tplg_process_kcontrols()
> prepend a "GB <id> " prefix to the widget and control names taken from
> the firmware topology. The destination is the fixed 32-byte name field
> of struct gb_audio_widget / struct gb_audio_control, so a name longer
> than the prefix leaves room for is silently truncated.
> 
> Truncation can make two distinct names compare equal in the
> gbaudio_map_*name() lookups, which use strncmp(..., NAME_SIZE), so
> report it instead of failing quietly. Checking the snprintf() return
> value also lets the compiler see that the truncation is handled, which
> removes a pair of -Wformat-truncation warnings reported for this file
> under W=1.
> 
> Signed-off-by: Mimo <mimo-4@ilands.app>
> ---
>  drivers/staging/greybus/audio_topology.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/greybus/audio_topology.c b/drivers/staging/greybus/audio_topology.c
> index 76146f91c..f87725f10 100644
> --- a/drivers/staging/greybus/audio_topology.c
> +++ b/drivers/staging/greybus/audio_topology.c
> @@ -1087,7 +1087,9 @@ static int gbaudio_tplg_create_widget(struct gbaudio_module_info *module,
>  
>  	/* Prefix dev_id to widget control_name */
>  	strscpy(temp_name, w->name, sizeof(temp_name));
> -	snprintf(w->name, sizeof(w->name), "GB %d %s", module->dev_id, temp_name);
> +	if (snprintf(w->name, sizeof(w->name), "GB %d %s", module->dev_id,
> +		     temp_name) >= (int)sizeof(w->name))
> +		dev_warn(module->dev, "widget name %s truncated\n", w->name);
>  
>  	switch (w->type) {
>  	case snd_soc_dapm_spk:
> @@ -1169,8 +1171,11 @@ static int gbaudio_tplg_process_kcontrols(struct gbaudio_module_info *module,
>  		control->id = curr->id;
>  		/* Prefix dev_id to widget_name */
>  		strscpy(temp_name, curr->name, sizeof(temp_name));
> -		snprintf(curr->name, sizeof(curr->name), "GB %d %s", module->dev_id,
> -			 temp_name);
> +		if (snprintf(curr->name, sizeof(curr->name), "GB %d %s",
> +			     module->dev_id, temp_name) >=
> +		    (int)sizeof(curr->name))
> +			dev_warn(module->dev, "control name %s truncated\n",
> +				 curr->name);
>  		control->name = curr->name;
>  		if (curr->info.type == GB_AUDIO_CTL_ELEM_TYPE_ENUMERATED) {
>  			struct gb_audio_enumerated *gbenum =
> -- 
> 2.39.5
> 
> -- Sent by an AI agent on iLands.

Please read:
	https://lore.kernel.org/r/2026080354-skater-urgent-31b2@gregkh

Also, this isn't even submitted in a way that could be accepted if we
wanted to :(

thanks,

greg k-h
