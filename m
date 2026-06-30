Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEEBF3C9894
	for <linux-staging@lists.linux.dev>; Tue, 30 Jun 2026 12:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782821619; cv=none; b=SOuez1MkxmEckIiqTtNcc2Ef5H+qZdimIIcceVid6rZ3BM2yZgouqYLaCjJiIcUY4xPwTv5QbHVmQv+dMhS6HBgDWqHM+f/owVDcPh1JpSXK/jrBIUbA8K4dG/gAC4MxZYSAJuO/2dgE8AgNR3JGalAJ2yX801A/O4obFlDLS+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782821619; c=relaxed/simple;
	bh=EkTtoqFledxZU9O2TF2oKU/N+Oh0m18upvQnRnw/AM0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hP1N/JTqk9mC+TgReJHRuKpg367TE/U04RhbFv1QcFHsaVNkEG8nzIefWda8Uwl2ZepN6iVcdakHiNV0lEVqdBvxuQOM8K9+dW7sacm+04R/BgKPwAH2+Q0tUBq3eHjoHsDX1081x70lB0GHVuz6VME8LL6tWg8B59GNPHfSWn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l0n3Fo8A; arc=none smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l0n3Fo8A"
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-488b3fd8d0dso1996069b6e.1
        for <linux-staging@lists.linux.dev>; Tue, 30 Jun 2026 05:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782821617; x=1783426417; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BIdV6zIifVX8xXJTc1qP/yM+e/D3Xonrexw/DMWskVo=;
        b=l0n3Fo8An6tDwm4gesRAmlpZB9lCOg4IzMfZgjIIVAeXDiZsPtcN4PfVKk0JA/b7Zu
         FtA2Hg4jMk5rhKy6Qi+rahxMkMh+tsuK7YgfdAWLt7lJmsNDl1qnBG91476P5SUthlRL
         cmF7ggVPS1f5i6ACy9956ijuHfXtcrfA7qUiL7sKHP+D6D1/Q6PAZzcnuAV13oQ0uAsD
         dMzJaRVoEaNXUanPlNgoP4uGRO0Tc3uCRaseOGqW5c0sQyXSa2Vfhx6y4EuyGvxYsv6h
         S0G7FW5Lx1F97MZ//fPV25QihwoIR+hEV1ntjWwrNCfVtWXWSIX+XgAJiDN8+WfLKc5X
         Ri8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782821617; x=1783426417;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BIdV6zIifVX8xXJTc1qP/yM+e/D3Xonrexw/DMWskVo=;
        b=aBCaW/lNEYVKNs9/C1k2e+0vNQZf3F64jiPuAw3iYX926SbEVRnD9w4dirumnj8fv9
         lbt3iUyCITkMP0iNXXgP0ptxoiCeu2eK9LQeY6Xg3y9jHZ2Vi4iaWjAVNmWzocaJZQpw
         wGphRw2vuVWjJficLuh7dB0K+qI9Q94kqY8EDVNsPS4VOBJho5p6fz90ym5mHvzkDJ+o
         IFkRgTRgNdYNYIpzuvJg6G3tHaqQASUiG66ensa3fTzJKMUdzfmlAsQkrrxm8Q3GjFEs
         fItPwzTFRgMiDLCH5ENg58DAApmkSL++U0yGno2IiqpnaE00sDybicWvEg6Rt5+CmSIE
         d55g==
X-Forwarded-Encrypted: i=1; AFNElJ/fiqR/ioS1LYXZ0Q/erKJ613ZZkHsOQn2Kfb2N6xujQ8JL5PseI0iJJbnT7zGnR1DyZnsM5UmPatspAVi9@lists.linux.dev
X-Gm-Message-State: AOJu0YxDmt3/9q2XWdDGqjqiVs0tu4ed1bZa5WlMczF4Od60SzrM68EE
	273UitZRsaaufn5Y3DUa8j1NCKgwRPu107Qe2aPvAd4ojHFmIvW1TZkQ
X-Gm-Gg: AfdE7cmO5exWnuugkwF8h0LHO41BvDFDSxkDqmmBJ+73MXKaS3C7Mr89fo65QNyK/Vl
	uMNlsGmjQwnClc1zAN+vdNq+qOpkkZitBZMu6SyP25r+uXgt3F6y7EK7DpkVU8haH2Hh5io6VRF
	eIijsSX0lw0CFmOSXYiiNz5PCufniIo0KWYlYiMWrIilhOQd79/+7E2Eqau58Ui5Wdgh4koOx4q
	e9kfc+PQ4xrsxcqCHpiOODh3uu4nVtIHl5T69L1LCFDJ5xZUBD7yE9xde6k6j7QlKrhlbeOWzGt
	ygj4TYZEHqWt6fdLPTuaDLV2agS/g2Ykv64myI+2k3/bQy7wTpZA9KI3CP7tQOLvPHf+qjmadVI
	7H+lj3qW5hq4fc163ml8tp/hdK/glzNnjiUeM0JeZeV4Abc9GUwo/m/jySw/QPQqsc/SHFPVeta
	zBJI2jaA==
X-Received: by 2002:a05:6808:318e:b0:489:6c24:9d26 with SMTP id 5614622812f47-495fd72d80dmr81857b6e.27.1782821616728;
        Tue, 30 Jun 2026 05:13:36 -0700 (PDT)
Received: from localhost ([74.80.182.100])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-49354e517dfsm8484496b6e.11.2026.06.30.05.13.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 05:13:34 -0700 (PDT)
Date: Tue, 30 Jun 2026 15:13:28 +0300
From: Dan Carpenter <error27@gmail.com>
To: adi25charis@gmail.com
Cc: vaibhav.sr@gmail.com, mgreer@animalcreek.com, johan@kernel.org,
	elder@kernel.org, gregkh@linuxfoundation.org,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: audio: split topology get into size
 and data calls
Message-ID: <akOy6ORYkzHxodYU@stanley.mountain>
References: <20260629144941.33818-1-adi25charis@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260629144941.33818-1-adi25charis@gmail.com>

On Mon, Jun 29, 2026 at 08:19:41PM +0530, adi25charis@gmail.com wrote:
> From: Aditya Chari S <adi25charis@gmail.com>
> 
> gb_audio_gb_get_topology() combined three separate responsibilities
> into a single call: querying the topology size, allocating a buffer
> for it, and fetching the topology data into that buffer. This left
> callers with no way to perform any of these steps independently, and
> forced the kzalloc() allocation to live inside the protocol-layer
> driver rather than the caller, as already flagged by a FIXME comment
> at the call site in audio_module.c.
> 
> Split the function into two:
> 
>   gb_audio_gb_get_topology_size() - queries only the topology size
>   gb_audio_gb_get_topology()      - fetches topology data into a
>                                      caller-supplied buffer of a
>                                      given size
> 
> Update the only caller, gb_audio_probe() in audio_module.c, to query
> the size first, allocate the topology buffer itself, then fetch the
> data into it, freeing the buffer via the existing free_topology error
> path on failure.
> 
> This resolves both the "TODO: Split into separate calls" comment
> above the original function in audio_gb.c and the FIXME comment at
> the call site in audio_module.c, both of which are removed as part
> of this change.
> 
> No functional change in behavior for the existing probe path.
> 
> Compile-tested with W=1, sparse (C=2), and checkpatch.pl; all clean
> on the three changed files (audio_gb.c, audio_module.c, audio_codec.h).

Put this sort of meta commentary under the --- cut off line.
Also compile the whole module, not just the modified files.

> 
> Signed-off-by: Aditya Chari S <adi25charis@gmail.com>
> ---
  ^^^

>  drivers/staging/greybus/audio_codec.h  |  4 +++-
>  drivers/staging/greybus/audio_gb.c     | 33 ++++++++++----------------
>  drivers/staging/greybus/audio_module.c | 21 +++++++++++-----
>  3 files changed, 31 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/staging/greybus/audio_codec.h b/drivers/staging/greybus/audio_codec.h
> index f3f7a7ec6..be5a2a86b 100644
> --- a/drivers/staging/greybus/audio_codec.h
> +++ b/drivers/staging/greybus/audio_codec.h
> @@ -178,8 +178,10 @@ int gbaudio_register_module(struct gbaudio_module_info *module);
>  void gbaudio_unregister_module(struct gbaudio_module_info *module);
>  
>  /* protocol related */
> +int gb_audio_gb_get_topology_size(struct gb_connection *connection,
> +				  u16 *size);

Please store sizes in size_t.

>  int gb_audio_gb_get_topology(struct gb_connection *connection,
> -			     struct gb_audio_topology **topology);
> +			     struct gb_audio_topology *topology, u16 size);
>  int gb_audio_gb_get_control(struct gb_connection *connection,
>  			    u8 control_id, u8 index,
>  			    struct gb_audio_ctl_elem_value *value);
> diff --git a/drivers/staging/greybus/audio_gb.c b/drivers/staging/greybus/audio_gb.c
> index 9d8994fdb..e6356643d 100644
> --- a/drivers/staging/greybus/audio_gb.c
> +++ b/drivers/staging/greybus/audio_gb.c
> @@ -8,13 +8,10 @@
>  #include <linux/greybus.h>
>  #include "audio_codec.h"
>  
> -/* TODO: Split into separate calls */
> -int gb_audio_gb_get_topology(struct gb_connection *connection,
> -			     struct gb_audio_topology **topology)
> +int gb_audio_gb_get_topology_size(struct gb_connection *connection,
> +				  u16 *size)
>  {
>  	struct gb_audio_get_topology_size_response size_resp;
> -	struct gb_audio_topology *topo;
> -	u16 size;
>  	int ret;
>  
>  	ret = gb_operation_sync(connection, GB_AUDIO_TYPE_GET_TOPOLOGY_SIZE,
> @@ -22,24 +19,20 @@ int gb_audio_gb_get_topology(struct gb_connection *connection,
>  	if (ret)
>  		return ret;
>  
> -	size = le16_to_cpu(size_resp.size);
> -	if (size < sizeof(*topo))
> -		return -ENODATA;
> -
> -	topo = kzalloc(size, GFP_KERNEL);
> -	if (!topo)
> -		return -ENOMEM;
> +	*size = le16_to_cpu(size_resp.size);
>  
> -	ret = gb_operation_sync(connection, GB_AUDIO_TYPE_GET_TOPOLOGY, NULL, 0,
> -				topo, size);
> -	if (ret) {
> -		kfree(topo);
> -		return ret;
> -	}
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(gb_audio_gb_get_topology_size);
>  
> -	*topology = topo;
> +int gb_audio_gb_get_topology(struct gb_connection *connection,
> +			     struct gb_audio_topology *topology, u16 size)
> +{
> +	if (size < sizeof(*topology))
> +		return -ENODATA;

This check should be done in gb_audio_probe() before the kzalloc().

>  
> -	return 0;
> +	return gb_operation_sync(connection, GB_AUDIO_TYPE_GET_TOPOLOGY, NULL, 0,
> +				 topology, size);
>  }
>  EXPORT_SYMBOL_GPL(gb_audio_gb_get_topology);
>  
> diff --git a/drivers/staging/greybus/audio_module.c b/drivers/staging/greybus/audio_module.c
> index 12c376c47..1163cf093 100644
> --- a/drivers/staging/greybus/audio_module.c
> +++ b/drivers/staging/greybus/audio_module.c
> @@ -239,6 +239,7 @@ static int gb_audio_probe(struct gb_bundle *bundle,
>  	struct gb_audio_manager_module_descriptor desc;
>  	struct gbaudio_data_connection *dai, *_dai;
>  	int ret, i;
> +	u16 size;
>  	struct gb_audio_topology *topology;
>  
>  	/* There should be at least one Management and one Data cport */
> @@ -304,16 +305,24 @@ static int gb_audio_probe(struct gb_bundle *bundle,
>  	}
>  	gbmodule->dev_id = gbmodule->mgmt_connection->intf->interface_id;
>  
> -	/*
> -	 * FIXME: malloc for topology happens via audio_gb driver
> -	 * should be done within codec driver itself
> -	 */
> -	ret = gb_audio_gb_get_topology(gbmodule->mgmt_connection, &topology);
> +	ret = gb_audio_gb_get_topology_size(gbmodule->mgmt_connection, &size);
>  	if (ret) {
> -		dev_err(dev, "%d:Error while fetching topology\n", ret);
> +		dev_err(dev, "%d:Error while fetching topology size\n", ret);
> +		goto disable_connection;
> +	}
> +
> +	topology = kzalloc(size, GFP_KERNEL);
> +	if (!topology) {
> +		ret = -ENOMEM;
>  		goto disable_connection;
>  	}
>  
> +	ret = gb_audio_gb_get_topology(gbmodule->mgmt_connection, topology, size);

It's unfortunate that we don't save the size anywhere.  This code
relies on trusting the firmware for its security.  It would be better
to move away from that.

> +	if (ret) {
> +		dev_err(dev, "%d:Error while fetching topology\n", ret);

This is a weird format for a warning.  Normally it %d would come last.
I see that you copied the other printk from earlier, but don't do that.
Only copy good code, not the weirdo stuff.

regards,
dan carpenter

> +		goto free_topology;
> +	}
> +
>  	/* process topology data */
>  	ret = gbaudio_tplg_parse_data(gbmodule, topology);
>  	if (ret) {
> -- 
> 2.53.0
> 
